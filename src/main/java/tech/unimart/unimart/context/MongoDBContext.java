package tech.unimart.unimart.context;

import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoClients;
import com.mongodb.client.MongoDatabase;

public class MongoDBContext {

    private static MongoClient mongoClient = null;
    private MongoDatabase database;

    public MongoDBContext() {
        try {
            if (mongoClient == null) {
                String connectionString = "mongodb+srv://linhpksw:Bmcmc20@unimart.6zyvsqo.mongodb.net/unimartDB?retryWrites=true&w=majority";
                mongoClient = MongoClients.create(connectionString);
            }
            database = mongoClient.getDatabase("unimartDB");
        } catch (Exception ex) {
            ex.printStackTrace();
            // Handle exceptions appropriately
        }
    }

    // For testing or debugging
    public static void main(String[] args) {
        MongoDBContext dbContext = new MongoDBContext();
        MongoDatabase db = dbContext.getDatabase();
        if (db != null) {
            System.out.println("MongoDB connection successful to database: " + db.getName());
        } else {
            System.out.println("MongoDB connection failed");
        }
    }

    public static MongoClient getMongoClient() {
        return mongoClient;
    }

    public MongoDatabase getDatabase() {
        return database;
    }
}
