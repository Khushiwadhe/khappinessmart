package com.shopping.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shopping.dao.OrderDao;
import com.shopping.dao.ProductDao;
import com.shopping.model.Order;
import com.shopping.model.Product;
import com.shopping.model.User;

@WebServlet("/checkout")
public class CheckoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private OrderDao orderDao;
    private ProductDao productDao;

    @Override
    public void init() {
        Connection conn = (Connection) getServletContext().getAttribute("DBConnection");
        orderDao = new OrderDao();
        productDao = new ProductDao();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user != null) {
            List<Product> cart = (List<Product>) session.getAttribute("cart");
            if (cart != null && !cart.isEmpty()) {
                double totalAmount = cart.stream().mapToDouble(Product::getPrice).sum();
                String shippingAddress = request.getParameter("shippingAddress");
                String zipcode = request.getParameter("zipcode");
                String city = request.getParameter("city");

                Order order = new Order();
                order.setUserId(user.getId());
                order.setTotalAmount(totalAmount);
                order.setStatus("Processing");
                order.setShippingAddress(shippingAddress);
                order.setZipcode(zipcode);
                order.setCity(city);
                order.setProducts(cart);

                try {
                    orderDao.createOrder(order);
                    session.removeAttribute("cart");
                    session.setAttribute("order", order);
                    response.sendRedirect("orderConfirmation.jsp");
                } catch (Exception e) {
                    e.printStackTrace();
                    response.sendRedirect("checkout.jsp?error=Error placing order. Please try again.");
                }
            } else {
                response.sendRedirect("cart.jsp?error=Cart is empty.");
            }
        } else {
            response.sendRedirect("login.jsp?error=Please login to place an order.");
        }
    }
}  