import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

import vmm.DBLoader;


public class NewServlet extends HttpServlet
{
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
                                                            throws ServletException, IOException 
    {
        
        // Step 1
        response.setContentType("text/html");
        
        // Step 2
        PrintWriter out = response.getWriter();
        
        try
        {
            String q = request.getParameter("q");
            
            // JDBC Code
            ResultSet rs = DBLoader.executeQuery("select * from users where Fullname like \'"+q+"%\'");
        

            String ans="";
            
            while(rs.next())
            {
               ans = ans + rs.getString("Fullname")+", ";
            }
            
            out.println(ans);
 
        }
        catch(Exception ex)
        {
            ex.printStackTrace();
        }
    }
}
