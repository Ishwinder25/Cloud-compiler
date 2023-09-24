/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author singh
 */
public class public_run extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String lang = request.getParameter("lang");
            String args = request.getParameter("args");
            args = args.replaceAll(",", " ");
            String filename = request.getSession().getAttribute("filename").toString();
            String email = "public";
            String abspath = request.getServletContext().getRealPath("/alluserdata");

            abspath += "//" + email + "//" + lang;

            ProcessBuilder pb = null;

            int code;
            System.out.println("abspath : " + abspath);
            File f = new File(abspath);
            if (lang.equalsIgnoreCase("java")) {
                pb = new ProcessBuilder("cmd", "/c", "java -cp \"" + f.getPath() + "\" " + filename + " " + args);
                pb.directory(f);
                pb.environment().put("Path", Path.javacompiler);

            } else if (lang.equalsIgnoreCase("c")) {
                pb = new ProcessBuilder("cmd", "/c", filename + ".exe " + args);
                pb.directory(f);
                pb.environment().put("Path", Path.ccompiler);
            } else if (lang.equalsIgnoreCase("cpp")) {
                pb = new ProcessBuilder("cmd", "/c", filename + ".exe " + args);
                pb.directory(f);
                pb.environment().put("Path", Path.cppcompiler);

            } else { //python
               
            }

            Process p = pb.start();
            code = p.waitFor();
            System.out.println("code : " + code);
            InputStream is;
            InputStream iserror;

            is = p.getInputStream();
            iserror = p.getErrorStream();

            InputStreamReader isr1 = new InputStreamReader(is);
            BufferedReader br1 = new BufferedReader(isr1);

            InputStreamReader isr2 = new InputStreamReader(iserror);
            BufferedReader br2 = new BufferedReader(isr2);

            String ans = "";
            while ((ans = br1.readLine()) != null) {
                out.println(ans);
            }
            br1.close();

            while ((ans = br2.readLine()) != null) {
                out.println(ans);
            }
            br2.close();

        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

// <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
