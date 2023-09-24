<%-- 
    Document   : changepassword
    Created on : 28 Apr, 2020, 2:37:59 PM
    Author     : hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script>
            function go2()
            {
                var emailid = document.getElementById("emailid").value;
                var oldpassword = document.getElementById("oldpassword").value;
                var newpassword = document.getElementById("newpassword").value;
                var confipassword = document.getElementById("confipassword").value;
                if (emailid == "" || oldpassword == "" || newpassword == "")
                {
                    alert("All feilds are mandatory");
                } else if (newpassword != confipassword)
                {
                    alert("PASSWORD DOSEN'T MATCH");
                } else
                {
                    // Generate AJAX Request to Fetch Data from Server

                    // Step 1
                    var xhttp = new XMLHttpRequest();
                    // Step 4 
                    // Callback method
                    // This method is called when server gives answer
                    xhttp.onreadystatechange = function ()
                    {
                        if (xhttp.readyState == 4 && xhttp.status == 200)
                        {
                            var res = xhttp.responseText.trim();
                            if (res == "Success")
                            {
                                alert("Password Changed Successfull");
                                window.location.href = "userlogin.jsp";
                            } else
                            {
                                alert(" invalid old password");
                            }
                        }
                    };
                    // Step 2
                    xhttp.open("GET", "./changepasswordserver?emailid=" + emailid + "&oldpassword=" + oldpassword + "&newpassword=" + newpassword, true);    // true --> async request

                    // Step 3
                    xhttp.send();
                }

            }
        </script>
    </head>
    <body>
        <%@ include file ="userheader.jsp" %>
        <div class="container">
            <div class="row">
                <div class="col-md-6 offset-md-3" style="border: solid 2px #ff3333; border-radius:  5px; padding: 20px">
                    <center><h1 style="color: #ff6666">CHANGE PASSWORD</h1></center><br>

                    <form action="#" method="get">
                        <div class="form-group form-row">
                            <label for="emailid" class="col-sm-3">EMAIL ID</label>
                            <input type="text" id="emailid" name="emailid" readonly=""
                                   value="<%= session.getAttribute("emailid").toString()%>"
                                   class="form-control focus col-sm-9" placeholder="Enter username"/>
                        </div><br>
                        <div class="form-group form-row">
                            <label for="oldpassword" class="col-sm-3">OLD PASSWORD</label>
                            <input type="password" id="oldpassword" name="oldpassword" class="form-control focus col-sm-9" placeholder="Enter old password"/>
                        </div><br>
                        <div class="form-group form-row">
                            <label for="new password" class="col-sm-3">NEW PASSWORD</label>
                            <input type="password" id="newpassword" name="newpassword" class="form-control focus col-sm-9" placeholder="Enter new password"/>
                        </div><br>
                        <div class="form-group form-row">
                            <label for="confipassword" class="col-sm-3">OLD PASSWORD</label>
                            <input type="password" id="confipassword" name="confipassword" class="form-control focus col-sm-9" placeholder="Enter new password"/>
                        </div>
                    </form>
                    <br>
                    <input type="button" value="Change password"  class="btn btn-primary offset-md-3" onclick="go2()"/><br>
                </div>
            </div>
            <%@include file="footer.jsp" %>
    </body>
</html>
