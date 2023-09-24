<%-- 
    Document   : User_Profile
    Created on : 24-Apr-2019, 1:40:48 PM
    Author     : raghavsachdeva123
--%>

<%@page import="vmm.DBLoader"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      
        <title>JSP Page</title>
        <script>
            var xmlhttp;
            function friendRequest() {
                var email = document.getElementById("email").value;
                var email_f = document.getElementById("email_f").value;



                xmlhttp = new XMLHttpRequest();
                xmlhttp.open("GET", "./Friends?email=" + email + "&email_f=" + email_f, true);
                xmlhttp.onreadystatechange = result2;
                xmlhttp.send();


            }
            function result2()
            {


                if (xmlhttp.readyState == 4 && xmlhttp.status == 200)
                {

                    var res = xmlhttp.responseText.trim();

                    window.location.reload();
                }
            }
            function unfriend()
            {
                var email1 = document.getElementById("email").value;
                var email = document.getElementById("email_f").value;


                var ans = confirm('Are you sure you want to Unfriend?');
                if (ans == true)
                {
                    xmlhttp = new XMLHttpRequest();
                    xmlhttp.open("GET", "./Delete_Friend?email=" + email + "&email1=" + email1, true);
                    xmlhttp.onreadystatechange = result12;
                    xmlhttp.send();
                }


            }
            function result12()
            {

                if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {

                    var res = xmlhttp.responseText.trim();
                    alert(res);
                    window.location.reload();


                }
            }
            function Reject()
            {
                var email1 = document.getElementById("email").value;
                var email = document.getElementById("email_f").value;


                var ans = confirm('Are you sure you want to delete?');
                if (ans == true)
                {
                    xmlhttp = new XMLHttpRequest();
                    xmlhttp.open("GET", "./Reject_Request?email=" + email + "&email1=" + email1, true);
                    xmlhttp.onreadystatechange = result16;
                    xmlhttp.send();
                }


            }
            function result16()
            {

                if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {

                    var res = xmlhttp.responseText.trim();
                    alert(res);
                    window.location.reload();
                }


            }
            function accept()
            {
                var email1 = document.getElementById("email").value;
                var email = document.getElementById("email_f").value;

                var ans = confirm('Are you sure you want to Accept?');
                if (ans == true)
                {
                    xmlhttp = new XMLHttpRequest();
                    xmlhttp.open("GET", "./Accept_Request?email=" + email + "&email1=" + email1, true);
                    xmlhttp.onreadystatechange = result17;
                    xmlhttp.send();
                }


            }
            function result17()
            {

                if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {

                    var res = xmlhttp.responseText.trim();
                    alert(res);
                    window.location.reload();


                }



            }







        </script>
    </head>
    <body style="background-color:  white">

        <%@page import="java.sql.ResultSet"%>
        <%
            String email = session.getAttribute("emailid").toString();
            String email_f = request.getParameter("emailid");
            String name = "", photo = "", phone = "";

            ResultSet rs1 = DBLoader.executeQuery("Select * from users where emailid='" + email_f + "'");

            if (rs1.next()) {
                name = rs1.getString("Fullname");
                photo = rs1.getString("Photo");
                phone = rs1.getString("Mobileno");

            }

        %>

        <%@include file="userheader.jsp" %> 
        <input type="hidden" value="<%=session.getAttribute("emailid")%>" id="email" />
        <input type="hidden" value="<%= request.getParameter("emailid")%>" id="email_f" />


        <div clas="container">
            <div class="row" style="margin-top: 20px;">
                <div class="col-md-5 offset-1" style="background-color: #99ffff;height:350px ;border-bottom: solid 1px black ;border-left: solid 1px black ;border-top: solid 1px black  ">

                    <h1><img src="<%=photo%>" width="100" height="100" style="margin-top: 15px " class="img img-thumbnail"></h1>
                    <br>
                    <h1 style="color: #000000"><i class="fa fa-user" style="font-size:36px"></i> Name  : <%= name%></h1>
                    <h1 style="color: #000000">Email : <%= email_f%></h1><br>
                    <h1 style="color: #000000"><i class="fa fa-mobile" style="font-size:36px"></i>Mobile: <%=phone%></h1>


                </div>
                <div class="col-sm-3" style="background-color: #99ffff ;height: 350px;border-bottom: solid 1px black ;border-right: solid 1px black ;border-top: solid 1px black; ">

                    <%
                        if (!email.equals(email_f)) {
                            ResultSet rs3 = DBLoader.executeQuery("Select * from friends where (request_to='" + email_f + "'and request_from='" + email + "') || (request_to='" + email + "'and request_from='" + email_f + "')");
                            if (rs3.next()) {
                                String status = rs3.getString("status");
                                String request_from = rs3.getString("request_from");
                                if (status.equals("friends")) {
                    %>  
                    <br>
                    <br>
                    <br>
                    <br>

                    <input type="button" value="Friends"  class="btn btn-success">
                    <input type="button" value="Unfriend" onclick="unfriend()" class="btn btn-danger">

                    <%
                    } else if (request_from.equals(email)) {

                    %>  
                    <br>
                    <br>
                    <br>
                    <br>
                    <input type="button" value=" Already Sent"  class="btn btn-primary">
                    <%                    } else {
                    %>  
                    <br>
                    <br>
                    <br>
                    <br>
                    <input type="button" value="Accept" onclick="accept()"  class="btn" style="color: white;background-color: #006666">
                    <input type="button" value="Reject" onclick="reject()" class="btn btn-danger">

                    <%
                        }

                    } else {
                    %>  
                    <br>
                    <br>
                    <br>
                    <br>
                    <input type="button" id="request" onclick="friendRequest()" value="Send Request" class="btn" style="color: white;background-color: #006666 ">

                    <%
                            }

                        }

                    %>


                </div>

            </div>
            <hr>
            <div class="row">

                <div class="col-sm-8 offset-1" style="background-color: #99ffff ; border: solid 3px black ">
                    <h1 style="color:  black">WORKS IN</h1>
                </div><br>
                <%ResultSet rs2 = DBLoader.executeQuery("Select distinct lang from usercodes where emailid='" + email_f + "'");
                    String language = "";

                    while (rs2.next()) {

                        language = rs2.getString("lang");

                    }
                %>




            </div>
            <div class="row">
                <div class="col-sm-6 offset-1">
                    <h1  style="color: green"><%= language%></h1><br>
                </div>
            </div>
        </div>
                <%@include file="footer.jsp" %>
    </body>
</html>
