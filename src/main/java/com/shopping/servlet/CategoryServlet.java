package com.shopping.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.dao.CategoryDao;
import com.shopping.model.Category;


@WebServlet("/categories")
public class CategoryServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private CategoryDao categoryDao;

    public void init() {
        categoryDao = new CategoryDao();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Category> categories = null;
		try {
			categories = categoryDao.getAllCategories();
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
        request.setAttribute("categories", categories);
        request.getRequestDispatcher("/categories.jsp").forward(request, response);
    }
}
