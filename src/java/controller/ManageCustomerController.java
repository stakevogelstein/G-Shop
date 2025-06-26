/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.ProductDAO;
import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.Vector;
import model.User;

/**
 *
 * @author LOC
 */
public class ManageCustomerController extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ManagerCustomerController</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ManagerCustomerController at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private final String ADMIN_URL = "indexAdmin.jsp";
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
    throws ServletException, IOException {
        
         Vector<User> customers = (new UserDAO()).getAllCustomer();
        String service = req.getParameter("service");

        if (service == null) {
            service = "listAllCustomers";
        }

        if (service.equals("listAllCustomers")) {
            req.setAttribute("manageCustomer", "Yes");
            req.setAttribute("allCustomers", customers);
            req.getRequestDispatcher(ADMIN_URL).forward(req, resp);
        }
        if (service.equals("ban")) {
            int id = Integer.parseInt(req.getParameter("id"));
            (new UserDAO()).banAnUser(id);

            customers = (new UserDAO()).getAllCustomer();
            req.setAttribute("manageCustomer", "Yes");
            req.setAttribute("allCustomers", customers);
            req.getRequestDispatcher(ADMIN_URL).forward(req, resp);
        }
        
        if (service.equals("searchByKeywords")) {
            String keywords = req.getParameter("keywords");

            req.setAttribute("keywords", keywords);
            req.setAttribute("manageCustomer", "Yes");

            customers = (new UserDAO()).getCustomerByName(keywords);

            if (customers == null || customers.isEmpty()) {
                req.setAttribute("notFoundCustomer", "Your keywords do not match with any Customer Name");
                customers = (new UserDAO()).getAllCustomer();
            }

            req.setAttribute("allCustomers", customers);
            req.getRequestDispatcher(ADMIN_URL).forward(req, resp);
        }
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
