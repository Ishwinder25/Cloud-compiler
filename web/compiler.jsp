
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
                    xhr.open("POST", "./public_file_save", true);
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
                        var resp = xhr.responseText.trim();
                        document.getElementById("taoutput").value = resp;
                    }
                };
                xhr.open("GET", "./public_compiler?lang=" + lang + "&args=" + args, true);
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
                xhr.open("GET", "./public_run?lang=" + lang + "&args=" + args, true);
                xhr.send();
            }

        </script>
    </head>
    <body onload="setStyle()" style="background-image: url('myuploads/myuploads/b4.jpg')" >

        <%@ include file ="publicheader.jsp" %>
        <div class="container-fluid">
            <div class="row" style="margin-top: 50px;">

                <div class="col-md-2">
                    <h3>  <span style='font-weight: bold; background-color: transparent;font-size: 20px;color: white'>Choose Compiler</span></h3>

                    <select id="cblanguage" class='form-control' onchange="change_lang()">
                        <option class='form-control' value="java">JAVA</option>
                        <option class='form-control' value="c">C</option>
                        <option class='form-control' value="cpp">C++</option>
                        <option class='form-control' value="python">Python</option>
                    </select>
                    <br><br><br>
                    <span style="color: white">UPLOAD</span><br/>
                    <input style="color: white" type="file" id="f2" onchange="readandpreview(this, 'taeditor')">

                </div>

                <div class="col-md-8">
                    <h2 class="text-center">  <span style='font-weight: bold;background-color: transparent;font-size: 20px;color: white'>Code Editor</span></h2>
                    <div  style="color: white;border-radius: 5px; height: 450px;margin-left: 5px;">
                        <textarea id="taeditor" rows="50"  ></textarea> <br>
                    </div>
                </div>

                <div class="col-md-2">
                    <h3>  <span style='font-weight: bold;background-color: transparent;font-size: 20px;color: white'>Compile and Run</span></h3>
                    <input type="button" class='btn btn-primary' onclick="filesaving()" value="COMPILE"  id="btncompile">
                    <input type="button" class='btn btn-primary' id="btnrun" value="RUN" disabled onclick="run()">

                    <img src="myuploads/myuploads/transparent-background-loading.gif" id="img1" style="width: 30px;height: 30px;display: none"/>
                    <br>
                </div>


            </div>

            <div class="row" style="margin-bottom: 100px">
                <div class="col-md-8 offset-2">
                    <h2><span style="color: white;">Arguments</span></h2>
                    <textarea id="tainputs" placeholder="value1,value2" 
                              style="width:100%;height: 30px;"></textarea>

                    <h2 ><span style="color: white;">Output</span></h2>

                    <textarea id="taoutput" readonly="" 
                              style="width:100%; color: white;background-color: black ; font-size: 20px;border-radius: 5px;height: 300px;"></textarea>
                </div>
            </div>                                    

        </div>



        <%@include file="footer.jsp" %>
    </body>


</html>
