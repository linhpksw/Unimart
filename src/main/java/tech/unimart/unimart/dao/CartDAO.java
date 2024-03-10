package tech.unimart.unimart.dao;

import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import com.mongodb.client.model.Filters;
import com.mongodb.client.model.Updates;
import org.bson.Document;
import org.bson.conversions.Bson;
import tech.unimart.unimart.context.MongoDBContext;
import tech.unimart.unimart.model.Cart;
import tech.unimart.unimart.model.CartItem;

import java.util.ArrayList;
import java.util.List;

import static com.mongodb.client.model.Filters.eq;

public class CartDAO {
    private final MongoDatabase database;

    public CartDAO() {
        MongoDBContext dbContext = new MongoDBContext();
        this.database = dbContext.getDatabase();
    }

    public int getProductItemCurrentStock(String productItemId) {
        MongoCollection<Document> productItemsCollection = database.getCollection("ProductItems");
        Document productItem = productItemsCollection.find(Filters.eq("id", productItemId)).first();
        if (productItem != null) {
            return productItem.getInteger("stock", 0);
        }
        return 0;
    }

    public void removeItemFromUserCart(String userId, String productItemId) {
        MongoCollection<Document> cartCollection = database.getCollection("Carts");

        // Pull the item from the items array where productItemId matches
        Bson filter = Filters.eq("user_id", userId);
        Bson updateOperation = Updates.pull("items", new Document("product_item_id", productItemId));
        cartCollection.updateOne(filter, updateOperation);
    }

    public Cart findCartByUserId(String userId) {
        MongoCollection<Document> cartCollection = database.getCollection("Carts");
        Document cartDocument = cartCollection.find(eq("user_id", userId)).first();
        if (cartDocument != null) {
            // Convert Document to Cart model
            return documentToCart(cartDocument);
        }
        return null;
    }

    private Cart documentToCart(Document cartDocument) {
        Cart cart = new Cart();
        cart.setUserId(cartDocument.getString("user_id"));

        List<CartItem> cartItems = new ArrayList<>();
        List<Document> itemsDocument = (List<Document>) cartDocument.get("items");
        if (itemsDocument != null) {
            for (Document itemDoc : itemsDocument) {
                CartItem item = new CartItem();
                item.setProductId(itemDoc.getString("product_id"));
                item.setProductItemId(itemDoc.getString("product_item_id"));
                item.setQuantity(itemDoc.getInteger("quantity"));
                item.setPrice(itemDoc.getDouble("price"));
                item.setStoreId(itemDoc.getString("store_id"));
                cartItems.add(item);
            }
        }
        cart.setItems(cartItems);
        return cart;
    }

    public String addProductToCart(String userId, String productId, String productItemId, int quantity, String storeId) {
        MongoCollection<Document> cartCollection = database.getCollection("Carts");
        Document cart = cartCollection.find(eq("user_id", userId)).first();

        Document productItem = getProductItemByProductItemId(productItemId);

        if (productItem == null) {
            return "Product item not found.";
        }

        // Update existing cart
        if (cart != null) {
            List<Document> items = (List<Document>) cart.get("items");

            boolean itemExists = false;
            for (Document item : items) {
                if (item.getString("product_item_id").equals(productItemId)) {
                    int currentQuantity = item.getInteger("quantity");
                    item.put("quantity", currentQuantity + quantity); // Update quantity
                    itemExists = true;
                    break;
                }
            }

            if (!itemExists) {
                items.add(new Document("product_id", productId)
                        .append("product_item_id", productItemId)
                        .append("quantity", quantity)
                        .append("price", productItem.getDouble("price"))
                        .append("store_id", storeId)
                );
            }
            cartCollection.updateOne(eq("user_id", userId), new Document("$set", new Document("items", items)));
        } else {
            // Create a new cart for the user
            List<Document> items = new ArrayList<>();
            items.add(new Document("product_id", productId)
                    .append("product_item_id", productItemId)
                    .append("quantity", quantity)
                    .append("price", productItem.getDouble("price"))
                    .append("store_id", storeId)
            );
            cartCollection.insertOne(new Document("user_id", userId).append("items", items));
        }

        return "success";
    }

    private Document getProductItemByProductItemId(String productItemId) {
        MongoCollection<Document> productItemsCollection = database.getCollection("ProductItems");
        return productItemsCollection.find(eq("id", productItemId)).first();
    }
}
