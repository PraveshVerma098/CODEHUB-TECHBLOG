 

<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import= "java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!--css-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
         <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">  
         <style>
             .banner-background{
                  clip-path: polygon(50% 0%, 100% 0, 100% 35%, 100% 92%, 80% 90%, 48% 94%, 18% 89%, 0 100%, 0% 35%, 0 0);
             }
               body{
                 
           background:url(img/bgp.jpg);
                background-size: cover;
                background-attachment: fixed;  
            }
            .primary-background{
    
    background-color:#171a16;
   background: linear-gradient(43deg, #0e0e0e 0%, #141414 46%, #3512f5 100%);
}
.card{
 background:#12192c;
 color: white;
 
}
.modal-body{
    background:#12192c;
    color: white;
}
.s{
    background: #b72e2e0a; 
    color: #3c2828;
}
   
.f{
 background: #b72e2e0a;
}
         </style>
    </head>
    <body>
       
         <!--navbar-->
         <%@include file="normal_navbar.jsp" %>
         
         
         
         <div class="container-fluid p-0 m-0 banner-background">
             <div class="jumbotron primary-background ">
                 <div class="container">
                 <h3 class="display-3 text-white">Welcome To CodesHub-TechBlog</h3>
                 
                 <p class=" text-white">A programming language is a type of written language that tells computers what to do. Examples are: Python, Ruby, Java, JavaScript, C, C++, and C#. Programming languages are used to write computer programs and computer software. A programming language is like a set of commands that tell the computer how to do things.

                  </p>
                  <a href="Register_page.jsp" class="btn btn-outline-light  btn-lg" ><span class="fa fa-keyboard-o"></span>Start! its free </button>
                   <a href="login.jsp" class="btn btn-outline-light btn-lg"> <span class="fa fa-user-circle fa-spin"></span>  Login</a>
                   
                 </div>
                 
             </div>
             
         </div>
         
         

          
         
          <!--javascript-->
 <script
  src="https://code.jquery.com/jquery-3.7.1.min.js"
  integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
  crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<!--<script>
    $(document).ready(function(){
        alert("document loaded")
    })
</script>-->
  
 
        
    </body>
</html>
