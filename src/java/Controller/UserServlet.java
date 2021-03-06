/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.User;
import model.UserDAO;

/**
 *
 * @author fpd
 */
@WebServlet(name = "categoryservlet", urlPatterns = {"/UserServlet"})
public class UserServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String pass = request.getParameter("pass");
        String action = request.getParameter("action");

        UserDAO userDAO = new UserDAO();
        if (action.equalsIgnoreCase("add")) {
            HttpSession session = request.getSession();
            try (PrintWriter out = response.getWriter()) {
                User user = new User(username, email, pass);
                try {
                    if (userDAO.addUser(user) > 0) {
                        session.setAttribute("DANGKY", "OK");
                        response.sendRedirect("");
                    } else {
                        session.setAttribute("DANGKY", "FAIL");
                        response.sendRedirect("");
                    }
                } catch (SQLException ex) {

                }
            }
        }
//        if (action.equalsIgnoreCase("del")) {
//            cateDAO.del(id);
//            request.getRequestDispatcher("category.jsp").forward(request, response);
//        }
//        if (action.equalsIgnoreCase("edit")) {
//            category ct1 = cateDAO.findCategoryByID(id);
//            request.setAttribute("CATEGORY", ct1);
//            request.getRequestDispatcher("category.jsp").forward(request, response);
//        }
//        if (action.equalsIgnoreCase("update")) {
//            cateDAO.update(name, id);
//            request.getRequestDispatcher("category.jsp").forward(request, response);
//        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
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
     *
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
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
