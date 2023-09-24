

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
       <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      
    </head>
    <script>
              var xmlhttp;
            function fetchfriends()
            {
              
                xmlhttp = new XMLHttpRequest();
                xmlhttp.open("GET", "./friend_list", true);
                xmlhttp.onreadystatechange = result6;
                xmlhttp.send();


            }
            function result6()
            {


                if (xmlhttp.readyState == 4 && xmlhttp.status == 200)
                {



                   // var res = xmlhttp.responseText.trim();


                    var mainjson = JSON.parse(xmlhttp.responseText.trim());


                    var jsa = mainjson["ans"];
                    var length = jsa.length;
                    var ans = "";

                    document.getElementById("count").innerHTML = "Total Friends: " +jsa.length;
                    
                    
                    ans += "<hr>";
                    ans += "<div  class='row'>";
                    for (var i = 0; i < length; i++)
                    {
                        var js = jsa[i];


                        ans += "<div class='col-md-4' ><div style='padding: 10px; border: solid 3px  #006666;margin-top: 10px; border-radius: 4px'><img src='" + js["Photo"] + "'  style='margin-right: 10px; width: 100px; height: 100px' class='img img-thumbnail' /><a href=Friend_Profile2.jsp?emailid=" + js["emailid"] + "><label style='font-size: 20px;color:  #006666'>" + js["Fullname"] + "</label></a>&nbsp;<input type='button' value='Unfriend' onclick=\"DeleteFriend('" + js["emailid"] + "')\" style='float: right' class='btn btn-danger'></div></div></a>";


                    }
                    ans += "</div>";
                    document.getElementById("d6").innerHTML = ans;



                }
            }
            function DeleteFriend(email)
            {
                var email1 = document.getElementById("email").value;

                var ans = confirm('Are you sure you want to delete?');
                if (ans == true)
                {
                    xmlhttp = new XMLHttpRequest();
                    xmlhttp.open("GET", "./Delete_Friend?email=" + email + "&email1=" + email1, true);
                    xmlhttp.onreadystatechange = result7;
                    xmlhttp.send();
                }


            }
            function result7()
            {

                if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {

                    var res = xmlhttp.responseText.trim();
                    alert(res);
                    fetchfriends();

                }
            }



    </script>
    <body onload="fetchfriends()" >

        <%@ include file ="userheader.jsp" %>
       <input type="hidden" value="<%=session.getAttribute("emailid")%>" id="email" />
       
        <div class="container">
            <div class="row">
                
                <h1 id="count"  style="color:  #006666"> </h1>
                <div id="d6" class="col-md-12">
                </div>
            </div>
        </div>
       <%@include file="footer.jsp" %>
    </body>
</html>
