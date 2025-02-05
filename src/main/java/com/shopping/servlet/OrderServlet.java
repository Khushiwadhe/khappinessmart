package com.shopping.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shopping.dao.OrderDao;
import com.shopping.model.Order;
import com.shopping.model.User;

@WebServlet("/orders")
public class OrderServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private OrderDao orderDao;

    @Override
    public void init() throws ServletException {
        orderDao = new OrderDao();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("user") != null) {
        	User user = (User) session.getAttribute("user");
            List<Order> orders = null;
			try {
				orders = orderDao.getOrdersByUserId(user.getId());
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
            request.setAttribute("orders", orders);
            request.getRequestDispatcher("orders.jsp").forward(request, response);
        } else {
            response.sendRedirect("login.jsp");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("user") != null) {
            User user = (User) session.getAttribute("user");
            
            // Example: Retrieve order id from request parameter
            int orderId = Integer.parseInt(request.getParameter("orderId"));
            
            // Example: Implement logic to cancel order
            orderDao.cancelOrder(orderId);

            // Redirect to orders page or order details page
            response.sendRedirect(request.getContextPath() + "/orders");
        } else {
            response.sendRedirect("login.jsp");
        }
    }
}