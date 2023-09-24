
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>JSP Page</title>
        <script>

            var xmlhttp;
            function checkrequest()
            {
                var email = document.getElementById("email").value;

                xmlhttp = new XMLHttpRequest();
                xmlhttp.open("GET", "./View_Pending_Request?email=" + email, true);
                xmlhttp.onreadystatechange = result3;
                xmlhttp.send();


            }
            function result3()
            {


                if (xmlhttp.readyState == 4 && xmlhttp.status == 200)
                {



                    var res = xmlhttp.responseText.trim();

                    var mainjson = JSON.parse(res);

                    var jsa = mainjson["ans"];
                    var length = jsa.length;
                    var ans = "<h1 style='color: #006666'>Pending Request:" + length + "</h1>"

                    for (var i = 0; i < length; i++)
                    {
                        var js = jsa[i];


                        ans += "<br><div class='row' style='padding: 10px; border: solid 2px #006666;margin-top: 10px'><div class='col-sm-8'><img src='" + js["Photo"] + "' width='150' height='150'  class='img img-thumbnail'style='margin-right: 20px' /><label style='color: #006666; font-size: 25px'>" + js["Fullname"] + "</label>     <input type='button' value='Accept'onclick=\"Accept('" + js["emailid"] + "')\" class='btn' style='color: white; background-color: #006666'>  <input type='button' value='Reject' onclick=\"Reject('" + js["emailid"] + "')\" class='btn btn-danger'></div></div></a>";


                    }
                    document.getElementById("d5").innerHTML = ans;



                }
            }
            function Reject(email)
            {
                var email1 = document.getElementById("email").value;

                var ans = confirm('Are you sure you want to delete?');
                if (ans == true)
                {
                    xmlhttp = new XMLHttpRequest();
                    xmlhttp.open("GET", "./Reject_Request?email=" + email + "&email1=" + email1, true);
                    xmlhttp.onreadystatechange = result4;
                    xmlhttp.send();
                }


            }
            function result4()
            {

                if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {

                    var res = xmlhttp.responseText.trim();
                    alert(res);
                    checkrequest();
                }


            }
            function Accept(email)
            {
                var email1 = document.getElementById("email").value;
                var ans = confirm('Are you sure you want to Accept?');
                if (ans == true)
                {
                    xmlhttp = new XMLHttpRequest();
                    xmlhttp.open("GET", "./Accept_Request?email=" + email + "&email1=" + email1, true);
                    xmlhttp.onreadystatechange = result5;
                    xmlhttp.send();
                }


            }
            function result5()
            {

                if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {

                    var res = xmlhttp.responseText.trim();
                    alert(res);
                    checkrequest();


                }



            }








        </script>
    </head>
    <body onload="checkrequest()" >
        <%@include file="userheader.jsp" %> 
        <input type="hidden" value="<%= session.getAttribute("emailid").toString()%>" id="email" />
        <div class="container" style="min-height: 400px ">
            <div class="row">
                <div id="d5" class="col-sm-12">

                </div>
            </div>
        </div>
        <br>
        <br>
        <%@ include file ="userheader.jsp" %>
    </body>
</html>
