package com.shopping.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.shopping.model.CartItem;
import com.shopping.util.DbUtil;

public class CartDao {

        private Connection conn;

        public CartDao() {
            conn = DbUtil.getConnection();
        }

        public List<CartItem> getCartItemsByUserId(int userId) {
            List<CartItem> cartItems = new ArrayList<>();
            String sql = "SELECT * FROM cart WHERE user_id = ?";
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setInt(1, userId);
                ResultSet rs = stmt.executeQuery();
                while (rs.next()) {
                    CartItem cartItem = new CartItem(
                            rs.getInt("id"),
                            rs.getInt("user_id"),
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

        public void addToCart(int userId, int productId, int quantity) {
            String sql = "INSERT INTO cart (user_id, product_id, quantity) VALUES (?, ?, ?)";
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setInt(1, userId);
                stmt.setInt(2, productId);
                stmt.setInt(3, quantity);
                stmt.executeUpdate();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        public void clearCart(int userId) {
            String sql = "DELETE FROM cart WHERE user_id = ?";
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setInt(1, userId);
                stmt.executeUpdate();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        // Other methods as needed (e.g., updateCartItem, deleteCartItem, etc.)
    

    
    

    public void addCartItem(CartItem cartItem) {
        try {
            PreparedStatement preparedStatement = conn
                    .prepareStatement("INSERT INTO cart(user_id, product_id, quantity) VALUES (?, ?, ?)");
            preparedStatement.setInt(1, cartItem.getUserId());
            preparedStatement.setInt(2, cartItem.getProductId());
            preparedStatement.setInt(3, cartItem.getQuantity());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    

    public void updateCartItem(CartItem cartItem) {
        try {
            PreparedStatement preparedStatement = conn
                    .prepareStatement("UPDATE cart SET quantity=? WHERE id=?");
            preparedStatement.setInt(1, cartItem.getQuantity());
            preparedStatement.setInt(2, cartItem.getCartItemId());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void removeCartItem(int cartItemId) {
        try {
            PreparedStatement preparedStatement = conn
                    .prepareStatement("DELETE FROM cart WHERE id=?");
            preparedStatement.setInt(1, cartItemId);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void clearCartByUserId(int userId) {
        try {
            PreparedStatement preparedStatement = conn
                    .prepareStatement("DELETE FROM cart WHERE user_id=?");
            preparedStatement.setInt(1, userId);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}