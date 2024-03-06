package tech.unimart.unimart.dao;

import com.mongodb.client.*;
import com.mongodb.client.model.Filters;
import com.mongodb.client.model.Sorts;
import org.bson.Document;
import org.bson.conversions.Bson;
import org.bson.types.ObjectId;
import tech.unimart.unimart.model.Product;
import tech.unimart.unimart.model.ProductItem;

import java.util.*;

import static com.mongodb.client.model.Filters.eq;


public class ProductDAO {
    private static MongoClient mongoClient = null;
    // Make it static if you plan to use a single instance for your application.
    private final MongoDatabase database;

    public ProductDAO() {
        if (mongoClient == null) { // Only initialize the MongoClient once.
            String connectionString = "mongodb+srv://linhpksw:Bmcmc20@unimart.6zyvsqo.mongodb.net/unimartDB?retryWrites=true&w=majority";
            mongoClient = MongoClients.create(connectionString);
        }
        this.database = mongoClient.getDatabase("unimartDB");
    }

    public List<Product> getAllProducts() {
        List<Product> productList = new ArrayList<>();
        MongoCollection<Document> collection = database.getCollection("Products");
        FindIterable<Document> documents = collection.find();

        return getProducts(productList, documents);
    }

    private List<Product> getProducts(List<Product> productList, FindIterable<Document> documents) {
        for (Document doc : documents) {
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
            productList.add(product);
        }
        return productList;
    }


    public Product getProductById(String productId) {
        MongoCollection<Document> collection = database.getCollection("Products");
        FindIterable<Document> documents = collection.find(eq("id", productId));
        List<Product> productList = new ArrayList<>();

        getProducts(productList, documents);
        
        return productList.isEmpty() ? null : productList.get(0);
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

        return getProducts(productList, documents);
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
}
