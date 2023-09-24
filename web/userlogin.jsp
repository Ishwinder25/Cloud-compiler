<%-- 
    Document   : userlogin
    Created on : 28 Apr, 2020, 10:53:46 AM
    Author     : hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <script src="js/jquery-3.5.0.min.js" type="text/javascript"></script>
        <script src="js/bootstrap.js" type="text/javascript"></script>
        <script>
            function go()
            {

                var emailid = document.getElementById("emailid").value;
                var password = document.getElementById("password").value;
                if (emailid == "" || password == "")
                {
                    alert("All Feilds are mendatory");
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
                                alert("Login Successfull");
                                window.location.href = "userhome.jsp";
                            } else
                            {
                                alert("Login Failed");
                            }
                        }
                    };
                    // Step 2
                    xhttp.open("GET", "./userloginserver?emailid=" + emailid + "&password=" + password, true);    // true --> async request

                    // Step 3
                    xhttp.send();
                }

            }
            function forget()
            {
                var emailid = document.getElementById("email").value;
                var question = document.getElementById("question").value;
                var answer = document.getElementById("answer").value;
                if (emailid == "" || question == "" || answer == "")
                {
                    alert("All feilds are mendatory");
                } else
                {

                    // Generate AJAX Request to Fetch Data from Server
                    document.getElementById("btnforget").enabled = false;
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
                                document.getElementById("btnforget").enabled = true;
                            }
                        }
                    };
                    // Step 2
                    xhttp.open("GET", "./forgetpasswordserver?email=" + emailid + "&question=" + question + "&answer=" + answer, true);    // true --> async request

                    // Step 3
                    xhttp.send();
                }

            }


        </script>
    </head>

    <body style="background-image: url('myuploads/myuploads/1588238327507.jpg')">
        <%@include file="publicheader.jsp" %>
        <div class="container">
            <div class="row">
                <div class="col-md-6 offset-md-3" style="border: solid 2px #ff3333; border-radius:  5px; padding: 20px">
                    <center><h1 style="color: #ff6666">LOGIN</h1></center>

                    <form action="#" method="get">
                        <div class="form-group form-row">
                            <label for="emailid" class="col-sm-3">EMAIL ID</label>
                            <input type="text" id="emailid" name="emailid" class="form-control focus col-sm-9" placeholder="Enter username"/>
                        </div><br><br>
                        <div class="form-group form-row">
                            <label for="password" class="col-sm-3">PASSWORD</label>
                            <input type="password" id="password" name="password" class="form-control focus col-sm-9" placeholder="Enter password"/>
                        </div>
                    </form>
                    <br>
                    <input type="button" value="Login"  class="btn btn-primary offset-md-3" onclick="go()"/><br>
                    <br>
                    <button class="btn btn-light btn-link" onclick="showphotodialog2()" >Forget password?</button> 
                    <a href="signup.jsp" style="font-size: 15px; float: right">Not Signed In Yet?Register Here.....</a>
                </div>
            </div>



            <!-- Model Popup Code -->
            <modal id="myModal1" class="modal fade" role="dialog">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title">FORGET PASSWORD?</h4>
                            <button type="button" class="close" data-dismiss="modal">&times</button>
                        </div>
                        <div class="modal-body">
                            <form id="form1" method="GET">
                                <div class="form-group form-row">
                                    <label for="email" class="col-sm-3">EMAIL ID</label>
                                    <input type="text" name="email" id="email" class="form-control col-sm-9"/> 
                                </div>
                                <div class="form-group form-row">
                                    <label for="question" class="col-md-3 control-label"> QUESTION</label>
                                    <div class="col-md-9">
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
                        </div>
                        <div class="modal-footer">
                            <input type="button" id="btnforget" class="btn btn-success" value="Recover Password" onclick="forget()" />
                            <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </modal>
        </div>

        <script>
            function showphotodialog2()
            {
                $(document).ready(function ()
                {

                    $("#myModal1").modal('show');
                });
            }
        </script>



        <%@include  file="footer.jsp" %>
    </body>
</html>
