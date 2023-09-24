<link rel="stylesheet" href="css/bootstrap.css">
<!-- Bootstrap-Core-CSS -->
<link rel="stylesheet" href="css/style.css" type="text/css" media="all" />
<!-- Style-CSS -->
<!-- font-awesome-icons -->
<link href="css/font-awesome.css" rel="stylesheet">
<!-- //font-awesome-icons -->
<!-- /Fonts -->
<link href="//fonts.googleapis.com/css?family=Poppins:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900" rel="stylesheet">
<link href="//fonts.googleapis.com/css?family=Source+Sans+Pro:200,200i,300,300i,400,400i,600,600i,700,700i,900" rel="stylesheet">
<!-- //Fonts -->
<%@page import="java.sql.ResultSet"%>
<%@page import="vmm.DBLoader"%>
<link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
<script src="js/bootstrap.js" type="text/javascript"></script>
<script>


    function UserFetch(val)
    {
        if (val == "")
        {
            document.getElementById("search").innerHTML = "";
            document.getElementById("search").style.visibility = "hidden";
        } else
        {
            var xmlhttp = new XMLHttpRequest();

            xmlhttp.onreadystatechange = function ()
            {
                if (xmlhttp.readyState == 4 && xmlhttp.status == 200)
                {

                    var res = xmlhttp.responseText.trim();
                    var mainjson = JSON.parse(res);
                    var jsa = mainjson["ans"];
                    var ans = "";
                    for (var i = 0; i < jsa.length; i++)
                    {
                        var js = jsa[i];
                        ans += "<a href='Friend_Profile2.jsp?emailid=" + js["emailid"] + "'><div class='row' style='padding: 5px; cursor: pointer'><div class='col-sm-12' style='color: black'><img src='" + js["Photo"] + "' width='40' height='40' style='margin-right: 20px' class='img img-circle img-thumbnail' />" + js["Fullname"] + "</div></div></a>";
                    }
                    document.getElementById("search").style.visibility = "visible";

                    document.getElementById("search").innerHTML = ans;

                }
            };
            xmlhttp.open("GET", "./search_friends?value=" + val, true);
            xmlhttp.send();
        }
    }
</script>
<%
      String myname,myphoto;
      myname=myphoto="";
     ResultSet rs =  DBLoader.executeQuery("select * from users where emailid='" + session.getAttribute("emailid").toString() + "'");
      
      if(rs.next())
      {
          myname = rs.getString("Fullname");
         myphoto = rs.getString("Photo");
      }
      
%>

<header style=";position: static!important; margin-bottom:  40px">
    <div style="background-color: #1c1d21;" >

        <nav class="navbar navbar-expand-md navbar-dark">
            <a href="PublicHomeNew.jsp" class="navbar-brand"><h1>CODERS HUB</h1></a>
            <button type="button" class="navbar-toggler" data-toggle="collapse"
                    data-target="#menubar1">
                <span class="navbar-toggler-icon"></span>          
            </button>
            <div class="collapse navbar-collapse" id="menubar1">
                <ul class="navbar-nav">
                    <li class="nav-item"><a id="home" class="nav-link" href="homepage.jsp">Home</a></li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">View</a>
                        <div class="dropdown-menu">
                            <a class="dropdown-item" href="MyFriends.jsp">My friends</a>
                            <a class="dropdown-item" href="view_pending_request.jsp">pending requests</a> 
                            <a class="dropdown-item" href="codessharedwithme.jsp">shared codes</a> 
                            <a class="dropdown-item" href="mysharedcodes.jsp">MY shared codes</a> 
                            <a class="dropdown-item" href="sample codes.jsp">sample codes</a> 

                        </div>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">Raman<%= myname%></a>
                        <div class="dropdown-menu">
                            <a class="dropdown-item" href="myprofile.jsp"><%=myphoto%></a>
                            <a class="dropdown-item" href="changepassword.jsp">Change Password</a> 
                            <a class="dropdown-item" href="logout.jsp">Logout</a> 
                        </div>
                    </li>


                    <li style="position: relative">
                        <form class="form-inline my-2 my-lg-0">
                            <input class="form-control mr-sm-2" 
                                   onkeyup="UserFetch(this.value)" type="search" placeholder="Search" aria-label="Search">
                            <div id="search" style="width: 200px ; z-index: 1000;position: absolute;top: 50px; left: 0px;background: #ffffff; border: solid 1px darkgray; visibility: hidden">
                            </div>
                        </form>
                    </li>
                </ul>
            </div>
        </nav>
    </div>
</header>