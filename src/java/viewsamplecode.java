
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import vmm.RDBMS_TO_JSON;


public class viewsamplecode extends HttpServlet {

    
    

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
         HttpSession session=request.getSession();
         response.setContentType("text/html");
        PrintWriter out = response.getWriter();
       
        String language=request.getParameter("language");
        String mainjson = new RDBMS_TO_JSON().generateJSON("select * from sample_codes where language=\'" + language + "\'" );
        out.println(mainjson);
        
    }
}