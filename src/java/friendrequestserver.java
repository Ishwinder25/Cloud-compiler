
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import vmm.DBLoader;


public class friendrequestserver extends HttpServlet 
{
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
         response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        try
        {
            String femail=request.getParameter("femail");
            String uemail=request.getParameter("uemail");
            String pending = null;
            ResultSet rs = DBLoader.executeQuery("select * from friends where request_from=\'" + uemail + "\'and request_to=\'" + femail + "\'and status=\'"+pending+"\'");
            if(rs.next())
            {
                out.println("request already sent");
            }
            else
            {
                rs.moveToInsertRow();
                rs.updateString("request_from",uemail);
                rs.updateString("request_to", femail);
                rs.updateString("status","pending");
                rs.insertRow();
                out.println("success");
            }
            
            
        }
        catch(Exception ex)
        {
            ex.printStackTrace();
        }
    }
}