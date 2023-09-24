

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
public class changephotoserver extends HttpServlet {

    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String emailid=request.getSession().getAttribute("emailid").toString();
         try {
            Part p1 = request.getPart("nphoto");
            String abspath = getServletContext().getRealPath("/myuploads");
            System.out.println("abs path " + abspath);
            String filename1 = vmm.FileUploader.savefileonserver(p1, abspath, System.currentTimeMillis() + ".jpg");
           
            ResultSet rs = vmm.DBLoader.executeQuery("select * from users where emailid=\'" + emailid + "\'");
            if (rs.next()) {
                rs.updateString("Photo","myuploads/" + filename1);
                rs.updateRow();
                out.println("success");
            } else {
                out.println("Photo not uploaded");
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }

   
}
}
