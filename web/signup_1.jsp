<%-- 
    Document   : signup
    Created on : 26 Apr, 2020, 12:01:56 PM
    Author     : hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <script>
            function signup()
            {
                var emailid = document.getElementById("emailid").value;
                var password = document.getElementById("password").value;
                var confipassword = document.getElementById("confipassword").value;
                var fname = document.getElementById("fname").value;

                var gender = "";
                if (document.getElementById("g1").checked)
                {
                    gender = "male";

                } else
                {
                    gender = "female";
                }

                var mobileno = document.getElementById("mobileno").value;

                var photo = document.getElementById("photo").files;

                var question = document.getElementById("question").value;
                var answer = document.getElementById("answer").value;
                if (emailid == "" || password == "" || fname == "" || mobileno == "" || question == "" || answer == "")
                {
                    alert("ALL FEILDS ARE MENDATORY");
                } else if (mobileno.length != 10)
                {
                    alert("ENTER CORRECT MOBILE NO,");
                } else if (password != confipassword)
                {
                    alert("PASSWORD DOSENT MATCH");
                } else if (photo.length == 0)
                {
                    alert("no photo selected");
                } else
                {


                    var ans = "";
                    var formdata = new FormData();

                    var controls = document.getElementById("form1").elements;
                    var flag = 0;

                    for (var i = 0; i < controls.length; i++)
                    {
                        if (controls[i].name == "" || controls[i].name == null)
                        {
                            flag = 1;
                        }
                        if (controls[i].type == "file")
                        {
                            if (controls[i].files.length > 0)
                            {
                                formdata.append(controls[i].name, controls[i].files[0]);
                            } else
                            {
                                flag = 2;
                            }
                        } else    // if not file, text control
                        {
                            formdata.append(controls[i].name, controls[i].value);
                        }
                    }

                    if (flag == 1)
                    {
                        alert("CHECK: --> Give name attribute to all controls in form");
                    } else if (flag == 2)
                    {
                        alert("CHECK: --> Select Files for file controls");
                    } else
                    {
                        // Send AJAX Request to send FORMDATA (text + files) to Server
                        var xhr = new XMLHttpRequest;

                        xhr.onreadystatechange = function ()
                        {
                            if (xhr.readyState === 4 && xhr.status == 200)
                            {
                                //get response from server
                                var res = xhr.responseText;

                                alert(res);

                            }
                        };

                        xhr.open("Post", "./usersignup", true);

                        //alert("Sending Request to Server");

                        //console.log(formdata);

                        // ALso send FORM-Data with AJAX REQUEST
                        xhr.send(formdata);
                    }
                }
            }
        </script>
    </head>

    <body  style="background-image: url('myuploads/myuploads/8.jpg')">
        <%@include file="publicheader.jsp" %>
        <div class="container">
            <div class="row">
                <div class="col-md-6 offset-md-3" style="border: solid 2px #ff3333; border-radius:  5px; padding: 20px">
                    <center><h1 style="color: #ff6666">SIGNUP</h1></center>


                    <form id="form1" method="POST" enctype="multipart/form-data">
                        <div class="form-group form-row">
                            <label for="emailid" class="col-sm-3" style="color: #ff3333">EMAIL ID</label>
                            <input type="text" name="emailid" id="emailid" class="form-control col-sm-9"/> 
                        </div>
                        <div class="form-group form-row">
                            <label for="password" class="col-sm-3" style="color: #ff3333">PASSWORD</label>
                            <input type="text" name="password" id="password" class="form-control col-sm-9"/> 
                        </div>
                        <div class="form-group form-row">
                            <label for="confipassword" class="col-sm-3" style="color: #ff3333">CONFIRM Password</label>
                            <input type="confipassword" name="confipassword" id="confipassword" class="form-control col-sm-9" /> 
                        </div>
                        <div class="form-group form-row">
                            <label for="fname" class="col-sm-3" style="color: #ff3333">FULL NAME</label>
                            <input type="text" name="fname" id="fname" class="form-control col-sm-9"/> 
                        </div>
                        <div class="form-group form-row">
                            <label class="col-sm-3" for="gender" style="color: #ff3333">GENDER</label>

                            <div class="col-sm-9">
                                <label >
                                    <input type="radio" name="gender" id="g1" value="male" checked> MALE </label> 
                                <label >
                                    <input type="radio" name="gender" id="g2" value="female"> FEMALE </label> 
                            </div>
                        </div>
                        <div class="form-group form-row">
                            <label for="mobileno" class="col-sm-3" style="color: #ff3333">MOBILE NO.</label>
                            <input type="text" name="mobileno" id="mobileno" class="form-control col-sm-9"/> 
                        </div>
                        <div class="form-group form-row">
                            <label for="photo" style="color: #ff3333">PHOTO</label>
                            <input type="file" name="photo" id="photo" accept="image/.jpg" class="form-control"/>
                        </div>
                        <div class="form-group form-row">
                            <label for="question" class="col-md-4 control-label" style="color: #721c24; ">SECURITY QUESTION</label>
                            <div class="col-md-4">
                                <select id="question" name="question" class="form-control">
                                    <option> WHAT IS MY NAME</option>
                                    <option>WHERE DO YOU LIVE</option>
                                    <option>YOUR HOBBIES</option>
                                </select>
                            </div>
                        </div>    
                        <div class="form-group form-row">
                            <label for="answer" class="col-sm-3" style="color: #721c24">ANSWER</label>
                            <input type="text" name="answer" id="answer" class="form-control col-sm-9"/> 
                        </div>
                        <div class="form-group form-row">
                            <input type="button" name="submit" value="submit" class="btn-primary btn-lg col-sm-9 offset-3" onclick="signup()" />

                        </div>
                    </form>
                </div>
            </div>
        </div>


    </body>
</html>
