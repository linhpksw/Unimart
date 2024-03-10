package tech.unimart.unimart.service;

import tech.unimart.unimart.dao.CartDAO;
import tech.unimart.unimart.dao.ProductDAO;
import tech.unimart.unimart.model.*;

public class CartService {
    private final CartDAO cartDAO = new CartDAO();

    private final ProductService productService = new ProductService();
    private final ProductDAO productDAO = new ProductDAO();

    public String validateCartItemsStock(Order cart) {
        for (OrderItem item : cart.getItems()) {
            int currentStock = getProductItemCurrentStock(item.getProductItemId());
            if (item.getQuantity() > currentStock) {
                return String.format("Item %s only has %d left in stock.", item.getProductName(), currentStock);
            }
        }
        // All items have sufficient stock
        return null;
    }

    private int getProductItemCurrentStock(String productItemId) {
        return cartDAO.getProductItemCurrentStock(productItemId);
    }

    public void removeItemFromCart(String userId, String productItemId) {
        cartDAO.removeItemFromUserCart(userId, productItemId);
    }

    public void enrichCartItemDetails(Cart cart) {
        for (CartItem item : cart.getItems()) {
            // Fetch product details
            ProductItem productItem = productDAO.getProductItemById(item.getProductItemId());
            if (productItem != null) {
                Product product = productDAO.getProductById(productItem.getProductId());
                if (product != null) {
                    item.setProductName(product.getName());
                    item.setProductImages(product.getImages());
                    item.setAttributes(productItem.getAttributes());
                    item.setStock(productItem.getStock());
                }
            }
        }
    }

    public Cart getCartByUserId(String userId) {
        try {
            return cartDAO.findCartByUserId(userId);
        } catch (Exception e) {
            e.printStackTrace();
            // Handling error, possibly returning an empty cart or null
            return null;
        }
    }

    public String addProductToCart(String userId, String productId, String productItemId, int quantity, String storeId) {
        try {
            return cartDAO.addProductToCart(userId, productId, productItemId, quantity, storeId);
        } catch (Exception e) {
            e.printStackTrace();
            return "Error adding to cart: " + e.getMessage();
        }
    }


}
