
import java.io.*;
import java.sql.ResultSet;
import java.util.Collection;
import javax.servlet.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.*;
import vmm.DBLoader;

@MultipartConfig
public class usersignup extends HttpServlet {

    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");

        PrintWriter out = response.getWriter();

        try {

            // Receive ALL Files  
            Part p1 = request.getPart("photo");

            String abspath = getServletContext().getRealPath("/myuploads/myuploads");

            String filename1 = vmm.FileUploader.savefileonserver(p1, abspath, System.currentTimeMillis() + ".jpg");

            // Now receive text data
            String emailid, password, fname, gender, question, answer;
            int mobileno;

            emailid = request.getParameter("emailid");
            password = request.getParameter("password");
            fname = request.getParameter("fname");
            gender = request.getParameter("gender");
            mobileno = Integer.parseInt(request.getParameter("mobileno"));
            question = request.getParameter("question");
            answer = request.getParameter("answer");

            ResultSet rs = DBLoader.executeQuery("select * from users where emailid='" + emailid + "'");

            if (rs.next()) {
                out.println("<h2>Email Already taken</h2>");
            } else {
                rs.moveToInsertRow();

                rs.updateString("emailid", emailid);
                rs.updateString("password", password);
                rs.updateString("Fullname", fname);
                rs.updateString("Gender", gender);
                rs.updateInt("Mobileno", mobileno);
                rs.updateString("Photo", "myuploads/" + filename1);
                rs.updateString("Question", question);
                rs.updateString("Answer", answer);

                rs.insertRow();

                out.println("New record Added to Database");
            }

        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

}
