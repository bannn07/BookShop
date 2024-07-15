/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controllers;

import dal.DAOShipInfor;
import dal.DAOUsers;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Map;
import models.Book;
import models.CartItems;
import models.ShippingInformations;
import models.User;

/**
 *
 * @author TDG
 */
public class CartContact extends HttpServlet {
   
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
        
        HttpSession session = request.getSession(true);
        
        DAOShipInfor daoShipInfor = new DAOShipInfor();
//        DAOUsers daoUsers = new DAOUsers();
        
        User user = (User) session.getAttribute("user");
        session.setAttribute("user", user);
        if(user==null){
            response.sendRedirect("login");
        }else{

//            int userId = 1;
//            User user = daoUsers.getAll("Select * from users where user_id = "+userId).get(0);
//            session.setAttribute("user", user);


            Map<CartItems, Book> cartItemBookMap = (Map<CartItems, Book>) session.getAttribute("cartItemBookMap");


            if (cartItemBookMap == null || cartItemBookMap.isEmpty()) {
                // If cartItemBookMap is null, redirect to the cartdetails page to ensure it's set
                response.sendRedirect("cartdetails");
                return;
            }
            
            //
            ArrayList<ShippingInformations> listShipInfor = new ArrayList<>();
            
            String service = request.getParameter("service");
            if(service == null){
                service = "listAll";
            }
            if(service.equals("listAll")){
                listShipInfor = daoShipInfor.getAll("select * from shipping_info where user_id ="+user.getUserId());
                session.setAttribute("listShipInfor", listShipInfor);
            }

            RequestDispatcher dispth = request.getRequestDispatcher("./views/cartcontact.jsp");
            dispth.forward(request, response);
            
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
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
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
