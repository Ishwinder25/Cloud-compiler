<%-- 
    Document   : homepage
    Created on : 1 May, 2020, 1:22:49 PM 
    Author     : hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
        
        </head>
        <body style="background-image: url('myuploads/myuploads/1588238327507.jpg')">
                <%@include file="userheader.jsp" %>
                <div class="container rounded-circle" >


                    <div class="row">
                        <div class="col-md-12 ">

                            <center><h1 style="color: #34ce57">CLOUD COMPILER</h1></center><br>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6 card text-white bg-white " style="border-color: #0b2e13; padding: 20px">
                            <div class="card-body text-primary">
                                <h4 class="class-title text-center">JAVA PROGRAMMING</h4>

                                <center><a style="color: white" href="all_comp.jsp?language=java"><img src="myuploads/myuploads/img2.jpg"  class="img-fluid rounded-circle"/></a></center>
                                <br><br>
                                <pre style="color: #007bff">
                            
              java hello world example 
             public class helloworldexample
                {
             public static void main(String args[])
               {
                System.out.print("HELLO WORLD ");
                }
               }
                                </pre>
                            </div>
                        </div>


                        <div class="col-sm-6 card text-white bg-white" style="border-color: #bd2130">
                            <div class="card-body text-primary">
                                <h4 class="class-title"> MACHINE LEARNING</h4>
                                <center> <a style="color: white" href="all_comp.jsp?language=python"><img src="myuploads/myuploads/2579510_e24c.jpg" class="img-fluid rounded-circle"/></a></center>

                                <pre style="color: #007bff">
                           <center>
              # this program prints HELLO WORLD !!!
                     print(Hello ,world!!!);
                           </center>    </pre>

                            </div>
                        </div>
                    </div>
                    <br><br><br>
                    <div class="row">
                        <div class="col-sm-6 card text-white bg-white " style="border-color: #e4606d">
                            <div class="card-body text-primary">
                                <h4 class="class-title">C PROGRAMMING</h4>
                                <center> <a style="color: white" href="all_comp.jsp?language=c"><img src="myuploads/myuploads/index.jfif" class="img-fluid rounded-circle"/></a></center>

                                <br><br>
                                <pre style="color: #007bff">
                            <center>


             #include
int main()
{
printf() displayes the string
printf("HELLO, WORLD");
RETURN 0;
             </center>
  
                                </pre>
                            </div>
                        </div>


                        <div class="col-sm-6 card text-white bg-white " style="border-color: #ff3333">
                            <div class="card-body text-primary">
                                <h4 class="class-title">OBJECT ORIENTED PROGRAMMING</h4>
                                <center> <a style="color: white" href="all_comp.jsp?language=cpp"><img src="myuploads/myuploads/img1.jpg" class="img-fluid rounded-circle"/></a></center>
                                <br><br>
                                <pre style="color: #007bff">
<center>
    #include
    using namespace std;
    
    int main()
    {
    cout<<"Hello , world!!";
    return 0;
    }
    output
    Hello ,world!!;</center>

                                </pre>

                            </div>

                        </div>


                    </div>
                </div>

                <%@include file="footer.jsp" %>
            </body>
        </html>
