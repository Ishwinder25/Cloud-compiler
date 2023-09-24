
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import vmm.DBLoader;

import javax.servlet.http.HttpSession;

public class userloginserver extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String emailid, password;
        try {
            emailid = request.getParameter("emailid");
            password = request.getParameter("password");

            ResultSet rs = DBLoader.executeQuery("select * from users where emailid='" + emailid + "' and password='" + password + "'");

            if (rs.next()) {

                HttpSession session = request.getSession();
                session.setAttribute("emailid", emailid);
                out.println("success");
            } else {

                out.println("Login Failed");

            }

        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

}
