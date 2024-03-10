package tech.unimart.unimart.dao;

import com.mongodb.client.*;
import com.mongodb.client.model.*;
import com.mongodb.client.result.UpdateResult;
import org.bson.Document;
import org.bson.conversions.Bson;
import tech.unimart.unimart.context.MongoDBContext;
import tech.unimart.unimart.model.Order;
import tech.unimart.unimart.model.OrderItem;

import java.util.*;
import java.util.stream.Collectors;

public class OrderDAO {
    private final MongoDatabase database;
    private final MongoClient mongoClient = MongoDBContext.getMongoClient();

    private final ProductDAO productDAO = new ProductDAO();
    private final CartDAO cartDAO = new CartDAO();

    public OrderDAO() {
        MongoDBContext dbContext = new MongoDBContext();
        this.database = dbContext.getDatabase();
    }

    public List<Order> getOrdersByStoreId(String storeId) {
        List<Order> orders = new ArrayList<>();
        MongoCollection<Document> ordersCollection = database.getCollection("Orders");

        // Query orders that have items belonging to the specified storeId
        Bson match = Aggregates.match(Filters.elemMatch("items", Filters.eq("store_id", storeId)));
        List<Bson> aggregation = List.of(match);

        AggregateIterable<Document> aggregatedOrders = ordersCollection.aggregate(aggregation);

        for (Document doc : aggregatedOrders) {
            Order order = documentToOrder(doc);
            orders.add(order);
        }

        return orders;
    }

    public List<Order> getOrdersByUserId(String userId) {
        List<Order> orders = new ArrayList<>();
        MongoCollection<Document> ordersCollection = database.getCollection("Orders");
        FindIterable<Document> orderDocs = ordersCollection.find(Filters.eq("user_id", userId));

        for (Document doc : orderDocs) {
            Order order = documentToOrder(doc);
            orders.add(order);
        }

        return orders;
    }

    public Order getOrderById(String orderId) {
        MongoCollection<Document> ordersCollection = database.getCollection("Orders");
        Document orderDoc = ordersCollection.find(Filters.eq("order_id", orderId)).first();

        if (orderDoc != null) {
            return documentToOrder(orderDoc);
        } else {
            return null;
        }
    }

    private Order documentToOrder(Document doc) {
        Order order = new Order();
        order.setOrderId(doc.getString("order_id"));
        order.setUserId(doc.getString("user_id"));
        order.setSubTotal(doc.getDouble("sub_total"));
        order.setShipping(doc.getDouble("shipping"));
        order.setTax(doc.getDouble("tax"));
        order.setTotal(doc.getDouble("total"));
        order.setOrderDate(doc.getDate("order_date"));
        // Convert the list of items from Document to OrderItem objects
        List<Document> itemsDoc = (List<Document>) doc.get("items");
        List<OrderItem> items = itemsDoc.stream().map(this::documentToOrderItem).collect(Collectors.toList());
        order.setItems(items);

        return order;
    }

    private OrderItem documentToOrderItem(Document doc) {
        OrderItem item = new OrderItem();
        // Set item fields from the document
        item.setProductId(doc.getString("product_id"));
        item.setProductItemId(doc.getString("product_item_id"));
        item.setQuantity(doc.getInteger("quantity"));
        item.setPrice(doc.getDouble("price"));
        item.setProductName(doc.getString("product_name"));
        item.setProductImage(doc.getString("product_image"));
        item.setStoreId(doc.getString("store_id"));
        item.setAttributes(doc.get("attributes", Map.class));
        return item;
    }

    public boolean createOrderAndAdjustStock(Order order) {
        ClientSession session = mongoClient.startSession();
        try {
            session.startTransaction();

            // Add order
            if (!addOrder(order, session)) {
                session.abortTransaction();
                return false;
            }

            // Adjust stock for each OrderItem
            for (OrderItem item : order.getItems()) {
                if (!decreaseStockForProductItem(item.getProductItemId(), item.getQuantity(), session)) {
                    session.abortTransaction();
                    return false;
                }
            }

            // Clear the user's cart
            if (!clearCartForUser(order.getUserId(), session)) {
                session.abortTransaction();
                return false;
            }

            session.commitTransaction();
            return true;
        } catch (Exception e) {
            session.abortTransaction();
            e.printStackTrace();
            return false;
        } finally {
            session.close();
        }
    }

    public boolean clearCartForUser(String userId, ClientSession session) {
        MongoCollection<Document> cartCollection = database.getCollection("Carts");
        // Assuming each user has a single cart document, we'll update that document to have an empty items array
        Bson filter = Filters.eq("user_id", userId);
        // Set the items field to an empty list
        Bson updateOperation = Updates.set("items", Collections.emptyList());
        UpdateResult result = cartCollection.updateOne(session, filter, updateOperation);

        return result.wasAcknowledged() && result.getModifiedCount() > 0;
    }

    public boolean decreaseStockForProductItem(String productItemId, int quantityToDecrease, ClientSession session) {
        MongoCollection<Document> productItemsCollection = database.getCollection("ProductItems");
        Document updateResult = productItemsCollection.findOneAndUpdate(session,
                Filters.eq("id", productItemId),
                Updates.inc("stock", -quantityToDecrease),
                new FindOneAndUpdateOptions().returnDocument(ReturnDocument.AFTER));

        return updateResult != null;
    }

    public boolean addOrder(Order order, ClientSession session) {
        MongoCollection<Document> ordersCollection = database.getCollection("Orders");
        List<Document> itemsDocument = order.getItems().stream().map(item -> new Document("product_id", item.getProductId())
                .append("product_item_id", item.getProductItemId())
                .append("quantity", item.getQuantity())
                .append("price", item.getPrice())
                .append("product_name", item.getProductName())
                .append("product_image", item.getProductImage())
                .append("store_id", item.getStoreId())
                .append("attributes", new Document(item.getAttributes())) // Convert Map to Document
        ).collect(Collectors.toList());

        Document orderDoc = new Document("order_id", order.getOrderId())
                .append("user_id", order.getUserId())
                .append("items", itemsDocument)
                .append("sub_total", order.getSubTotal())
                .append("shipping", order.getShipping())
                .append("tax", order.getTax())
                .append("total", order.getTotal())
                .append("order_date", new Date());

        try {
            ordersCollection.insertOne(session, orderDoc);
            return true;
        } catch (Exception e) {
            System.err.println("Error adding order to database: " + e.getMessage());
            return false;
        }
    }
}
