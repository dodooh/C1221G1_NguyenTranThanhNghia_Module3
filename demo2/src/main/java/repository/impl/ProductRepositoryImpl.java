package repository.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Product;
import repository.IProductRepository;

public class ProductRepositoryImpl implements IProductRepository {
    private final String SELECT_ALL_PRODUCTS = "select product_id, product_name, price, quantity, color, category_id from product_m3.product";
    private final String SELECT_PRODUCTS_BY_ID = "select product_id, product_name, price, quantity, color, category_id from product_m3.product where product_id = ?";
    private final String DELETE_PRODUCTS_BY_ID = "delete from product_m3.product where product_id = ?";
    private final String INSERT_PRODUCT_SQL = "insert into product_m3.product (product_name, price, quantity, color, category_id) VALUES (?, ?, ?, ?, ?)";
    private final BaseRepository baseRepository = BaseRepository.getInstance();

    @Override
    public List<Product> selectAll() {
        List<Product> productList = new ArrayList<>();
        // Step 1: Establishing a Connection
        try (Connection connection = baseRepository.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_PRODUCTS);) {
            ResultSet rs = preparedStatement.executeQuery();
            Product product = null;
            while (rs.next()) {
                product = new Product();
                product.setProductId(rs.getInt("product_id"));
                product.setProductName(rs.getString("product_name"));
                product.setPrice(rs.getDouble("price"));
                product.setQuantity(rs.getInt("quantity"));
                product.setColor(rs.getString("color"));
                product.setCategoryId(rs.getInt("category_id"));
                productList.add(product);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return productList;
    }

    @Override
    public boolean insertOne(Product product) {
        boolean result = false;
        try (Connection connection = baseRepository.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_PRODUCT_SQL)) {
// select customer_id, customer_name, date_of_birth, gender, identify_number, phone_number, email, address, customer_type_id from customer
            preparedStatement.setString(1, product.getProductName());
            preparedStatement.setObject(2, product.getPrice());
            preparedStatement.setInt(3, product.getQuantity());
            preparedStatement.setString(4, product.getColor());
            preparedStatement.setInt(5, product.getCategoryId());
            result = preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            printSQLException(e);
        }
        return result;
    }

    @Override
    public Product findById(Integer customerId) {
        // Step 1: Establishing a Connection
        Product product = null;
        try (Connection connection = baseRepository.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_PRODUCTS_BY_ID);) {
            preparedStatement.setInt(1, customerId);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                product = new Product();
                product.setProductId(rs.getInt("product_id"));
                product.setProductName(rs.getString("product_name"));
                product.setPrice(rs.getDouble("price"));
                product.setQuantity(rs.getInt("quantity"));
                product.setColor(rs.getString("color"));
                product.setCategoryId(rs.getInt("category_id"));
                return product;
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return product;
    }

    @Override
    public boolean deleteOne(Integer customerId) {
        boolean result = false;
        try (Connection connection = baseRepository.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE_PRODUCTS_BY_ID)) {
// select customer_id, customer_name, date_of_birth, gender, identify_number, phone_number, email, address, customer_type_id from customer
            preparedStatement.setInt(1, customerId);
            result = preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            printSQLException(e);
        }
        return result;
    }

    private void printSQLException(SQLException ex) {
        for (Throwable e : ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }
}
