

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import vmm.DBLoader;

public class user_save extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        try {
            String title = request.getParameter("title");
            String language = request.getParameter("lang");

            HttpSession session = request.getSession();
            String filename = session.getAttribute("filename").toString();
            String email = session.getAttribute("emailid").toString();
            String code = "alluserdata/" + email + "/" + language + "/" + filename + getExt(language);
            ResultSet rs = DBLoader.executeQuery("select * from usercodes where emailid='" + email +"'");
            boolean  flag = false;
            while(rs.next())
            {
                if(rs.getString("title").equals(title) || rs.getString("code").equals(code))
                {
                    flag = true;
                    break;
                }
            }
            if (flag==true) {
                out.println("the same title exists");
            } else {
                rs.moveToInsertRow();
                rs.updateString("title", title);
                rs.updateString("lang", language);
                rs.updateString("code", code);
                rs.updateString("emailid", email);
                rs.insertRow();
                out.println("success");

            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    private String getExt(String lang) {
        String ext = "";
        if (lang.equalsIgnoreCase("java")) {
            ext = ".java";
        } else if (lang.equalsIgnoreCase("c")) {
            ext = ".c";
        } else if (lang.equalsIgnoreCase("cpp")) {
            ext = ".cpp";
        } else {
            ext = ".py";
        }
        return ext;
    }
}
