package tech.unimart.unimart.model;

import java.util.List;

public class ProductDetail {
    private Product product;
    private List<ProductItem> productItems;

    public ProductDetail() {
    }

    public ProductDetail(Product product, List<ProductItem> productItems) {
        this.product = product;
        this.productItems = productItems;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public List<ProductItem> getProductItems() {
        return productItems;
    }

    public void setProductItems(List<ProductItem> productItems) {
        this.productItems = productItems;
    }

    @Override
    public String toString() {
        return "ProductDetail{" +
                "product=" + product +
                ", productItems=" + productItems +
                '}';
    }
}
