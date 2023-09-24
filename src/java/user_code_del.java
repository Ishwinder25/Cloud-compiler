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

/**
 *
 * @author singh
 */
public class user_code_del extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        {
            try {

                response.setContentType("text/html");
                PrintWriter out = response.getWriter();

                String codeid = request.getParameter("value");
               
                ResultSet rs = DBLoader.executeQuery("select * from usercodes where codeid='" + codeid + "'");
                
                if (rs.next()) {
                    rs.deleteRow();
                    out.println("Code Deleted");
                }

            } catch (Exception ex) {
                ex.printStackTrace();
            }

        }

    }

}
