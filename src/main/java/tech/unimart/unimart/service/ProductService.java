package tech.unimart.unimart.service;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.Part;
import tech.unimart.unimart.dao.ProductDAO;
import tech.unimart.unimart.model.Product;
import tech.unimart.unimart.model.ProductDetail;
import tech.unimart.unimart.model.ProductItem;
import tech.unimart.unimart.utils.UUIDUtil;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ProductService {

    private final ProductDAO productDAO;

    public ProductService() {
        this.productDAO = new ProductDAO();
    }

    public List<Product> getAllProducts() {
        return productDAO.getAllProducts();
    }

    public List<Product> filterProducts(String sort, List<String> categories) {
        try {
            return productDAO.filterProducts(sort, categories);
        } catch (Exception e) {
            e.printStackTrace();
            return new ArrayList<>();
        }
    }
    

    public ProductDetail getProductDetailsById(String productId) {
        try {
            Product product = productDAO.getProductById(productId);
            List<ProductItem> productItems = productDAO.getProductItemsByProductId(productId);
            return new ProductDetail(product, productItems);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public String processProduct(String name, String category, String about, boolean isClassified, String classHeader, int totalClass, List<Part> parts, Map<String, String[]> parameterMap, String storeId, HttpServletRequest request) {
        try {
            String productId = UUIDUtil.generateRandomUUID(6);
            List<String> imageNames = saveImages(parts, productId, request);

            if (!isClassified) {
                double priceOnly = Double.parseDouble(parameterMap.get("price-only")[0]);
                int quantityOnly = Integer.parseInt(parameterMap.get("quantity-only")[0]);
                String productItemId = UUIDUtil.generateRandomUUID(6);
                productDAO.addProductItem(productItemId, productId, new HashMap<>(), priceOnly, quantityOnly);
                productDAO.addProduct(productId, name, category, about, imageNames, storeId, priceOnly);
            } else {
                double averagePrice = 0;

                for (int i = 1; i <= totalClass; i++) {
                    String classValue = parameterMap.get("product-class-" + i)[0];
                    double price = Double.parseDouble(parameterMap.get("product-price-" + i)[0]);
                    int quantity = Integer.parseInt(parameterMap.get("product-quantity-" + i)[0]);
                    Map<String, Object> attributes = new HashMap<>();
                    attributes.put(classHeader, classValue);
                    String productItemId = UUIDUtil.generateRandomUUID(6);
                    productDAO.addProductItem(productItemId, productId, attributes, price, quantity);
                    averagePrice += Double.parseDouble(parameterMap.get("product-price-" + i)[0]);
                }
                averagePrice /= totalClass;
                productDAO.addProduct(productId, name, category, about, imageNames, storeId, averagePrice);
            }
            return "success";
        } catch (Exception e) {
            e.printStackTrace();
            return "Failed to add product: " + e.getMessage();
        }
    }

    private List<String> saveImages(List<Part> parts, String productId, HttpServletRequest request) {
        String UPLOAD_DIRECTORY = request.getServletContext().getRealPath("/") + "static/images/products";

        List<String> imageNames = new ArrayList<>();
        int imageCounter = 1; // Use this to name uploaded images correctly

        // Create the directory if it does not exist
        File uploadDirFile = new File(UPLOAD_DIRECTORY);
        if (!uploadDirFile.exists()) {
            uploadDirFile.mkdirs();
        }


        for (Part part : parts) {
            // Log for debugging purposes
//            System.out.println(part.getName() + " " + part.getSize() + " " + part.getContentType() + " " + part.getSubmittedFileName());

            // Check if the part is a file upload (has a submitted file name and non-zero size)
            if (part.getSubmittedFileName() != null && part.getSize() > 0) {
                String fileName = productId + "_" + imageCounter + ".jpg";
                String filePath = UPLOAD_DIRECTORY + File.separator + fileName;
                try {
                    part.write(filePath);
                    imageNames.add(fileName);
                    imageCounter++; // Increment only for actual uploaded images
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
        return imageNames;
    }

}
