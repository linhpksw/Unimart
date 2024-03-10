package tech.unimart.unimart.model;

import java.util.List;
import java.util.Map;

public class CartItem {
    private String productId;
    private String productItemId;
    private int quantity;
    private double price;
    private String storeId;

    // New fields for product details
    private String productName;
    private List<String> productImages;
    private Map<String, String> attributes;

    private int stock;

    public CartItem() {
    }

    public CartItem(String productId, String productItemId, int quantity, double price, String storeId, String productName, List<String> productImages, Map<String, String> attributes, int stock) {
        this.productId = productId;
        this.productItemId = productItemId;
        this.quantity = quantity;
        this.price = price;
        this.storeId = storeId;
        this.productName = productName;
        this.productImages = productImages;
        this.attributes = attributes;
        this.stock = stock;
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

    public String getStoreId() {
        return storeId;
    }

    public void setStoreId(String storeId) {
        this.storeId = storeId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public List<String> getProductImages() {
        return productImages;
    }

    public void setProductImages(List<String> productImages) {
        this.productImages = productImages;
    }

    public Map<String, String> getAttributes() {
        return attributes;
    }

    public void setAttributes(Map<String, String> attributes) {
        this.attributes = attributes;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    @Override
    public String toString() {
        return "CartItem{" +
                "productId='" + productId + '\'' +
                ", productItemId='" + productItemId + '\'' +
                ", quantity=" + quantity +
                ", price=" + price +
                ", storeId='" + storeId + '\'' +
                ", productName='" + productName + '\'' +
                ", productImages=" + productImages +
                ", attributes=" + attributes +
                ", stock=" + stock +
                '}';
    }
}
