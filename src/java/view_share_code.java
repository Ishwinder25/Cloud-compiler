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
 * @author singh
 */
public class view_share_code extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        String code_id = request.getParameter("codeid");
        String mainjson = new RDBMS_TO_JSON().generateJSON("select *  from usercodes where codeid=+'" + code_id + "'");
        out.println(mainjson);

    }

}
