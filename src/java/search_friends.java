import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

import vmm.DBLoader;
import vmm.RDBMS_TO_JSON;


public class search_friends extends HttpServlet
{
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
                                                            throws ServletException, IOException 
    {
        
        // Step 1
        response.setContentType("text/html");
        
        // Step 2
        PrintWriter out = response.getWriter();
        
          try  {
            String val = request.getParameter("value");
            String myemail = request.getSession().getAttribute("emailid").toString();
            String mainjson = new RDBMS_TO_JSON().generateJSON("Select * from users where emailid != '" + myemail + "' and Fullname like '" + val + "%'");
            out.println(mainjson);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        
    }
}
