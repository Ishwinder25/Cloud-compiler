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
import vmm.DBLoader;

public class editprofile extends HttpServlet {
@Override
        protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String emailid, fname, gender, question, answer;
        int mobileno;
        try {
            emailid = request.getParameter("emailid");
            fname = request.getParameter("fname");
            gender = request.getParameter("gender");
            mobileno = Integer.parseInt(request.getParameter("mobileno"));

            question = request.getParameter("question");
            answer = request.getParameter("answer");
            out.println(emailid);
            ResultSet rs = DBLoader.executeQuery("select * from users where emailid='" + emailid + "'");
            if (rs.next()) {
                 //out.println("yes");
                rs.updateString("emailid", emailid);

                rs.updateString("Fullname", fname);
                rs.updateString("Gender", gender);
                rs.updateInt("Mobileno", mobileno);
                rs.updateString("Question", question);
                rs.updateString("Answer", answer);

                rs.updateRow();
                out.println("Success");
            } 
            else {
                out.println("<h2>ERROR</h2>");
            }

        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
}
