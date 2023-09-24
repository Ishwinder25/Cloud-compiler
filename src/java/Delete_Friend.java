/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import vmm.DBLoader;

/**
 *
 * @author singh
 */
public class Delete_Friend extends HttpServlet {

   protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            HttpSession session = request.getSession();

            response.setContentType("text/html");
            PrintWriter out = response.getWriter();

            String email = request.getParameter("email");
            String email1 = request.getParameter("email1");

            ResultSet rs = DBLoader.executeQuery("Select * from friends where ( request_from='" + email + "' and request_to='" + email1 + "')  or (request_from='" + email1 + "' and request_to='" + email + "')");

            while (rs.next()) {

                rs.deleteRow();
            }

            out.println("unfriend successfully");

        } catch (Exception ex) {
            ex.printStackTrace();
        }

    }
}
