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
public class like_fetch extends HttpServlet {

   protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            HttpSession session = request.getSession();

            PrintWriter out = response.getWriter();

            //Part part1= request.getPart("fn");
            String id = request.getParameter("codeid");
            ResultSet rs = DBLoader.executeQuery("select count(*) as c1 from likes where codeid='" + id + "'");
            int count = 0;
            if (rs.next()) {
               count=rs.getInt("c1");
            }
            out.println(count);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

}
