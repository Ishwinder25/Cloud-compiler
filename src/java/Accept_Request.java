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
public class Accept_Request extends HttpServlet {

   protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            HttpSession session = request.getSession();

            response.setContentType("text/html");
            PrintWriter out = response.getWriter();

            String email = request.getParameter("email");
            String email1 = request.getParameter("email1");

            String status = "friends";

            ResultSet rs = DBLoader.executeQuery("Select * from friends where request_from ='" + email + "'and request_to='" + email1 + "'");

            if (rs.next()) {

                rs.updateString("status", status);
                rs.updateRow();
            }
            rs.moveToInsertRow();
            rs.updateString("request_from", email1);
            rs.updateString("request_to", email);
            rs.updateString("status", status);
            rs.insertRow();

            out.println("Accepted");

        } catch (Exception ex) {
            ex.printStackTrace();
        }

    }

}
