<%-- 
    Document   : forgotpassword
    Created on : 1 May, 2020, 11:32:57 AM
    Author     : hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <script>
            function forget()
            {
                document.getElementById("emailid").value;
                document.getElementById("question").value;
                document.getElementById("answer").value;
                if (emailid == "" || question == "" || answer == "")
                {
                    alert("All feilds are mendatory");
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
                            if (res == "success")
                            {
                                alert("Password sent on registered email");
                                window.location.href = "userlogin.jsp";
                            } else
                            {
                                alert(" Failed");
                            }
                        }
                    };
                    // Step 2
                    xhttp.open("GET", "./forgetpasswordserver?emailid=" + emailid + "&question=" + question + "&answer=" + answer, true);    // true --> async request

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
                    <center><h1 style="color: #ff6666">FORGET PASSWORD?</h1></center>
                    <form id="form1" method="GET">
                        <div class="form-group form-row">
                            <label for="emailid" class="col-sm-3">EMAIL ID</label>
                            <input type="text" name="emailid" id="emailid" class="form-control col-sm-9"/> 
                        </div>
                        <div class="form-group form-row">
                            <label for="question" class="col-md-4 control-label">SECURITY QUESTION</label>
                            <div class="col-md-4">
                                <select id="question" name="question" class="form-control">
                                    <option> WHAT IS MY NAME</option>
                                    <option>WHERE DO YOU LIVE</option>
                                    <option>YOUR HOBBIES</option>
                                </select>
                            </div>
                        </div>    
                        <div class="form-group form-row">
                            <label for="answer" class="col-sm-3">ANSWER</label>
                            <input type="text" name="answer" id="answer" class="form-control col-sm-9"/> 
                        </div>
                    </form>

                    <input type="button" value="Change Password"  class="btn btn-primary offset-md-3" onclick="forget()"/><br>
                </div>
            </div>
        </div>
            <%@include file="footer.jsp" %>
    </body>
</html>
