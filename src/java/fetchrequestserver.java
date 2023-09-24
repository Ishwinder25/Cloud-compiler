/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import vmm.RDBMS_TO_JSON;

/**
 *
 * @author hp
 */
public class fetchrequestserver extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String emailid=request.getSession().getAttribute("emailid").toString();
        String pending=null;
        String ans=new RDBMS_TO_JSON().generateJSON("select * from friends where request_to='"+ emailid +"' &status='"+ pending+"'");
        out.println(ans);
    }

    

}
