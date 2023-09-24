
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import vmm.DBLoader;

public class changepasswordserver extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String emailid, oldpassword, newpassword;
        try {
            emailid = request.getParameter("emailid");
            oldpassword = request.getParameter("oldpassword");
            newpassword = request.getParameter("newpassword");
            
            ResultSet rs = DBLoader.executeQuery("select * from users where emailid='" + emailid + "' and password='" + oldpassword + "'");

            if (rs.next()) {

                rs.updateString("password", newpassword);
                rs.updateRow();
                out.println("Success");
            } else {

                out.println("<h2>Old password Incorrect</h2>");
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }

    }

}
