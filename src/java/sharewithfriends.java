import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.util.StringTokenizer;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import vmm.DBLoader;
import java.util.Date;
import java.text.SimpleDateFormat;
public class sharewithfriends extends HttpServlet
{
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
      response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        try
        {
            String email=request.getSession().getAttribute("emailid").toString();
            String language=request.getParameter("language");
            String s=request.getParameter("s");
            String codeid=request.getParameter("codeid");
            SimpleDateFormat sdf=new SimpleDateFormat("dd-MM-YYYY HH:mm");
            String datetime=sdf.format(new Date());
            StringTokenizer st=new StringTokenizer(s,";");
            while(st.hasMoreTokens())
            {
                String s1=st.nextToken();
                 ResultSet rs = DBLoader.executeQuery("select * from share_codes where shared_with='" + s1 + "'and codeid='" + codeid+"'");
                 if(!rs.next())
                 {
                 
                     rs.moveToInsertRow();
                     rs.updateString("codeid",codeid);
                     rs.updateString("owner", email);
                     rs.updateString("shared_with", s1);
                     rs.updateString("lang", language);
                     rs.updateString("date_time",datetime);
                     rs.insertRow();
                }
            }
            out.println("success");
        }
        catch(Exception ex)
        {
            ex.printStackTrace();
        }
    }
}

