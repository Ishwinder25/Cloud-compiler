
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import vmm.RDBMS_TO_JSON;


public class mysharedcode extends HttpServlet
{
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        PrintWriter out = response.getWriter();
        String email = request.getSession().getAttribute("emailid").toString();
        String lang = request.getParameter("lang");

        String mainjson = new RDBMS_TO_JSON().generateJSON("select *   from share_codes where owner='" + email + "'and lang=+'" + lang + "'");
        out.println(mainjson);
    }
}