package com.shopping.listener;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

@WebListener
public class DBConnectionListener implements ServletContextListener {
    public void contextInitialized(ServletContextEvent sce) {
        String jdbcUrl = "jdbc:mysql://localhost:3306/grocery_shop";
        String jdbcUser = "root";
        String jdbcPassword = "Krishna@1210";
        try {
            Connection connection = DriverManager.getConnection(jdbcUrl, jdbcUser, jdbcPassword);
            sce.getServletContext().setAttribute("DBConnection", connection);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void contextDestroyed(ServletContextEvent sce) {
        Connection connection = (Connection) sce.getServletContext().getAttribute("DBConnection");
        try {
            if (connection != null && !connection.isClosed()) {
                connection.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
