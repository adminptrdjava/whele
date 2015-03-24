package Service;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import DAO.MYSQLDbConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Swarnendu
 */
@WebServlet(urlPatterns = {"/TestTing"})
public class TestTing extends HttpServlet {
 MYSQLDbConnection mysql = new MYSQLDbConnection();
        Connection con = mysql.makeConection();
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
        PrintWriter out = response.getWriter();
        try {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet TestTing</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet TestTing at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        } finally {
            out.close();
        }
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
        String setings=null;
         String SQL0=" select sv from setings_tb where sp='BD';";
         // MYSQLDbConnection mysql = new MYSQLDbConnection();
        //Connection con = mysql.makeConection();
         ResultSet rs=null;
         try{
              PreparedStatement ps0=con.prepareStatement(SQL0);
        rs=ps0.executeQuery();
        while(rs.next()){
            setings=rs.getString(1);
            System.out.println("ajax:  "+setings);
                    }
        if(setings.equals("INACTIVE")){
             PrintWriter pw = response.getWriter();
             pw.print("<script> function load_whlIns(){window.location.replace(\"whele.jsp\"); document.getElementById(\"content\").innerHTML='<object type=\"type/html\" data=\"whele.jsp\" ></object>';\n" +
"            window.clearTimeout(); } </script>");
        }
            
         }catch(Exception E){
             
         }
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
