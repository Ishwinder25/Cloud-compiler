
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="lib/codemirror.css" rel="stylesheet" type="text/css"/>
        <script src="lib/codemirror.js" type="text/javascript"></script>
        <script src="addon/edit/closebrackets.js" type="text/javascript"></script>
        <script src="mode/clike/clike.js" type="text/javascript"></script>
        <script src="addon/hint/show-hint.js" type="text/javascript"></script>
        <script src="addon/edit/matchbrackets.js" type="text/javascript"></script>
        <link href="addon/hint/show-hint.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <title>PUBLIC HOME</title>

        <style>
            .CodeMirror
            {
                height: 400px;
                border: solid 2px lightblue;
            }
        </style>
        <script>
            var editor;
            function setStyle()
            {
                editor = CodeMirror.fromTextArea(document.getElementById("taeditor"),
                        {
                            lineNumbers: true,
                            matchBrackets: true,
                            autoCloseBrackets: true,

                            extraKeys: {"Ctrl-Space": "autocomplete"},
                            highlightSelectionMatches: true,
                            mode: "text/x-csrc"
                        });
                editor.on('change', function () {
                    document.getElementById("btnrun").disabled = true;
                });
            }

            function readandpreview(fileobj, preview)
            {
                var firstfile = fileobj.files[0];
                var reader = new FileReader();
                reader.onload = (function (f)
                {
                    return function read(e)
                    {
                        editor.setValue(e.target.result);
                    };
                })(firstfile);
                reader.readAsText(firstfile);
            }

            function filesaving()
            {
                var lang = document.getElementById("cblanguage").value;
                var code = editor.getValue();

                console.log("lang " + lang);
                console.log("code : " + code);
                if (code == "")
                {
                    alert("Please write some code");
                } else
                {
                    var xhr = new XMLHttpRequest();
                    var formdata = new FormData();
                    formdata.append("lang", lang);
                    formdata.append("code", code);
                    document.getElementById("img1").style.display = "inline";
                    xhr.onreadystatechange = function ()
                    {
                        if (xhr.readyState == 4 && xhr.status == 200)
                        {
                            var resp = xhr.responseText.trim();
                            if (resp == "success")
                            {
                                compile();
                            } else
                            {
                                alert("some error occur");
                            }
                        }
                    };
                    xhr.open("POST", "./user_file_save", true);
                    xhr.send(formdata);
                }

            }
            function compile()
            {
                var lang = document.getElementById("cblanguage").value;
                var args = document.getElementById("tainputs").value;
                var xhr = new XMLHttpRequest();
                if (lang == "python")
                {
                    document.getElementById("btnrun").style.display = "none";
                } else
                {
                    document.getElementById("btnrun").style.display = "inline";
                }
                xhr.onreadystatechange = function ()
                {
                    if (xhr.readyState == 4 && xhr.status == 200)
                    {
                        document.getElementById("img1").style.display = "none";
                        document.getElementById("btnrun").disabled = false;
                        document.getElementById("btnsave").disabled = false;
                        var resp = xhr.responseText.trim();
                        document.getElementById("taoutput").value = resp;
                    }
                };
                xhr.open("GET", "./user_compiler?lang=" + lang + "&args=" + args, true);
                xhr.send();
            }
            function run()
            {
                var lang = document.getElementById("cblanguage").value;
                var args = document.getElementById("tainputs").value;
                var xhr = new XMLHttpRequest();
                document.getElementById("img1").style.display = "inline";
                xhr.onreadystatechange = function ()
                {
                    if (xhr.readyState == 4 && xhr.status == 200)
                    {
                        document.getElementById("img1").style.display = "none";
                        var resp = xhr.responseText.trim();
                        document.getElementById("taoutput").value = resp;
                    }
                };
                xhr.open("GET", "./user_run?lang=" + lang + "&args=" + args, true);
                xhr.send();
            }

            function save()
            {

                var lang = document.getElementById("cblanguage").value;
                var title = document.getElementById("title").value;

                if (title == '')
                {
                    alert("Please Enter Title");
                } else
                {
                    var txt = editor.getValue();

                    txt = encodeURIComponent(txt);


                    var xml = new XMLHttpRequest();
                    xml.onreadystatechange = function () {

                        if (xml.readyState == 4 && xml.status == 200)
                        {

                            var res = xml.responseText;


                            userfetchcodes();

                        }
                    }
                    ;
                    xml.open("GET", "./user_save?lang=" + lang + "&title=" + title + "&txt=" + txt, true);
                    xml.send();
                }
            }


            function userfetchcodes()
            {
                var language = document.getElementById('cblanguage').value;
                var email = document.getElementById("useremail").value;

                var xml1 = new XMLHttpRequest();
                xml1.onreadystatechange = function ()
                {
                    if (xml1.readyState == 4 && xml1.status == 200)
                    {
                        var res = xml1.responseText.trim();
                        var mainjson = JSON.parse(res);

                        var jsa = mainjson["ans"];
                        var ans = "";
                        for (var i = 0; i < jsa.length; i++)
                        {
                            var js = jsa[i];

                            ans += "<div><input  type='button' style='width:160px;' class='btn btn-primary' title= '" + js["title"] + "' value='" + js["title"] + "'  onclick=\"loadusercode('" + js["title"] + "','" + js["code"] + "')\" />";
                            ans += "&nbsp;<button class='btn btn-success' type='button' onclick=\"share('" + js["codeid"] + "')\"><i class='fa fa-share'></i></button>";
                            ans += " <button type='button' class='btn btn-danger'  onclick='del(\"" + js["codeid"] + "\")'><i class='fa fa-remove'></i></button></div>";
                        }
                        document.getElementById("preview").innerHTML = ans;
                    }
                };
                xml1.open("GET", "./user_codes?language=" + language + "&email=" + email, true);
                xml1.send();
            }



            function loadusercode(title, code)
            {

                document.getElementById("title").value = title;
                var xmlhttp = new XMLHttpRequest();
                xmlhttp.onreadystatechange = function ()
                {
                    if (xmlhttp.readyState == 4 && xmlhttp.status == 200)
                    {
                        var res = xmlhttp.responseText;
                        editor.setValue(res);
                    }
                };
                xmlhttp.open("GET", code, true);
                xmlhttp.send();
            }


            function del(val)
            {
                var ans = confirm('Are you sure to delete?');

                if (ans == true)
                {
                    xmlhttp = new XMLHttpRequest();
                    xmlhttp.open("GET", "./user_code_del?value=" + val, true);
                    xmlhttp.onreadystatechange = function ()
                    {
                        if (xmlhttp.readyState == 4 && xmlhttp.status == 200)
                        {
                            alert(xmlhttp.responseText.trim());
                            userfetchcodes();
                        }
                    };
                    xmlhttp.send();
                    console.log("request sent");

                }
            }



            var code_id;
            function share(id)
            {
                code_id = id;
                myfriends();
                $('#sharemodal').modal('show');
            }
            var xml;
            function myfriends()
            {
                xml = new XMLHttpRequest();
                xml.onreadystatechange = go3;
                xml.open("GET", "./friend_list", true);
                xml.send();
            }
            function go3()
            {
                if (xml.readyState == 4 && xml.status == 200)
                {
                    var res = xml.responseText.trim();
                    var mainjson = JSON.parse(res);
                    var jsa = mainjson["ans"];
                    var ans = "";
                    for (var i = 0; i < jsa.length; i++)
                    {
                        var js = jsa[i];
                        ans += "<div class='row'><div id='f1'  class='col-sm-8'><input name='cb' value='" + js["emailid"] + "' type='checkbox'/>&nbsp;&nbsp;&nbsp;<img src='" + js["Photo"] + "' style='width:50px; height:50px'/><b>" + js["Fullname"] + "</b></div></div><br>";
                    }
                    document.getElementById("modalcontent").innerHTML = ans;
                }
            }
                  function sharewithfriends()
            {
                var cb = document.getElementsByName("cb");
                var language = document.getElementById("cblanguage").value;
                var s = "";

                if (cb.length == 0)
                {
                    alert("select atleast one friend");
                } else
                {
                    for (var i = 0; i < cb.length; i++)
                    {
                        if (cb[i].checked)
                        {
                            s = s + cb[i].value + ";";
                        }
                    }
                    var xmlhttp = new XMLHttpRequest();
                    xmlhttp.onreadystatechange = function ()
                    {
                        if (xmlhttp.readyState == 4 && xmlhttp.status == 200)
                        {
                            var res = xmlhttp.responseText.trim();
                            if (res == "success")
                            {
                                $("#sharemodal").modal("hide");
                                 alert("code shared successfully");
                            }
                        }
                    };
                    xmlhttp.open("GET", "./sharewithfriends?language=" + language + "&codeid=" + code_id + "&s=" + s, true);
                    xmlhttp.send();
                }
            }
             function usersamplecodes()
            {
               var language = document.getElementById('cblanguage').value;
               
                 var xml1 = new XMLHttpRequest();
                xml1.onreadystatechange = function ()
                {
                    if (xml1.readyState == 4 && xml1.status == 200)
                    {
                        var res = xml1.responseText.trim();
                        var mainjson = JSON.parse(res);

                        var jsa = mainjson["ans"];
                        var ans = "";
                        for (var i = 0; i < jsa.length; i++)
                        {
                            var js = jsa[i];

                            ans += "<div><input  type='button' style='width:160px;' class='btn btn-primary' title= '" + js["title"] + "' value='" + js["title"] + "'  onclick=\"loadusercode('" + js["title"] + "','" + js["code_file"] + "')\" />";
                           
                        }
                        document.getElementById("divsamplecodes").innerHTML = ans;
                    }
                };
                xml1.open("GET", "./viewsamplecode?language="+language, true);
                xml1.send();
                
            }


        </script>
    </head>
    <body onload="setStyle();userfetchcodes();usersamplecodes()" style="background-image: url('myuploads/myuploads/b4.jpg')" >

        <%@ include file ="userheader.jsp" %>
        <div class="container-fluid">
            <input type="hidden" id="cblanguage" value="<%=request.getParameter("language")%>" />
            <input type="hidden" id="useremail" value="<%=session.getAttribute("emailid").toString()%>" />
            <div class="row" style="margin-top: 10px;">

                <div class="col-md-3">
                    <h3>  <span style='font-weight: bold; background-color: transparent;font-size: 20px;color: white'>User Codes</span></h3>
                    <div class="col-md-12"  id="preview"  style=" margin-top: 20px;overflow: auto;" >

                    </div>

                    <div style="margin-top: 450px;">
                        <span style="color: white">UPLOAD</span><br/>
                        <input style="color: white" type="file" id="f2" onchange="readandpreview(this, 'taeditor')">
                    </div>
                </div>

                <div class="col-md-7">
                    <h2 class="text-center "><span class="text-uppercase" style='font-weight: bold;background-color: transparent;font-size: 20px;color: white;'>
                            <%= request.getParameter("language") + " Compiler"%></span></h2>

                    <input type="text" placeholder="Enter Title...." class="form-control" id="title" />
                    <h2 class="text-center">  <span style='font-weight: bold;background-color: transparent;font-size: 20px;color: white'>Code Editor</span></h2>
                    <div  style="color: white;border-radius: 5px; height: 420px;margin-left: 5px;">
                        <textarea id="taeditor" rows="50"  ></textarea> <br>
                    </div>
                    <input type="button" class='btn btn-primary' onclick="filesaving()" value="COMPILE"  id="btncompile">
                    <input type="button" class='btn btn-primary' id="btnrun" value="RUN" disabled onclick="run()">

                    <input type="button" class='btn btn-success' id="btnsave"  value="Save Code" disabled onclick="save()">
                    <img src="myuploads/myuploads/transparent-background-loading.gif" id="img1" style="width: 30px;height: 30px;display: none"/>
                </div>

                <div class="col-md-2">
                    <h3>  <span style='font-weight: bold;background-color: transparent;font-size: 20px;color: white'>Sample Codes</span></h3>
                      <div class="col-md-12"  id="divsamplecodes"  style=" margin-top: 20px;overflow: auto;" >

                    </div>
                    <br>
                </div>
            </div>

            <div class="row" style="margin-bottom: 100px">
                <div class="col-md-7 offset-3">
                    <h2><span style="color: white;">Arguments</span></h2>
                    <textarea id="tainputs" placeholder="value1,value2" 
                              style="width:100%;height: 30px;"></textarea>

                    <h2 ><span style="color: white;">Output</span></h2>

                    <textarea id="taoutput" readonly="" 
                              style="width:100%; color: white;background-color: black ; font-size: 20px;border-radius: 5px;height: 300px;"></textarea>
                </div>
            </div>                                    
        </div>


        <!--sharecode Modal-->
        <div class="modal fade" id="sharemodal">

            <div class="modal-dialog" >
                <center>
                    <div class="modal-content" style="width: 500px">

                        <div class="modal-header" >
                            <h3><label>Select Friends</label></h3>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>
                        <div id="modalcontent" class="modal-body" >


                        </div>
                        <div class="modal-footer" >
                            <button  class="btn btn-success" onclick="sharewithfriends()" style="float: left">share</button>

                            <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>


                        </div>
                    </div>
                </center>

            </div>
        </div>                     

<%@include file="footer.jsp" %>
    </body>


</html>
