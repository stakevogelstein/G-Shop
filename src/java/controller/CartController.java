package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import model.CartItem;
import model.Product;
import dal.ProductDAO;

public class CartController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("cart.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) action = "";
        
        if (action.equals("add")) {
            int productId = Integer.parseInt(req.getParameter("productId"));
            int quantity = Integer.parseInt(req.getParameter("quantity"));
            ProductDAO productDAO = new ProductDAO();
            Product product = productDAO.getProductsById(productId);
            
            if (product != null) {
                CartItem cartItem = new CartItem(product, quantity);
                List<CartItem> cart = (List<CartItem>) req.getSession().getAttribute("cart");
                if (cart == null) {
                    cart = new java.util.ArrayList<>();
                }
                cart.add(cartItem);
                req.getSession().setAttribute("cart", cart);
            }
        }
        
        resp.sendRedirect("cart.jsp");
    }
}
