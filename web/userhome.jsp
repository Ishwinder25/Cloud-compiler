<%-- 
    Document   : userhome
    Created on : 28 Apr, 2020, 12:24:54 PM
    Author     : hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="userheader.jsp" %>
        <%           String emailid = (String) (session.getAttribute("emailid"));
        %>

        <h1>Welcome  <%= emailid%> </h1>
    </body>
    <%@include file="footer.jsp" %>
</html>
