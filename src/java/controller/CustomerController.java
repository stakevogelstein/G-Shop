/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.BrandDAO;
import dal.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.Vector;
import model.Brand;
import model.Product;

/**
 *
 * @author LOC
 */
public class CustomerController extends HttpServlet {


    @Override
   protected void doGet(HttpServletRequest req, HttpServletResponse resp)
        throws ServletException, IOException {

    String service = req.getParameter("service");
    String targetPage = req.getParameter("page") != null && req.getParameter("page").equals("showProduct") 
                        ? "showProduct.jsp" : "index.jsp"; // Determine target page

    Vector<Brand> brands = (new BrandDAO()).getAll();
    req.setAttribute("brands", brands);

    if (service == null) {
        service = "listAll";
    }

    if (service.equals("listAll")) {
        Vector<Product> products = (new ProductDAO()).getAll();
        req.setAttribute("products", products);
    }

    if (service.equals("filter-by-brand")) {
        int bid = Integer.parseInt(req.getParameter("bid"));
        Vector<Product> products = (new ProductDAO()).getProductsByBrand(bid);
        req.setAttribute("bid", bid);
        req.setAttribute("products", products);
    }

    if (service.equals("sort-by-price")) {
        String order = req.getParameter("order");
        Vector<Product> products = (new ProductDAO()).sortProductsByPrice(order);
        req.setAttribute("filter", order);
        req.setAttribute("products", products);
    }

    if (service.equals("filter-by-tag")) {
        String tag = req.getParameter("tag");
        Vector<Product> products = (new ProductDAO()).filterByTag(tag);
        req.setAttribute("filter", tag);
        req.setAttribute("products", products);
    }

    if (service.equals("filter-by-search")) {
        String search = req.getParameter("search");
        Vector<Product> products = (new ProductDAO()).filterBySearch(search);
        req.setAttribute("search", search);
        req.setAttribute("products", products);
    }
     if (service.equals("showdetails")) {
        String id_raw = req.getParameter("id");
        int id = Integer.parseInt(id_raw);
        ProductDAO dao = new ProductDAO();
        Product product = dao.getProductsById(id);
        req.setAttribute("product", product);
        req.getRequestDispatcher("showProduct.jsp").forward(req, resp);
        return; 
    }

    req.getRequestDispatcher(targetPage).forward(req, resp);
}

    
    
   

}
