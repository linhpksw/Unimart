package tech.unimart.unimart.dao;

import com.mongodb.client.FindIterable;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import com.mongodb.client.model.Filters;
import com.mongodb.client.model.Sorts;
import org.bson.Document;
import org.bson.conversions.Bson;
import org.bson.types.ObjectId;
import tech.unimart.unimart.context.MongoDBContext;
import tech.unimart.unimart.model.Product;
import tech.unimart.unimart.model.ProductDetail;
import tech.unimart.unimart.model.ProductItem;

import java.util.*;

import static com.mongodb.client.model.Filters.eq;

public class ProductDAO {
    private final MongoDatabase database;

    public ProductDAO() {
        MongoDBContext dbContext = new MongoDBContext();
        this.database = dbContext.getDatabase();
    }

    public List<Product> searchProducts(String searchKeyword) {
        List<Product> productList = new ArrayList<>();
        MongoCollection<Document> collection = database.getCollection("Products");

        // Use the text search feature of MongoDB. Ensure you have a text index on the fields you want to search.
        Bson searchCondition = Filters.text(searchKeyword);

        FindIterable<Document> documents = collection.find(searchCondition);

        for (Document doc : documents) {
            Product product = documentToProduct(doc);
            productList.add(product);
        }

        return productList;
    }
    
    public List<ProductDetail> getProductsByStoreId(String storeId) {
        List<ProductDetail> productDetailsList = new ArrayList<>();
        MongoCollection<Document> productCollection = database.getCollection("Products");
        FindIterable<Document> products = productCollection.find(eq("store_id", storeId));

        for (Document productDoc : products) {
            Product product = documentToProduct(productDoc);
            List<ProductItem> productItems = getProductItemsByProductId(product.getId());
            ProductDetail productDetail = new ProductDetail(product, productItems);
            productDetailsList.add(productDetail);
        }

        return productDetailsList;
    }

    public List<Product> getAllProducts() {
        List<Product> productList = new ArrayList<>();
        MongoCollection<Document> collection = database.getCollection("Products");
        FindIterable<Document> documents = collection.find();

        for (Document doc : documents) {
            Product product = documentToProduct(doc);
            productList.add(product);
        }

        return productList;
    }

    public Product getProductById(String productId) {
        MongoCollection<Document> productCollection = database.getCollection("Products");
        Document productDoc = productCollection.find(eq("id", productId)).first();
        return productDoc != null ? documentToProduct(productDoc) : null;
    }

    public ProductItem getProductItemById(String productItemId) {
        MongoCollection<Document> productItemsCollection = database.getCollection("ProductItems");
        Document productItemDoc = productItemsCollection.find(eq("id", productItemId)).first();
        return productItemDoc != null ? documentToProductItem(productItemDoc) : null;
    }

    private Product documentToProduct(Document doc) {
        Product product = new Product();
        product.setId(doc.getString("id"));
        product.setName(doc.getString("name"));
        product.setCategory(doc.getString("category"));
        product.setDescription(doc.getString("description"));
        product.setImages(doc.getList("images", String.class));
        product.setStoreId(doc.getString("store_id"));
        product.setAveragePrice(doc.getDouble("average_price"));
        product.setCreatedAt(doc.getDate("created_at"));
        product.setUpdatedAt(doc.getDate("updated_at"));
        return product;
    }

    private ProductItem documentToProductItem(Document doc) {
        ProductItem productItem = new ProductItem();
        productItem.setId(doc.getString("id"));
        productItem.setProductId(doc.getString("product_id"));
        productItem.setAttributes(doc.get("attributes", Map.class));
        productItem.setPrice(doc.getDouble("price"));
        productItem.setStock(doc.getInteger("stock"));
        return productItem;
    }

