 

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Page</title>
        <!--css-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
         <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">  
        <style>
             .banner-background{
                   clip-path: polygon(50% 0%, 100% 0, 100% 35%, 100% 92%, 80% 90%, 48% 94%, 18% 89%, 0% 100%, 0% 35%, 0 0);
             }
               body{
                 
    background-color: #4158D0;
    background-image: linear-gradient(43deg, #4158D0 0%, #d71678 46%, #276a9b 100%);
            }
            .primary-background{
    
    background-color:#171a16;
   background: linear-gradient(43deg, #0e0e0e 0%, #141414 46%, #3512f5 100%);
}
 
.modal-body{
    background:#12192c;
 color: white;
}
          </style>
    </head>
    <body>
        <%@include file="normal_navbar.jsp" %>
        <main class="primary-background p-8" >
            <div class="container " >
                <div class="col-md-6 offset-md-3"> 
                    <div class="card" >
                        <div class="card-header text-center primary-background text-white">
                            <span class="fa fa-3x fa-user-circle"></span>
                            <br>
                            Register Here
                            
                        </div>
                        <div class="card-body">
                            <form id="reg-form" action="RegisterServlet" method="POST">
  <div class="form-group">
    <label for="user_name">User Name</label>
    <input name="user_name" type="text" class="form-control" id="user_name" aria-describedby="emailHelp" placeholder="Enter name">
     
  </div>
  <div class="form-group">
    <label for="exampleInputEmail1">Email address</label>
    <input name="user_email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
    
  </div>
                                
                                
  <div class="form-group">
    <label for="exampleInputPassword1">Password</label>
    <input name="user_password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
  </div>
  <div class="form-group">
    <label for="gender">Select Gender</label>
    <br>
    <input type="radio" id="gender" name="gender" value="male">Male
    <input type="radio" id="gender" name="gender" value="female">Female
    
  </div>
   <div class="form-group">
       <textarea name="about" class="form-control" id="" rows="3" placeholder="Enter someting about yourself"></textarea>
  </div>                                              
                                
                                
  <div class="form-check">
    <input name="check" type="checkbox" class="form-check-input" id="exampleCheck1">
    <label class="form-check-label" for="exampleCheck1">Agree terms and conditions</label>
  </div>
                                      
                                <div class="container text-center" id="loader" style="display:none;">
                                     <span class="fa fa-refresh fa-spin"></span> 
                                     <br>
                                </div>
                                
  <button id="submit-btn" type="submit" class="btn btn-primary">Sign In</button>
</form>
                            
                            
                        </div>
                         
                    </div>
                </div>
            </div>
        </main>
        
          <!--javascript-->
         
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
        <script src="js/myjs.js" type="text/javascript"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <script>
            $(document).ready(function(){
                console.log("loaded....");
                
                $('#reg-form').on('submit',function(event){
                    event.preventDefault();
                    
                    let form=new FormData(this);
                    $("#submit-btn").hide();
                    $("#loader").show();
                    //send register servlet
                    
                    $.ajax({
                       url: "RegisterServlet",
                       type: 'POST',
                       data: form,
                       success: function(data,textStatus,jqXHR){
                           console.log(data);
                           $("#submit-btn").show();
                           $("#loader").hide();
                           
                           if(data.trim()==='done'){
                               swal("registered successfully..redirecting to login page")
                            .then((value) => {
                             window.location="login.jsp";
                     });
                           }
                           else{
                               swal(data);
                           }
                           
                            
                       
                           
                       },
                       error:function(jqXHR,textStatus,errorThrown){
                           
                            $("#submit-btn").show();
                           $("#loader").hide();
                           swal("something went wrong... try again");
                             
                           
                       },
                       processData:false,
                       contentType:false
                    });
                });
            });
          </script>
    </body>
</html>
