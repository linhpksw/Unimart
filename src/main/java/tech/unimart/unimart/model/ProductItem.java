package tech.unimart.unimart.model;

import java.util.Map;

public class ProductItem {
    private String id;
    private String productId;
    private Map<String, String> attributes;
    private double price;
    private int stock;

    public ProductItem() {
    }

    public ProductItem(String id, String productId, Map<String, String> attributes, double price, int stock) {
        this.id = id;
        this.productId = productId;
        this.attributes = attributes;
        this.price = price;
        this.stock = stock;
    }

    // Getters and Setters
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getProductId() {
        return productId;
    }

    public void setProductId(String productId) {
        this.productId = productId;
    }

    public Map<String, String> getAttributes() {
        return attributes;
    }

    public void setAttributes(Map<String, String> attributes) {
        this.attributes = attributes;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    @Override
    public String toString() {
        return "ProductItem{" +
                "id='" + id + '\'' +
                ", productId='" + productId + '\'' +
                ", attributes=" + attributes +
                ", price=" + price +
                ", stock=" + stock +
                '}';
    }
}