    public List<ProductItem> getProductItemsByProductId(String productId) {
        MongoCollection<Document> collection = database.getCollection("ProductItems");
        List<ProductItem> productItemList = new ArrayList<>();
        FindIterable<Document> documents = collection.find(eq("product_id", productId));

        for (Document doc : documents) {
            Map<String, String> attributes;
            Object attributesObj = doc.get("attributes");

            if (attributesObj instanceof Map) {
                attributes = (Map<String, String>) attributesObj;
            } else {
                attributes = new HashMap<>();
            }

            ProductItem productItem = new ProductItem(
                    doc.getString("id"),
                    doc.getString("product_id"),
                    attributes,
                    doc.getDouble("price"),
                    doc.getInteger("stock")
            );
            productItemList.add(productItem);
        }

        return productItemList;
    }

    public List<Product> filterProducts(String sort, List<String> categories) {
        List<Product> productList = new ArrayList<>();
        MongoCollection<Document> collection = database.getCollection("Products");

        Bson filter = categories.isEmpty() || categories.contains("All categories")
                ? new Document()
                : Filters.in("category", categories);

        Bson sortCriteria = new Document(); // Default sort

        switch (sort) {
            case "newest":
                sortCriteria = Sorts.descending("createdDate");
                break;
            case "most-popular":
                // Define your logic for most-popular
                break;
            case "best-rating":
                // Define your logic for best-rating
                break;
            case "price-low-high":
                sortCriteria = Sorts.ascending("average_price");
                break;
            case "price-high-low":
                sortCriteria = Sorts.descending("average_price");
                break;
        }

        FindIterable<Document> documents = collection.find(filter).sort(sortCriteria);

        for (Document doc : documents) {
            Product product = documentToProduct(doc);
            productList.add(product);
        }

        return productList;
    }

    public void addProduct(String productId, String name, String category, String description, List<String> images, String storeId, double averagePrice) {
        MongoCollection<Document> collection = database.getCollection("Products");

        Date now = new Date(); // Current date and time
        Document product = new Document("_id", new ObjectId())
                .append("id", productId)
                .append("name", name)
                .append("category", category)
                .append("description", description)
                .append("images", images)
                .append("store_id", storeId)
                .append("average_price", averagePrice)
                .append("created_at", now)
                .append("updated_at", now);
        collection.insertOne(product);
    }

    public void addProductItem(String productItemId, String productId, Map<String, Object> attributes, double price, int stock) {
        MongoCollection<Document> collection = database.getCollection("ProductItems");
        Document productItem = new Document("_id", new ObjectId())
                .append("id", productItemId)
                .append("product_id", productId)
                .append("attributes", new Document(attributes))
                .append("price", price)
                .append("stock", stock);
        collection.insertOne(productItem);
    }

    public void updateProduct(String productId, String name, String category, String description, String storeId) {
        MongoCollection<Document> collection = database.getCollection("Products");
        Document update = new Document("$set", new Document()
                .append("name", name)
                .append("category", category)
                .append("description", description)
                .append("store_id", storeId)
                .append("updated_at", new Date()));
        collection.updateOne(eq("id", productId), update);
    }

    public void updateProductItem(String productItemId, double price, int stock) {
        MongoCollection<Document> collection = database.getCollection("ProductItems");
        Document update = new Document("$set", new Document()
                .append("price", price)
                .append("stock", stock));
        collection.updateOne(eq("id", productItemId), update);
    }

    public void deleteProductItem(String productItemId) {
        MongoCollection<Document> collection = database.getCollection("ProductItems");
        collection.deleteOne(Filters.eq("id", productItemId));
    }

    public String getProductIdByProductItemId(String productItemId) {
        MongoCollection<Document> collection = database.getCollection("ProductItems");
        Document productItem = collection.find(Filters.eq("id", productItemId)).first();
        return productItem != null ? productItem.getString("product_id") : null;
    }

    public long getProductItemsCountByProductId(String productId) {
        MongoCollection<Document> collection = database.getCollection("ProductItems");
        return collection.countDocuments(Filters.eq("product_id", productId));
    }

    public void deleteProduct(String productId) {
        MongoCollection<Document> productsCollection = database.getCollection("Products");
        productsCollection.deleteOne(Filters.eq("id", productId));
    }
}
