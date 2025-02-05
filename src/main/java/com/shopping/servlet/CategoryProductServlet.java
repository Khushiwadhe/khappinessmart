package com.shopping.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.dao.ProductDao;
import com.shopping.model.Product;

@WebServlet("/categoryProducts")
public class CategoryProductServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private ProductDao productDao;

    @Override
    public void init() {
        Connection connection = (Connection) getServletContext().getAttribute("DBConnection");
        productDao = new ProductDao();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String categoryIdParam = request.getParameter("categoryId");
            if (categoryIdParam != null) {
                int categoryId = Integer.parseInt(categoryIdParam);
                List<Product> products = productDao.getProductsByCategoryId(categoryId);
                request.setAttribute("products", products);
                request.getRequestDispatcher("categoryProduct.jsp").forward(request, response);
            } else {
                response.sendRedirect("shop.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
}