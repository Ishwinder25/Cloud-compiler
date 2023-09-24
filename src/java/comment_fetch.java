
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import vmm.DBLoader;
import vmm.RDBMS_TO_JSON;

public class comment_fetch extends HttpServlet
{
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
       try {
            HttpSession session = request.getSession();
            PrintWriter out = response.getWriter();
            String codeid = request.getParameter("codeid");
           String res = new RDBMS_TO_JSON().generateJSON("select *  from comments where codeid='" + codeid + "'");
          
            out.println(res);
        } 
       catch (Exception ex)
       {
            ex.printStackTrace();
        } 
    }
}