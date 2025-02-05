package com.shopping.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shopping.dao.UserDao;
import com.shopping.model.User;

@WebServlet("/user")
public class UserServlet extends HttpServlet {
    
	private static final long serialVersionUID = 1L;
	private UserDao userDao;

    @Override
    public void init() throws ServletException {
        userDao = new UserDao();
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("login".equals(action)) {
            handleLogin(request, response);
        } else if ("register".equals(action)) {
            handleRegister(request, response);
        }
    }

    private void handleLogin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        if (userDao.authenticate(email, password)) {
            User user = userDao.getUserByEmail(email);
            HttpSession session = request.getSession();
            session.setAttribute("user", user);
            response.sendRedirect("home.jsp");
        } else {
            request.setAttribute("errorMessage", "Invalid email or password");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }

    private void handleRegister(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String phone = request.getParameter("phone");

        User user = new User();
        user.setName(name);
        user.setEmail(email);
        user.setPassword(password);
        user.setPhone(phone);

        userDao.registerUser(user);
        response.sendRedirect("login.jsp");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("register".equals(action)) {
            request.getRequestDispatcher("register.jsp").forward(request, response);
        } else if ("login".equals(action)) {
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else if ("profile".equals(action)) {
            HttpSession session = request.getSession(false);
            if (session != null && session.getAttribute("user") != null) {
                request.getRequestDispatcher("profile.jsp").forward(request, response);
            } else {
                response.sendRedirect("login.jsp");
            }
        }
    }


   
}