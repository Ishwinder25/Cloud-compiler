/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import vmm.DBLoader;

/**
 *
 * @author singh
 */
public class Friends extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            PrintWriter out = response.getWriter();

            String email = request.getParameter("email");
            String email_f = request.getParameter("email_f");
            String pending = null;
            ResultSet rs = DBLoader.executeQuery("select * from friends where request_from=\'" + email + "\'and request_to=\'" + email_f + "\'and status=\'" + pending + "\'");

            if (rs.next()) {
                out.println("request already sent");
            } else {
                rs.moveToInsertRow();
                rs.updateString("request_from", email);
                rs.updateString("request_to", email_f);
                rs.updateString("status", "pending");
                rs.insertRow();
                out.println("success");
            }

        } catch (Exception ex) {
            ex.printStackTrace();
        }

    }
}
