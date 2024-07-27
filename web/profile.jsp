 
<%@page import="com.tech.blog.entities.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.entities.Message"%>
<%@page import="com.tech.blog.entities.User" %>
<%@page errorPage="error_page.jsp" %>
<%
    User user=(User)session.getAttribute("currentUser");
    if(user==null){
        response.sendRedirect("login.jsp");
    }
    
 %>   

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                 
      
                  background-color: #4158D0;
    background-image: linear-gradient(43deg, #4158D0 0%, #d71678 46%, #276a9b 100%);
            
            
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
         

        
        <nav class="navbar navbar-expand-lg navbar-dark primary-background">
            <a class="navbar-brand" href="index.jsp"><span class="fa fa-cube"></span>Tech Blog</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="navbar-brand" href="#"><span class="fa fa-bell-o"</span>Code Special <span class="sr-only">(current)</span></a>
      </li>
      
      <li class="nav-item dropdown">
        <a class="navbar-brand dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown"  aria-expanded="false">
          <span class="fa fa-check-square-o"</span>
          Categories
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="#">Programming Language</a>
          <a class="dropdown-item" href="#">Data Structure</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Project Implementation</a>
        </div>
      </li>
       
      <li class="nav-item">
          <a class="navbar-brand" href="#"><span class="fa fa-address-book-o"</span>Contacts</a>
      </li>
      <li class="nav-item">
          <a class="navbar-brand" href="#" data-toggle="modal" data-target="#add-post-modal"><span class="fa fa-asterisk"</span>Do Post</a>
      </li>
       
     
          </ul>
      <ul class="navbar-nav mr-right">
          <li class="nav-item">
          <a class="navbar-brand" href="#!" data-toggle="modal" data-target="#profile-modal" ><span class="fa fa-user-circle"</span><%= user.getName() %></a>
      </li>
           <li class="nav-item">
          <a class="navbar-brand" href="LogoutServlet"><span class="fa fa-circle-o-notch"</span>Logout</a>
      </li>
      </ul>
  </div>
</nav>
   
   
        
        <!--end of navbar-->
        <%
                                 Message m=(Message)session.getAttribute("msg");
                                 if(m!=null){
                                 %>
                                 <div class="alert <%= m.getCssClass() %>" role="alert">
                                  <%= m.getContent() %>
                                </div>
                                <% 
                                    session.removeAttribute("msg");
                                }
       %>
        
       <!--main body of the page-->
       <main>
            <div class="container">
                <div class="row mt-4">
                    <!--first col-->
                    <div class="col-md-4">
                        <!--categories-->
                        <div class="list-group">
                            <a href="#" onclick="getPosts(0, this)"  class=" c-link list-group-item list-group-item-action active">
                                All Posts
                            </a>
                            <!--categories-->

                            <%  PostDao d = new PostDao(ConnectionProvider.getConnection());
                                ArrayList<Category> list1 = d.getAllCategories();
                                for (Category cc : list1) {

                            %>
                            <a href="#" onclick="getPosts(<%= cc.getCid()%>, this)" class=" c-link list-group-item list-group-item-action"><%= cc.getName()%></a>


                            <%                                        }

                            %>
                        </div>

                    </div>

                    <!--second col-->
                    <div class="col-md-8" >
                        <!--posts-->
                        <div class="container text-center" id="loader">
                            <i class="fa fa-refresh fa-3 x fa-spin"></i>
                            <h3 class="mt-6">Loading...</h3>
                        </div>

                        <div class="container-fluid" id="post-container">

                        </div>
                    </div>

                </div>

            </div>

        </main>


        <!--end main body of the page-->
    
                                
                                
        
        <!--profile modal-->
        

<!-- Modal -->
<div class="modal fade" id="profile-modal" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header primary-background text-white">
        <h5 class="modal-title" id="staticBackdropLabel">TechBlog</h5>
        <button type="button" class="btn btn-close " data-dismiss="modal" aria-label="Close-btn"></button>
      </div>
      <div class="modal-body">
          <div class="container text-center">
              <img src="pics/download.png"  class="img-fluid" style="border-radius:50%;max-width: 150px;" />
               
              <h5 class="modal-title" id="staticBackdropLabel"><%= user.getName()%></h5>
<!--    details profile-->
    <div id="profile-details">
             <table class="table">
   
  <tbody>
    <tr>
      <th scope="row">ID :</th>
      <td><%=user.getId()%></td>
       
    </tr>
    <tr>
      <th scope="row">Email :</th>
      <td><%=user.getEmail()%></td>
           </tr>
    <tr>
      <th scope="row">Gender :</th>
      <td colspan="2"><%=user.getGender()%></td>
    </tr>
    
    <tr>
      <th scope="row=2">About :</th>
      <td colspan="2"><%=user.getAbout()%></td>
    </tr>
     
 
  </tbody>
</table>
          </div>
      
<!--    end of profile details
    edit profile-->
     <div id="profile-edit" style="display:none;">
                                     
                            <form action="EditServlet" method="post" enctype="multipart/form-data">

                                <table class="table">
                                    <tr>
                                        <td>Id :</td>
                                        <td><%=user.getId()%></td>
                                    </tr>
                                    <tr>
                                        <td>Name :</td>
                                        <td><input type="text" class="form-control" name="user_name" value="<%=user.getName()%>"></td>
                                    </tr>
                                    <tr>
                                        <td>Email :</td>
                                        <td><input type="email" class="form-control" name="user_email" value="<%=user.getEmail()%>"></td>
                                    </tr>
                                    <tr>
                                        <td>Password :</td>
                                        <td><input type="password" class="form-control" name="user_password" value="<%=user.getPassword()%>"></td>
                                    </tr>
                                  
                                    <tr>
                                        <td>Gender :</td>

                                        <td><%=user.getGender().toUpperCase()%></td>

                                    </tr>
                                    <tr>
                                        <td>About :</td>

                                        <td>
                                            <div class="form-group">
                                                <textarea  class="form-control" name="user_about" style="height :100px;" ><%=user.getAbout() %>
                                            </textarea>
                                            </div>

                                        </td>

                                    </tr>
                                     
                                    <tr>
                                        <td>Profile Picture:</td>
                                        <td><input type="file" class="form-control" name="image" ></td>
                                    </tr>


                                </table>
                                <div class="container text-center">
                                    <button type="submit" class="btn btn-outline-primary">Save</button>
                                </div>

                            </form>


                        </div>


        
    </div>
      </div>
<!--    end of edit profile-->
     
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button id="edit-profile-button" type="button" class="btn btn-primary">Edit</button>
      </div>
    </div>
  </div>
</div>
        
<!--end of profile modal-->
 <!--post modal start-->
    
  


<div class="modal fade" id="add-post-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Provide Post Details..</h5>
        <button type="button" class="btn-close" data-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
          <form id="add-post-form" action="AddPostServlet" method="Post">
              <div class="form-group">
                  <select class="form-control" name="cid">
                      <option selected disabaled>---Select categories--</option>
                                <%
                                        PostDao postd = new PostDao(ConnectionProvider.getConnection());
                                        ArrayList<Category> list = postd.getAllCategories();
                                        for (Category c : list) {
                                    %>
                                    <option value="<%= c.getCid()%>"><%=c.getName()%></option>
                                    <% }
                                    %>

                      
                  </select>
                  
              </div>
              <div class="form-group">
                  <input name="pTitle" type="text" placeholder="Enter Post Title" class="form-control"/>
              </div>
              <div class="form-group">
                  <textarea name="pContent" class="form-control" style="height :100px;" placeholder="Enter Your Content"></textarea>
              </div>
              <div class="form-group">
                  <textarea name="pCode" class="form-control" style="height :100px;" placeholder="Enter Your Code(if any)"></textarea>
              </div>
              <div class="form-group">
                  <label>Select Your Pic..</label>
                  <br>
                  <input  type="file" name="pic">
              </div>
               
                                    <div class="container text-center" >
                                        <button type="submit" class="btn btn-outline-primary" >Post</button>
                                    </div>
          </form>
          
      </div>
       
    </div>
  </div>
</div>


 
 <!--post modal end-->

  
    <!--javascript-->
  
     
 <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<!--<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>-->
        
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
<script src="js/myjs.js" type="text/javascript"></script>

 
        <script>
                                $(document).ready(function () {
                                    let editStatus = false;
                                    $('#edit-profile-button').click(function () {

                                        if (editStatus === false)
                                        {
                                            $('#profile-details').hide();
                                            $('#profile-edit').show();
                                            editStatus = true;
                                            $(this).text("Back");

                                        } else
                                        {
                                            $('#profile-details').show();
                                            $('#profile-edit').hide();
                                            editStatus = false;
                                            $(this).text("Edit");

                                        }

                                    });
                                });
        </script>
        <!--now add post javascript-->
        <script>
            $(document).ready(function (e) {
                


                $("#add-post-form").on("submit", function (event) {
                    event.preventDefault(); //stop page to go to servlet
                    console.log("you have clicked on submit..");
                    let form = new FormData(this);
                    //use ajax to do Asynchronous method to save post
                    $.ajax({
                        url: "AddPostServlet",
                        type: 'POST',
                        data: form,
                        //when request successfull

                        success: function (data, textStatus, jqXHR) {
                            console.log(data);
                            if(data.trim()==='done'){
                                swal("Good job!", "saved successfully!", "success");

                            }
                            else{
//                                swal("Error!", "something went wrong!..", "error");
                                 swal("Good job!", "saved successfully!", "success");

                            }
                            
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            swal("Good job!", "saved successfully!", "success");
//                            swal("Error!", "something... went wrong!..", "error"); 
                        },
                        //now we have to specify data format like jason , or nomal data it is
                        processData: false, //this require to process pic, video data
                        contentType: false


                    });
                });
            });
        </script>
         <!--loading post using ajax-->
         <script>

            function getPosts(catId, temp) {
                $("#loader").show();
                $("#post-container").hide();

                $(".c-link").removeClass('active');


                $.ajax({
                    url: "load_posts.jsp",
                    data: {cid: catId},
                    success: function (data, textStatus, jqXHR) {
                        console.log(data);
                        $("#loader").hide();
                        $("#post-container").show();
                        $('#post-container').html(data);
                        $(temp).addClass('active');

                    }
                });

            }

            $(document).ready(function (e) {

                let allPostRef = $('.c-link')[0];
                getPosts(0, allPostRef);


            });
        </script>
        
        
    </body>
</html>