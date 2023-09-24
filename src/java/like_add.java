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
import java.util.Date;
import java.text.SimpleDateFormat;

/**
 *
 * @author hp
 */
public class like_add extends HttpServlet {
protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            HttpSession session = request.getSession();

            PrintWriter out = response.getWriter();

            //Part part1= request.getPart("fn");
            String e = session.getAttribute("emailid").toString();
             SimpleDateFormat sdf=new SimpleDateFormat("dd-MM-YYYY HH:mm");
              String datetime=sdf.format(new Date());
            String id = request.getParameter("codeid");
            ResultSet rs = DBLoader.executeQuery("select * from likes");

            rs.moveToInsertRow();
            rs.updateString("email_by", e);
            rs.updateString("codeid", id);
           
            rs.updateString("date_time",datetime);
            rs.insertRow();
            out.println("Like added");

        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

}
