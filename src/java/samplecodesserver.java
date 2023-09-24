
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import vmm.DBLoader;

@MultipartConfig
public class samplecodesserver extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        try {
            Part p1 = request.getPart("file");
            String abspath = getServletContext().getRealPath("/myuploads");
            System.out.println("abs path " + abspath);
            String filename1 = vmm.FileUploader.savefileonserver(p1, abspath);
            String language = request.getParameter("language");
            String title = request.getParameter("title");
            ResultSet rs = DBLoader.executeQuery("select * from sample_codes where title=\'" + title + "\'");
            if (rs.next()) {
                out.println("the same title already exists");
            } else {
                rs.moveToInsertRow();
                rs.updateString("language", language);
                rs.updateString("title", title);
                rs.updateString("code_file", "myuploads/" + filename1);
                rs.insertRow();
            }
            out.println("success");
        } catch (Exception ex) {
            ex.printStackTrace();
        }

    }
}
