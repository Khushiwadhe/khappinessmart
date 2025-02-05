package com.shopping.servlet;

import java.io.IOException;
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

@WebServlet("/profile")
public class ProfileServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private OrderDao orderDao;

    @Override
    public void init() {
        orderDao = new OrderDao();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user != null) {
            try {
                List<Order> orders = orderDao.getOrdersByUserId(user.getId());
                user.setOrders(orders);
                session.setAttribute("user", user);
                request.getRequestDispatcher("profile.jsp").forward(request, response);
            } catch (Exception e) {
                e.printStackTrace();
                response.sendRedirect("login.jsp?error=Error fetching profile. Please try again.");
            }
        } else {
            response.sendRedirect("login.jsp?error=Please login to view profile.");
        }
    }
}