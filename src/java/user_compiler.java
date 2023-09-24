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
public class user_compiler extends HttpServlet {

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

            String lang = request.getParameter("lang").toLowerCase();
            String filename = request.getSession().getAttribute("filename").toString();
            //String email = "public";//
            String email = request.getSession().getAttribute("emailid").toString();
            String abspath = request.getServletContext().getRealPath("/alluserdata");

            abspath += "//" + email + "//" + lang;

            ProcessBuilder pb;

            System.out.println("abspath : " + abspath);
            File f = new File(abspath);
            if (lang.equalsIgnoreCase("java")) {
                pb = new ProcessBuilder("cmd", "/c", "javac " + filename + ".java");
                pb.directory(f);
                pb.environment().put("Path", Path.javacompiler);

                Process p = pb.start();
                int code = p.waitFor();

                InputStream is;
                if (code == 0) {
                    is = p.getInputStream();
                    out.println("File Saved and Compiled Successfully!!!");
                } else {
                    is = p.getErrorStream();
                    File f1 = new File(abspath + "\\" + filename + ".class");
                    if (f1.exists()) {
                        f1.delete();
                    }
                }

                InputStreamReader isr = new InputStreamReader(is);
                BufferedReader br = new BufferedReader(isr);
                String ans = "";
                while ((ans = br.readLine()) != null) {
                    out.println(ans);
                }
                br.close();
            } else if (lang.equalsIgnoreCase("c")) {
                pb = new ProcessBuilder("cmd", "/c", "gcc " + filename + ".c -o " + filename + ".exe");
                pb.directory(f);
                pb.environment().put("Path", Path.ccompiler);

                Process p = pb.start();
                int code = p.waitFor();

                InputStream is;
                if (code == 0) {
                    is = p.getInputStream();
                    out.println("File Saved and Compiled Successfully!!!");
                } else {
                    is = p.getErrorStream();
                    File f1 = new File(abspath + "\\" + filename + ".exe");
                    if (f1.exists()) {
                        f1.delete();
                    }
                }

                InputStreamReader isr = new InputStreamReader(is);
                BufferedReader br = new BufferedReader(isr);
                String ans = "";
                while ((ans = br.readLine()) != null) {
                    out.println(ans);
                }
                br.close();
            } else if (lang.equalsIgnoreCase("cpp")) {
                pb = new ProcessBuilder("cmd", "/c", "g++ " + filename + ".cpp -o " + filename + ".exe");
                pb.directory(f);
                pb.environment().put("Path", Path.cppcompiler);

                Process p = pb.start();
                int code = p.waitFor();

                InputStream is;
                if (code == 0) {
                    is = p.getInputStream();
                    out.println("File Saved and Compiled Successfully!!!");
                } else {
                    is = p.getErrorStream();
                    File f1 = new File(abspath + "\\" + filename + ".exe");
                    if (f1.exists()) {
                        f1.delete();
                    }
                }

                InputStreamReader isr = new InputStreamReader(is);
                BufferedReader br = new BufferedReader(isr);
                String ans = "";
                while ((ans = br.readLine()) != null) {
                    out.println(ans);
                }
                br.close();
            } else //for python
            {
                String args = request.getParameter("args");
                args = args.replace(",", " ");
                pb = new ProcessBuilder("cmd", "/c", "python " + filename + ".py" + " " + args);
                pb.directory(f);
                pb.environment().put("Path", Path.pythoncompiler);

                Process p = pb.start();
                int code = p.waitFor();

                InputStream is;
                if (code == 0) {
                    is = p.getInputStream();
                } else {
                    is = p.getErrorStream();
                    File f1 = new File(abspath + "\\" + filename + ".py");
                    if (f1.exists()) {
                        f1.delete();
                    }
                }
                InputStreamReader isr = new InputStreamReader(is);
                BufferedReader br = new BufferedReader(isr);
                String ans = "";
                while ((ans = br.readLine()) != null) {
                    out.println(ans);
                }
                br.close();
                is.close();
            }

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
