
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

public class add_comment extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        try {

            HttpSession session = request.getSession();
            String email = session.getAttribute("emailid").toString();
            String codeid = request.getParameter("codeid");
            SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-YYYY HH:mm");
            String datetime = sdf.format(new Date());
            String comment = request.getParameter("comment");
            ResultSet rs = DBLoader.executeQuery("select * from comments");

            rs.moveToInsertRow();
            rs.updateString("codeid", codeid);
            rs.updateString("comment", comment);
            rs.updateString("comment_by", email);
            rs.updateString("date_time", datetime);
            rs.insertRow();
            out.println("comment added");

        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
}
