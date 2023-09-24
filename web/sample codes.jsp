

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
        <script>
            function add()
            {
                var language = document.getElementById("cblanguage").value;
                var title = document.getElementById("title").value;
                var file = document.getElementById("file").files;
                if (language == "" || title == "")
                {
                    alert("all fields are mandatory");
                } else if (file.length === 0)
                {
                    alert("upload the file");
                } else
                {
                    var ans = "";
                    var formdata = new FormData();
                    var controls = document.getElementById("form1").elements;
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
                                if (res == "success")
                                {
                                    alert("sample code uploaded");
                                }
                            }
                        };
                        xhr.open("POST", "./samplecodesserver", true);
                        xhr.send(formdata);
                    }
                }
            }
        </script>
    </head>
    <body>
        <%@ include file ="userheader.jsp" %>
        <div class="container-fluid">
            <div class="row" style="margin-top: 50px;">
                <div class="col-md-6 offset-md-3" style="border: solid 2px #006666;border-radius: 5px;padding: 20px">
                    <h1 style="color:#006666"><center>Add sample code</center></h1>
                    <form id="form1" method="POST" enctype="multipart/form-data">
                        <div class="form-group form-row">
                            Select language
                            <select id="cblanguage" name="language"class="form-control col-sm-9">
                                <option  value="java">JAVA</option>
                                <option  value="c">C</option>
                                <option  value="cpp">C++</option>
                                <option  value="python">Python</option>
                            </select>
                        </div>

                        <div class="form-group form-row ">
                            <label for="title" class="col-sm-3">Title</label>
                            <input type="text" name="title" id="title" class="form-control col-sm-9"/>
                        </div>
                        <div class="form-group form-row">
                            <Label for="file"class="col-sm-3">Code file</label>
                            <input type="file" name="file" id="file"  class="form-control col-sm-9"/>
                        </div>
                        <input type="button" value="Add sample code"name="button" onclick="add()" class="btn btn-primary "/>
                    </form>

                </div>
            </div>
        </div>
        <%@ include file ="footer.jsp" %>
    </body>
</html>
