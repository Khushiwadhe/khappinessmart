package com.shopping.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.dao.CategoryDao;
import com.shopping.model.Category;

@WebServlet("/shop")
public class ShopServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private CategoryDao categoryDao;

    @Override
    public void init() {
        Connection connection = (Connection) getServletContext().getAttribute("DBConnection");
        categoryDao = new CategoryDao();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            List<Category> categories = categoryDao.getAllCategories();
            request.setAttribute("categories", categories);
            request.getRequestDispatcher("shop.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
}