 

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
                 
           background:url(img/bg.jpg);
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
                  <button class="btn btn-outline-light  btn-lg" ><span class="fa fa-keyboard-o"></span>Start! its free </button>
                   <a href="login.jsp" class="btn btn-outline-light btn-lg"> <span class="fa fa-user-circle fa-spin"></span>  Login</a>
                   
                 </div>
                 
             </div>
             
         </div>
         
         
<!--         cards
-->         <div class="container">
             <div  class=row mb-3">
                 <div class="col-md-4">
                     <div class="card">
                    
                       <div class="card-body">
                         <h5 class="card-title">Java Programming Language</h5>
                         <p class="card-text"> Java is a widely-used programming language for coding web applications. It has been a popular choice among developers for over two decades, with millions of Java applications in use today. Java is a multi-platform, object-oriented, and network-centric language that can be used as a platform in itself.</p>
                           
                        </div>
                      </div>
                     
                 </div>
                 <div class="col-md-4">
                     <div class="card">
                    
                       <div class="card-body">
                         <h5 class="card-title">C++ Programming Language</h5>
                         <p class="card-text"> C++ is the most used and most popular programming language developed by Bjarne Stroustrup. C++ is a high-level and object-oriented programming language. This language allows developers to write clean and efficient code for large applications and software development, game development, and operating system programming. It is an expansion of the C programming language to include Object Oriented Programming(OOPs) and is used to develop programs for computers. </p>
                           
                        </div>
                      </div>
                     
                 </div>
                 <div class="col-md-4">
                     <div class="card">
                    
                       <div class="card-body">
                         <h5 class="card-title">Data Structures</h5>
                         <p class="card-text"> A data structure is a specialized format for organizing, processing, retrieving and storing data. There are several basic and advanced types of data structures, all designed to arrange data to suit a specific purpose. Data structures make it easy for users to access and work with the data they need in appropriate ways.</p>
                           
                        </div>
                      </div>
                     
                 </div>
                 
             </div>
         </div>
<!--         <div class="container">
             <div class=row mb-3">
                 <div class="col-md-4">
                     <div class="card">
                    
                       <div class="card-body">
                         <h5 class="card-title">Java Programming Language</h5>
                         <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                          <a href="#" class="btn primary-background text-white">Read More</a>
                        </div>
                      </div>
                     
                 </div>-->
<!--                 <div class="col-md-4">
                     <div class="card">
                    
                       <div class="card-body">
                         <h5 class="card-title">Java Programming Language</h5>
                         <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                          <a href="#" class="btn primary-background text-white">Read More</a>
                        </div>
                      </div>
                     
                 </div>-->
<!--                 <div class="col-md-4">
                     <div class="card">
                    
                       <div class="card-body">
                         <h5 class="card-title">Java Programming Language</h5>
                         <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                          <a href="#" class="btn primary-background text-white">Read More</a>
                        </div>
                      </div>
                     
                 </div>-->
                 
<!--             </div>
         </div>-->
  
          
         
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
