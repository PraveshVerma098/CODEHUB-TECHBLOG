 

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isErrorPage="true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sorry! something went wrong</title>
        <!--css-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
         <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">  
         <style>
             .banner-background{
                  clip-path: polygon(50% 0%, 100% 0, 100% 35%, 100% 92%, 80% 90%, 48% 94%, 18% 89%, 0 100%, 0% 35%, 0 0);
             }
         </style>
    </head>
    <body>
        <div class="container text-center mt-3">
            <img src="img/error.png" width="250" class="img-fluid">
            <h3 class="display-3"> Sorry! something went wrong</h3>
            <a href="index.jsp"> <button class="btn primary-background btn-lg text-white mt-3">Home</button></a>
        </div>
    </body>
</html>
