
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>welcome to edit profile page</title>
        <script>

            function fetchprofile()
            {
                //alert("fetch students data called");
                // Generate AJAX Request to Fetch Data from Server

                // Step 1
                var xhttp = new XMLHttpRequest();
                // Step 4 
                // Callback method
                // This method is called when server gives answer
                xhttp.onreadystatechange = function ()
                {
                    if (this.readyState == 4 && this.status == 200)
                    {
                        var res = xhttp.responseText.trim();
                        var serverres = xhttp.responseText;
                        var mainobj = JSON.parse(serverres);
                        var arr = mainobj["ans"];
                        var ans = "<table width=600 border=1>";
                        for (var i = 0; i < arr.length; i++)
                        {
                            var singleobj = arr[i];
                            document.getElementById("spemailid").innerHTML = singleobj["emailid"];
                            document.getElementById("spfullname").innerHTML = singleobj["Fullname"];
                            document.getElementById("spmobileno").innerHTML = singleobj["Mobileno"];
                            document.getElementById("img1").src = singleobj["Photo"];
                            document.getElementById("spgender").innerHTML = singleobj["Gender"];
                            document.getElementById("spquestion").innerHTML = singleobj["Question"];
                            document.getElementById("spanswer").innerHTML = singleobj["Answer"];
                            // ans = ans + "<tr>";

                            //ans = ans+"<td><img src=\""+ singleobj["photo"] +"\" width=100 height=100 />  </td>";
                            // ans = ans+"<td>"+ singleobj["emailid"] +"</td>";
                            //ans = ans+"<td>"+ singleobj["fname"] +"</td>";
                            // ans = ans+"<td>"+ singleobj["mobileno"] +"</td>";
                            //  ans = ans+"<td>"+ singleobj["gender"] +"</td>";
                            //ans = ans+"<td>"+ singleobj["question"] +"</td>";
                            //*  ans = ans+"<td>"+ singleobj["answer"] +"</td>"; 


                            // ans = ans + "</tr>";
                        }


                    }
                };
                // Step 2
                xhttp.open("GET", "./Fetchprofile", true); // true --> async request

                // Step 3
                xhttp.send();
            }

            function pupdate()
            {
                var photo = document.getElementById("nphoto").value;
                var ans = "";
                var formdata = new FormData();
                var controls = document.getElementById("form2").elements;
                var flag;
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
                    } else
                    {
                        formdata.append(controls[i].name, controls[i].value);
                    }
                }
                if (flag == 1)
                {
                    alert("CHECK--> Give name attributes to all control in form");
                } else if (flag == 2)
                {
                    alert("CHECK--> Select files for file controls");
                } else
                {
                    var xhr = new XMLHttpRequest();
                    xhr.onreadystatechange = function ()
                    {
                        if (xhr.status === 200 && xhr.readyState === 4)
                        {
                            var res = xhr.responseText.trim();
                            alert(res);
                            if (res == success)
                            {
                                alert("photo updated");
                                fetchprofile();
                            } else
                            {
                                alert("photo not updated");
                            }
                        }
                    };
                    xhr.open("POST", "./changephotoserver", true);
//                 
                    xhr.send(formdata);
                }
            }
            function editdata()
            {
                var ans = confirm("are you sure you want to edit");
                if (ans == true)
                {
                    var selectedemailid = document.getElementById("sppemailid").value;
                    var selectedname = document.getElementById("sppfullname").value;
                    var mobileno = document.getElementById("sppmobileno").value;
                    var gender = document.getElementById("sppgender").value;
                    var question = document.getElementById("sppquestion").value;
                    var answer = document.getElementById("sppanswer").value;
                    var controls = document.getElementById("form3").elements;
                    var xhr = new XMLHttpRequest();
                    xhr.onreadystatechange = function ()
                    {
                        if (xhr.status === 200 && xhr.readyState === 4)
                        {

                            var res = xhr.responseText.trim();
                            if (xhr.responseText.trim() == "success")
                            {
                                alert("record edited");
                                fetchprofile();
                            } else
                            {
                                alert(res);
                            }

                        }
                    };
                    xhr.open("GET", "./editprofile?emailid=" + selectedemailid + "&fname=" + selectedname + "&mobileno=" + mobileno + "&gender=" + gender + "&question=" + question + "&answer=" + answer, true);
                    xhr.send();
                }

            }

        </script>
    </head>
    <body onload="fetchprofile()">
        <%@include file="userheader.jsp" %>
        <div class="container" style: margin top:10px>
            <div class="row">
                <!-- profile pic -->
                <div class="col-md-12" style="border: solid 2px #ff3333; border-radius:  5px">

                    <center><h1 style="color: #ff6666">MY PROFILE</h1></center><br>
                    <div class="row">
                        <div class="col-md-6" >
                            <img src="" id="img1" class="img-fluid rounded-circle" /><br>
                            <button class="btn btn-primary" onclick="showphotodialog()" >Update Photo</button> 

                        </div>



                        <!-- profile data--> 
                        <div class="col-md-6" style="border: solid 2px #ff3333">
                            <table class="table table-borderless table-hover">
                                <tr>
                                    <td>EMAIL ID</td>
                                    <td><span id="spemailid"></td></span>
                                </tr>
                                <tr>
                                    <td>FULL NAME</td>
                                    <td><span id="spfullname"></span>
                                </tr>
                                <tr>
                                    <td>MOBILE NO</td>
                                    <td><span id="spmobileno"></span>
                                </tr>
                                <tr>
                                    <td>GENDER</td>
                                    <td><span id="spgender"></span>
                                </tr>
                                <tr>
                                    <td>SECURITY QUESTION</td>
                                    <td><span id="spquestion"></span>
                                </tr>
                                <tr>
                                    <td>ANSWER</td>
                                    <td><span id="spanswer"></span>
                                </tr>
                            </table>
                            <br><br>
                            <div class="form-group form-row">
                                <div class="offset-4 col-md-8">
                                    <input value="Update Profile" type="button" onclick="showphotodialog2()" class="btn btn-success" />
                                </div>
                            </div>
                        </div
                    </div>
                </div>
                <modal id="myModal1" class="modal fade" role="dialog">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title">Update Photo</h4>
                                <button type="button" class="close" data-dismiss="modal">&times</button>
                            </div>
                            <div class="modal-body">
                                <form id="form2" method="POST" enctype="multipart/form-data">
                                    <img id="img2" name="img2" class="img-fluid rounded-circle"/>
                                    <br>
                                    <input type="file" id="nphoto" name="nphoto" class="form-control-file col-sm-9" accept="image/jpg"/>
                                </form>

                            </div>
                            <div class="modal-footer">
                                <input type="button" class="btn btn-success" value="Update" onclick="pupdate()" />
                                <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                            </div>
                        </div>
                    </div>
                </modal>
                <modal id="myModa22" class="modal fade" role="dialog">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title">Update Essential</h4>
                                <button type="button" class="close" data-dismiss="modal">&times</button>
                            </div>
                            <div class="modal-body">
                                <form id="form3" method="POST">
                                    <div class="form-group form-row">
                                        <label for="sppemailid" class="col-md-4">Email id</label>
                                        <div class="col-md-8">
                                            <input type="text" id="sppemailid" name="sppemailid" readonly="" value="<%= session.getAttribute("emailid").toString()%>" class="form-control">
                                        </div>
                                    </div>
                                    <div class="form-group form-row">
                                        <label for="sppfullname" class="col-md-4">Full Name</label>
                                        <div class="col-md-8">
                                            <input type="text" id="sppfullname" name="sppfullname" class="form-control">
                                        </div>
                                    </div>
                                    <div class="form-group form-row">
                                        <label for="sppmobileno" class="col-md-4">Mobile No.</label>
                                        <div class="col-md-8">
                                            <input type="text" id="sppmobileno" name="sppmobileno" class="form-control">
                                        </div>
                                    </div>
                                    <div class="form-group form-row">
                                        <label for="sppgender" class="col-md-4">Gender</label>
                                        <div class="col-md-8">
                                            <select id="sppgender" name="sppgender" class="form-control">
                                                <option>Male</option>
                                                <option>Female</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group form-row">
                                        <label for="sppquestion" class="col-md-4">Security-Question</label>
                                        <div class="col-md-8">
                                            <select id="sppquestion" name="sppquestion" class="form-control ">
                                                <option> WHAT IS MY NAME</option>
                                                <option>WHERE DO YOU LIVE</option>
                                                <option>YOUR HOBBIES</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group form-row">
                                        <label for="sppanswer" class="col-md-4">Answer</label>
                                        <div class="col-md-8"><input type="text" id="sppanswer" name="sppanswer" class="form-control"></div>
                                    </div>
                                </form>
                            </div>

                            <div class="modal-footer">
                                <input type="button" class="btn btn-success" value="Update" onclick="editdata()" />
                                <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                            </div>
                        </div>
                    </div>
                </modal>
            </div>

        </div>
    </div>

    <script>
        function showphotodialog()
        {
            $(document).ready(function ()
            {
                document.getElementById("img2").src = document.getElementById("img1").src;
                $("#myModal1").modal('show');
            });
        }
        function showphotodialog2()
        {
            $(document).ready(function ()
            {

                $("#myModa22").modal('show');
            });
        }
    </script>
    <%@ include file ="userheader.jsp" %>
</body>
</html>
