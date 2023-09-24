
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import vmm.DBLoader;
import vmm.SimpleMailDemo;

public class forgetpasswordserver extends HttpServlet {
@Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String email, question, answer;
        try {
            email = request.getParameter("email");
            question = request.getParameter("question");
            answer = request.getParameter("answer");
            ResultSet rs = DBLoader.executeQuery("select * from users where emailid='" + email + "' and Question='" + question + "' and Answer='" + answer + "'");
            

            if (rs.next()) {

                String subject = "Password Recover For My Cloud Compiler";
                String body = "Your password for cloud compiler is " + rs.getString("password");
                SimpleMailDemo smd = new SimpleMailDemo(email, subject, body);

                out.println("Success");
            } else {

                out.println("client crendetials failed");
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }

    }

}
