package tech.unimart.unimart.model;

import java.util.Map;

public class OrderItem {
    private String productId;
    private String productItemId;
    private int quantity;
    private double price;
    private String productName;
    private String productImage;
    private String storeId;
    private Map<String, String> attributes;

    public OrderItem() {
    }

    public OrderItem(String productId, String productItemId, int quantity, double price, String productName, String productImage, String storeId, Map<String, String> attributes) {
        this.productId = productId;
        this.productItemId = productItemId;
        this.quantity = quantity;
        this.price = price;
        this.productName = productName;
        this.productImage = productImage;
        this.storeId = storeId;
        this.attributes = attributes;
    }

    public String getProductId() {
        return productId;
    }

    public void setProductId(String productId) {
        this.productId = productId;
    }

    public String getProductItemId() {
        return productItemId;
    }

    public void setProductItemId(String productItemId) {
        this.productItemId = productItemId;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getProductImage() {
        return productImage;
    }

    public void setProductImage(String productImage) {
        this.productImage = productImage;
    }

    public String getStoreId() {
        return storeId;
    }

    public void setStoreId(String storeId) {
        this.storeId = storeId;
    }

    public Map<String, String> getAttributes() {
        return attributes;
    }

    public void setAttributes(Map<String, String> attributes) {
        this.attributes = attributes;
    }

    @Override
    public String toString() {
        return "OrderItem{" +
                "productId='" + productId + '\'' +
                ", productItemId='" + productItemId + '\'' +
                ", quantity=" + quantity +
                ", price=" + price +
                ", productName='" + productName + '\'' +
                ", productImage='" + productImage + '\'' +
                ", storeId='" + storeId + '\'' +
                ", attributes=" + attributes +
                '}';
    }
}
