/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import vmm.RDBMS_TO_JSON;

/**
 *
 * @author singh 
 */
public class user_codes extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            HttpSession session = request.getSession();

            response.setContentType("text/html");
            PrintWriter out = response.getWriter();

            String lang = request.getParameter("language");
            String email = request.getParameter("email");
            String mainjson = new RDBMS_TO_JSON().generateJSON("select * from usercodes where lang='" + lang + "' and emailid='" + email + "'");
            out.println(mainjson);

        } catch (Exception ex) {
            ex.printStackTrace();
        }

    }

}
