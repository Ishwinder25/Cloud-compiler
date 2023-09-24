<%-- 
    Document   : myfriends
    Created on : 26 Apr, 2019, 1:36:30 PM
    Author     : DIVYAM
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <style>
            .demo{
                width: 50px;
                height: 50px;
            }
        </style>
        <link href="lib/codemirror.css" rel="stylesheet" type="text/css"/>
        <script src="lib/codemirror.js" type="text/javascript"></script>

        <script src="addon/edit/closebrackets.js" type="text/javascript"></script>
        <script src="mode/clike/clike.js" type="text/javascript"></script>
        <script src="addon/hint/show-hint.js" type="text/javascript"></script>
        <script src="addon/edit/matchbrackets.js" type="text/javascript"></script>
        <link href="addon/hint/show-hint.css" rel="stylesheet" type="text/css"/>
    </head>
    <script>


        function java_fetch()
        {
            var lang = "";
            var xml = new XMLHttpRequest();
            xml.onreadystatechange = function () {
                if (xml.readyState == 4 && xml.status == 200)
                {
                    var res = xml.responseText.trim();

                    var mainjson = JSON.parse(res);
                    var jsa = mainjson["ans"];
                    var ans = "";
                    ans += "<span style='color: white'>Codes Shared: " + jsa.length + "</span>";
                    document.getElementById("java").innerHTML = ans;

                    ans += "<table class='table'>";
                    ans += "<thead class='bg-primary'>";
                    ans += "<tr>";
                    ans += "<td>Code-id</td><td>Date/Time</td><td>Owner</td>";
                    ans += "</tr>";
                    ans += "</thead>";
                    ans += "<tbody>";
                    for (var i = 0; i < jsa.length; i++)
                    {
                        var js = jsa[i];
                        ans += "<tr>";
                        ans += "<td>" + js["codeid"] + "</td>";
                        ans += "<td>" + js["date_time"] + "</td>";
                        ans += "<td>" + js["owner"] + "</td>";
                        ans += "<td><input type='button' value='view' class='btn btn-success' onclick='share(\"" + js["codeid"] + "\")'/></td>";

                        ans += "</tr>";
                    }
                    ans += "</tbody>";
                    ans += "</table>";

                    document.getElementById("demo1").innerHTML = ans;

                }
            };
            xml.open("GET", "./share_codes?lang=java", true);
            xml.send();
        }
        function c_fetch()
        {
            var lang = "";
            var xml = new XMLHttpRequest();
            xml.onreadystatechange = function () {
                if (xml.readyState == 4 && xml.status == 200)
                {
                    var res = xml.responseText.trim();

                    var mainjson = JSON.parse(res);
                    var jsa = mainjson["ans"];
                    var ans = "";
                    ans += "<span style='color: white'>Codes Shared: " + jsa.length + "</span>";
                    document.getElementById("c").innerHTML = ans;

                    ans += "<table class='table'>";
                    ans += "<thead class='bg-primary'>";
                    ans += "<tr>";
                    ans += "<td>Code-id</td><td>Date/Time</td><td>Owner</td>";
                    ans += "</tr>";
                    ans += "</thead>";
                    ans += "<tbody>";
                    for (var i = 0; i < jsa.length; i++)
                    {
                        var js = jsa[i];
                        ans += "<tr>";
                        ans += "<td>" + js["codeid"] + "</td>";
                        ans += "<td>" + js["date_time"] + "</td>";
                        ans += "<td>" + js["owner"] + "</td>";
                        ans += "<td><input type='button' value='view' class='btn btn-success' onclick='share(\"" + js["codeid"] + "\")'/></td>";

                        ans += "</tr>";
                    }
                    ans += "</tbody>";
                    ans += "</table>";


                    document.getElementById("demo2").innerHTML = ans;

                }
            };
            xml.open("GET", "./share_codes?lang=c", true);
            xml.send();
        }

        function cpp_fetch()
        {
            var lang = "";
            var xml = new XMLHttpRequest();
            xml.onreadystatechange = function () {
                if (xml.readyState == 4 && xml.status == 200)
                {
                    var res = xml.responseText.trim();

                    var mainjson = JSON.parse(res);
                    var jsa = mainjson["ans"];
                    var ans = "";
                    ans += "<span style='color: white'>Codes Shared: " + jsa.length + "</span>";
                    document.getElementById("cpp").innerHTML = ans;


                    ans += "<table class='table'>";
                    ans += "<thead class='bg-primary'>";
                    ans += "<tr>";
                    ans += "<td>Code-id</td><td>Date/Time</td><td>Owner</td>";
                    ans += "</tr>";
                    ans += "</thead>";
                    ans += "<tbody>";
                    for (var i = 0; i < jsa.length; i++)
                    {
                        var js = jsa[i];
                        ans += "<tr>";
                        ans += "<td>" + js["codeid"] + "</td>";
                        ans += "<td>" + js["date_time"] + "</td>";
                        ans += "<td>" + js["owner"] + "</td>";
                        ans += "<td><input value='view' class='btn btn-success' type='button' onclick='share(\"" + js["codeid"] + "\")'/></td>";

                        ans += "</tr>";
                    }
                    ans += "</tbody>";
                    ans += "</table>";

                    document.getElementById("demo3").innerHTML = ans;

                }
            };
            xml.open("GET", "./share_codes?lang=cpp", true);
            xml.send();
        }
        function python_fetch()
        {
            var lang = "";
            var xml = new XMLHttpRequest();
            xml.onreadystatechange = function () {
                if (xml.readyState == 4 && xml.status == 200)
                {
                    var res = xml.responseText.trim();

                    var mainjson = JSON.parse(res);
                    var jsa = mainjson["ans"];
                    var ans = "";
                    ans += "<span style='color: white'>Codes Shared: " + jsa.length + "</span>";
                    document.getElementById("py").innerHTML = ans;

                    ans += "<table class='table'>";
                    ans += "<thead class='bg-primary'>";
                    ans += "<tr>";
                    ans += "<td>Code-id</td><td>Date/Time</td><td>Owner</td>";
                    ans += "</tr>";
                    ans += "</thead>";
                    ans += "<tbody>";
                    for (var i = 0; i < jsa.length; i++)
                    {
                        var js = jsa[i];
                        ans += "<tr>";
                        ans += "<td>" + js["codeid"] + "</td>";
                        ans += "<td>" + js["date_time"] + "</td>";
                        ans += "<td>" + js["owner"] + "</td>";
                        ans += "<td><input type='button' value='view' class='btn btn-success'  onclick='share(\"" + js["codeid"] + "\")'/></td>";
                        ans += "</tr>";
                    }
                    ans += "</tbody>";
                    ans += "</table>";
                    document.getElementById("demo4").innerHTML = ans;

                }
            };
            xml.open("GET", "./share_codes?lang=python", true);
            xml.send();
        }

        var codeid;
        function share(id)
        {
            codeid = id;
            view();
            $('#showcodemodal').modal('show');
        }

        function view()
        {
            var xml = new XMLHttpRequest();
            xml.onreadystatechange = function () {
                if (xml.readyState == 4 && xml.status == 200)
                {
                    var res = xml.responseText.trim();

                    var mainjson = JSON.parse(res);
                    var jsa = mainjson["ans"];
                    var ans = "";
                    var ans1 = "";
                    var ans2 = "";
                    var js = jsa[0];

                    ans = "Shared By:" + js["emailid"];
                    document.getElementById("lb1").innerHTML = ans;
                    load(js["code"]);
                    ans1 = "<a class='btn btn-success' href='" + js["code"] + "'  download>Download</a>";
                    ans2 += "<br><input type='button' id='btnlike' value='Like' style='float: left;color: white' class='btn btn-danger'  onclick=\"like('" + js["codeid"] + "')\" /><br><br>";
                    ans2 += "<b><span style='float: left'>Total No Of Likes:</span><span style='float: left' id='label' ></span></b>";
                    document.getElementById("divdownload").innerHTML = ans1;

                    document.getElementById("divlikes").innerHTML = ans2;
                    like_fetch();
                }
            };
            xml.open("GET", "./view_share_code?codeid=" + codeid, true);
            xml.send();
        }
        function load(code)
        {

            var xmlhttp = new XMLHttpRequest();
            xmlhttp.onreadystatechange = function ()
            {
                if (xmlhttp.readyState == 4 && xmlhttp.status == 200)
                {
                    var res = xmlhttp.responseText;
                    document.getElementById("divcodepreview").innerHTML = "<pre style='float: left'>" + res + "</pre>";
                }
                comment_fetch();
            };
            xmlhttp.open("GET", code, true);
            xmlhttp.send();

        }

        function like_fetch()
        {
            var xmlhttp;
            xmlhttp = new XMLHttpRequest();
            xmlhttp.onreadystatechange = function ()
            {
                if (xmlhttp.readyState == 4 && xmlhttp.status == 200)
                {
                    var res = xmlhttp.responseText.trim();
                    document.getElementById("label").innerHTML = res;
                    like_disable();
                }
            };
            xmlhttp.open("GET", "./like_fetch?codeid=" + codeid, true);
            xmlhttp.send();
        }

        function like(id)
        {
            var xml;
            codeid = id;
            xml = new XMLHttpRequest();
            xml.onreadystatechange = function () {

                if (xml.readyState == 4 && xml.status == 200)
                {
                    alert(xml.responseText.trim());

                    like_fetch();
                }
            };
            xml.open("GET", "./like_add?codeid=" + codeid, true);
            xml.send();
        }
        function like_disable()
        {
            var xmlhttp;
            xmlhttp = new XMLHttpRequest();
            xmlhttp.onreadystatechange = function ()
            {
                if (xmlhttp.readyState == 4 && xmlhttp.status == 200)
                {
                    var res = xmlhttp.responseText.trim();
                    if (res == "disable")
                    {
                        document.getElementById("btnlike").disabled = true;
                    } else
                    {
                        document.getElementById("btnlike").disabled = false;
                    }
                }
            };
            xmlhttp.open("GET", "./like_disable?codeid=" + codeid, true);
            xmlhttp.send();
        }
       function comment_fetch()
        {
            var xml = new XMLHttpRequest();
            xml.onreadystatechange = function () {
                if (xml.readyState == 4 && xml.status == 200)
                {
                    var res = xml.responseText.trim();

                    var mainjson = JSON.parse(res);
                    var jsa = mainjson["ans"];
                    var ans = "";
                    var ans1 = "";
                    ans1 += jsa.length;
                    document.getElementById("number").innerHTML = ans1;
                    for (var i = 0; i < jsa.length; i++)
                    {
                        var js = jsa[i];
                        ans += "<div class='col-sm-10'><div class='row'><b><span><input type='text' disabled class='form-control' value='" + js['comment'] + "'></b></span></b></div>";
                        ans += "<div class='row'><b><span style='float:left;color:white'>By-" + js['comment_by'] + "</span></b></div>";
                        ans += "<div class='row'><b><span style='float:left;color:white'>TM-" + js['date_time'] + "</span></b></div></div><br>";
                    }
                    document.getElementById("comment").innerHTML = ans;
                }
            };
            xml.open("GET", "./comment_fetch?codeid=" + codeid, true);
            xml.send();
        }
        function add_comment()
        {
            var comment = document.getElementById("txt1").value;
            var xml;
            xml = new XMLHttpRequest();
            if (comment == "")
            {
                alert("enter comment");
            } else
            {
                xml.onreadystatechange = function () {

                    if (xml.readyState == 4 && xml.status == 200)
                    {
                        comment_fetch();
                        document.getElementById("txt1").value = "";
                    }
                };
                xml.open("GET", "./add_comment?codeid=" + codeid + "&comment=" + comment, true);
                xml.send();
            }
        }




    </script>
    <body onload="java_fetch();
            c_fetch();
            cpp_fetch();
            python_fetch()">
        <%@include file="userheader.jsp" %>
        <input type="hidden" id="codeid" >
        <%            String user = session.getAttribute("emailid").toString();
        %>
        <div class="container">
            <div class="row" style="margin-top: 20px;">
                <div class="col-md-10 offset-1">
                    <h1 class="text-center">Codes Shared With Me</h1>
                    <div class="panel-group">
                        <div class="panel panel-default" style="border-radius: 5px;" >
                            <div class="panel-heading" style="background-color: #28a4c9; border-radius: 5px;padding-right:15px;padding-top: 5px;">
                                <h4 class="panel-title">
                                    <a  data-toggle="collapse" style="color: white" href="#collapse1"><img src="myuploads/myuploads/img2.jpg" class="demo"> </a>
                                    <span style="float: right" id="java" ></span>


                                </h4>
                            </div>
                            <div id="collapse1" class="panel-collapse collapse">
                                <div class="panel-body" id="demo1"></div>

                            </div>
                        </div>
                    </div> 


                    <div class="panel-group">
                        <div class="panel panel-default" style="border-radius: 5px;">
                            <div class="panel-heading" style="background-color: #28a4c9; border-radius: 5px;padding-right:15px;padding-top: 5px;">
                                <h4 class="panel-title">
                                    <a data-toggle="collapse" style="color: white" href="#collapse2"><img src="myuploads/myuploads/index.jfif" class="demo"></a>
                                    <span style="float: right" id="c" ></span>

                                </h4>
                            </div>
                            <div id="collapse2" class="panel-collapse collapse">
                                <div class="panel-body" id="demo2"></div>

                            </div>
                        </div>
                    </div>       



                    <div class="panel-group">
                        <div class="panel panel-default" style="border-radius: 5px;">
                            <div class="panel-heading" style="background-color: #28a4c9; border-radius: 5px;padding-right:15px;padding-top: 5px;">
                                <h4 class="panel-title">
                                    <a data-toggle="collapse" style="color: white" href="#collapse3"><img src="myuploads/myuploads/img1.jpg" class="demo"></a>
                                    <span style="float: right" id="cpp" ></span>

                                </h4>
                            </div>
                            <div id="collapse3" class="panel-collapse collapse">
                                <div class="panel-body" id="demo3"></div>

                            </div>
                        </div>
                    </div>       



                    <div class="panel-group">
                        <div class="panel panel-default" style="border-radius: 5px;">
                            <div class="panel-heading" style="background-color: #28a4c9; border-radius: 5px;padding-right:15px;padding-top: 5px;">
                                <h4 class="panel-title">
                                    <a data-toggle="collapse" style="color: white" href="#collapse4"><img src="myuploads/myuploads/2579510_e24c.jpg" class="demo"></a>
                                    <span style="float: right" id="py" ></span>

                                </h4>
                            </div>
                            <div id="collapse4" class="panel-collapse collapse">
                                <div class="panel-body" id="demo4"></div>

                            </div>
                        </div>
                    </div>     

                </div>
            </div>
        </div>


        <!--show code modal-->
        <div class="modal" id="showcodemodal">
            <div class="modal-dailog" >
                <center>
                    <div class="modal-content container" >
                        <div class="modal-header" style='background-color: #28a4c9' >
                            <a class="close" data-dismiss="modal"></a>
                            <h3><span  style='color: white' id="lb1" ></span></h3>
                        </div>
                        <div class="modal-body" >
                            <div class="row">
                                <div class="col-sm-6"  style="margin-right: 2px;margin-left: 30px;height: 550px;background-color: #28a4c9">
                                    <div id="divdownload" style="height: 50px">

                                    </div>
                                    <div style="height: 350px; overflow: auto;background-color: whitesmoke;border-radius: 5px;" >
                                        <div id="divcodepreview" >

                                        </div>
                                    </div>
                                    <div style="height: 30px" >
                                        <div id="divlikes" >

                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-5" style="background-color: #28a4c9;height: 550px">
                                    <div style="height: 80px">
                                        <b><span style="float: left;color: white">Enter your comment</span></b>
                                        <input type="text" id="txt1" placeholder="comment" class="form-control">
                                        <input type="button" id="btn" value="ADD" class="btn btn-primary" style="float: right;" onclick="add_comment()">
                                    </div>

                                    <hr>   
                                    <div>
                                        <div class="row">
                                            <b><span style="float: left;font-size: 20px;color: white">&nbsp;&nbsp;&nbsp;Comments:<span id='number'></span></span></b>
                                        </div>
                                        <br>
                                        <div id="comment" style='height: 350px;overflow: auto' >
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                        <div class="modal-footer" >
                            <button data-dismiss="modal" style="color: white" class="btn btn-danger" >Close</button>
                        </div>
                    </div>
                </center>
            </div>
        </div>
    </body>
</html>
