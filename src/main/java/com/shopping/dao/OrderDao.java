package com.shopping.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.shopping.model.CartItem;
import com.shopping.model.Order;
import com.shopping.model.Product;
import com.shopping.util.DbUtil;

public class OrderDao {
	private Connection conn;

    public OrderDao() {
        conn = DbUtil.getConnection();
    }
    
    public void createOrder(Order order) throws SQLException {
        String orderQuery = "INSERT INTO orders (user_id, total_amount, status, shipping_address, zipcode, city) VALUES (?, ?, ?, ?, ?, ?)";
        try (PreparedStatement preparedStatement = conn.prepareStatement(orderQuery, Statement.RETURN_GENERATED_KEYS)) {
            preparedStatement.setInt(1, order.getUserId());
            preparedStatement.setDouble(2, order.getTotalAmount());
            preparedStatement.setString(3, order.getStatus());
            preparedStatement.setString(4, order.getShippingAddress());
            preparedStatement.setString(5, order.getZipcode());
            preparedStatement.setString(6, order.getCity());
            preparedStatement.executeUpdate();

            try (ResultSet generatedKeys = preparedStatement.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    order.setId(generatedKeys.getInt(1));
                }
            }
        }

        String productQuery = "INSERT INTO order_products (order_id, product_id) VALUES (?, ?)";
        try (PreparedStatement preparedStatement = conn.prepareStatement(productQuery)) {
            for (Product product : order.getProducts()) {
                preparedStatement.setInt(1, order.getId());
                preparedStatement.setInt(2, product.getId());
                preparedStatement.addBatch();
            }
            preparedStatement.executeBatch();
        }
    }

    public List<Order> getOrdersByUserId(int userId) throws SQLException {
        List<Order> orders = new ArrayList<>();
        String query = "SELECT * FROM orders WHERE user_id = ?";
        try (PreparedStatement preparedStatement = conn.prepareStatement(query)) {
            preparedStatement.setInt(1, userId);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                while (resultSet.next()) {
                    Order order = new Order();
                    order.setId(resultSet.getInt("id"));
                    order.setUserId(resultSet.getInt("user_id"));
                    order.setTotalAmount(resultSet.getDouble("total_amount"));
                    order.setStatus(resultSet.getString("status"));
                    order.setShippingAddress(resultSet.getString("shipping_address"));
                    order.setZipcode(resultSet.getString("zipcode"));
                    order.setCity(resultSet.getString("city"));
                    order.setProducts(getProductsByOrderId(order.getId()));
                    orders.add(order);
                }
            }
        }
        return orders;
    }

    private List<Product> getProductsByOrderId(int orderId) throws SQLException {
        List<Product> products = new ArrayList<>();
        String query = "SELECT p.id, p.name, p.description, p.price, p.category_id FROM products p " +
                       "JOIN order_products op ON p.id = op.product_id WHERE op.order_id = ?";
        try (PreparedStatement preparedStatement = conn.prepareStatement(query)) {
            preparedStatement.setInt(1, orderId);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                while (resultSet.next()) {
                    Product product = new Product();
                    product.setId(resultSet.getInt("id"));
                    product.setName(resultSet.getString("name"));
                    product.setDescription(resultSet.getString("description"));
                    product.setPrice(resultSet.getDouble("price"));
                    product.setCategoryId(resultSet.getInt("category_id"));
                    products.add(product);
                }
            }
        }
        return products;
    }
    
	/*
	 * public boolean placeOrder(Order order) { boolean success = false; String
	 * sqlOrder =
	 * "INSERT INTO orders (user_id, shipping_address, city, zip_code) VALUES (?, ?, ?, ?)"
	 * ; String sqlOrderItem =
	 * "INSERT INTO order_items (order_id, product_id, quantity) VALUES (?, ?, ?)";
	 * try { conn.setAutoCommit(false);
	 * 
	 * // Insert order details try (PreparedStatement stmtOrder =
	 * conn.prepareStatement(sqlOrder, PreparedStatement.RETURN_GENERATED_KEYS)) {
	 * stmtOrder.setInt(1, order.getUserId()); stmtOrder.setString(2,
	 * order.getShippingAddress()); stmtOrder.setString(3, order.getCity());
	 * stmtOrder.setString(4, order.getZipcode()); int rowsInsertedOrder =
	 * stmtOrder.executeUpdate();
	 * 
	 * // Retrieve auto-generated order ID ResultSet rs =
	 * stmtOrder.getGeneratedKeys(); int orderId = -1; if (rs.next()) { orderId =
	 * rs.getInt(1); }
	 * 
	 * // Insert order items int rowsInsertedItems = 0; try (PreparedStatement
	 * stmtOrderItem = conn.prepareStatement(sqlOrderItem)) { for (CartItem cartItem
	 * : order.getCartItems()) { stmtOrderItem.setInt(1, orderId);
	 * stmtOrderItem.setInt(2, cartItem.getProductId()); stmtOrderItem.setInt(3,
	 * cartItem.getQuantity()); rowsInsertedItems += stmtOrderItem.executeUpdate();
	 * } }
	 * 
	 * if (rowsInsertedOrder > 0 && rowsInsertedItems == order.getProducts().size())
	 * { success = true; } else { conn.rollback(); // Rollback if insertion failed }
	 * }
	 * 
	 * conn.commit(); } catch (SQLException e) { e.printStackTrace(); try {
	 * conn.rollback(); } catch (SQLException ex) { ex.printStackTrace(); } }
	 * finally { try { conn.setAutoCommit(true); } catch (SQLException e) {
	 * e.printStackTrace(); } } return success; }
	 */

    
    public List<CartItem> getCartItemsByOrderId(int orderId) {
        List<CartItem> cartItems = new ArrayList<>();
        String sql = "SELECT * FROM order_items WHERE order_id = ?";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, orderId);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                CartItem cartItem = new CartItem(
                        rs.getInt("id"),
                        rs.getInt("order_id"),
                        rs.getInt("product_id"),
                        rs.getInt("quantity")
                );
                cartItems.add(cartItem);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return cartItems;
    }

    public boolean cancelOrder(int orderId) {
        boolean success = false;
        String sqlDeleteOrder = "DELETE FROM orders WHERE id = ?";
        String sqlDeleteOrderItems = "DELETE FROM order_items WHERE order_id = ?";
        try {
            conn.setAutoCommit(false);

            // Delete order items
            try (PreparedStatement stmtDeleteItems = conn.prepareStatement(sqlDeleteOrderItems)) {
                stmtDeleteItems.setInt(1, orderId);
                int rowsDeletedItems = stmtDeleteItems.executeUpdate();

                // Delete order
                try (PreparedStatement stmtDeleteOrder = conn.prepareStatement(sqlDeleteOrder)) {
                    stmtDeleteOrder.setInt(1, orderId);
                    int rowsDeletedOrder = stmtDeleteOrder.executeUpdate();

                    if (rowsDeletedOrder > 0 && rowsDeletedItems > 0) {
                        success = true;
                    } else {
                        conn.rollback(); // Rollback if deletion failed
                    }
                }
            }

            conn.commit();
        } catch (SQLException e) {
            e.printStackTrace();
            try {
                conn.rollback();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        } finally {
            try {
                conn.setAutoCommit(true);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return success;
    }
}    