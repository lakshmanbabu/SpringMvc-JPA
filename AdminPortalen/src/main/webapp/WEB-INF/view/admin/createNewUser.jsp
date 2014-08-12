<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Create New User</title>
</head>
<body class="skin-blue">

	<div class="wrapper row-offcanvas row-offcanvas-left">
            <aside class="right-side">
                <!-- Content Header (Page header) -->
                <section class="content-header">
                    <h1>
                        Create New User
                        <small>create user</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="${contextPath}/admin/adminHome"><i class="fa fa-dashboard"></i>Home</a></li>
                        <li class="active">Create New user</li>
                    </ol>
                </section>
 		<input type="hidden" id="contextPath" value="${contextPath}"/>
                <!-- Main content -->
                <section class="content">
                    <div class="row" style="margin-left: 190px;">
                        <!-- left column -->
                        <div class="col-md-6">
                            <!-- general form elements -->
                            <div class="box box-primary">
                                <div class="box-header">
                                    <h3 class="box-title">Create User</h3>
                                </div><!-- /.box-header -->
                                <!-- form start -->
                                <form role="form" id="New-Userform">
                                    <div class="box-body">
                                      <div class="form-group">
                                            <label for="exampleInputEmail1">Username</label>
                                            <input type="text" class="form-control" name="username" id="username" required="required" placeholder="Enter username">
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputEmail1">Email address</label>
                                            <input type="email" class="form-control" name="email" id="email" required="required" placeholder="Enter email">
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">Password</label>
                                            <input type="password" class="form-control" name="password" id="password" required="required" placeholder="Password">
                                        </div>
                                          <div class="form-group">
                                            <label for="exampleInputfirstname">First Name</label>
                                            <input type="text" class="form-control" name="firstname" id="firstname" required="required" placeholder="Enter firstname">
                                        </div>
                                          <div class="form-group">
                                            <label for="exampleInputlastName">Last Name</label>
                                            <input type="text" class="form-control" name="lastname" id="lastname" required="required"  placeholder="Enter lastname">
                                        </div>
                                          <div class="form-group">
                                            <label for="exampleInputcontact">Contact Number</label>
                                            <input type="text" class="form-control" name="contactno" id="contactno" required="required" placeholder="Enter contactno">
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputcontact">user Role</label>
                                             <select name="userRole" id="userRole" class="form-control" required="required">
												<option value="">Select UserRole</option>
												<option value="ROLE_ADMIN">ROLE_ADMIN</option>
												<option value="ROLE_USER">ROLE_USER</option>
											</select>
										</div>
										  <div class="form-group">
                                            <label for="exampleInputcontact">Category</label>
                                           <select name="category" id="category" class="form-control" required="required">
						    					<option value="" selected="selected">Select category</option>
						    					<option value="Trainee">Trainee</option>
						    					<option value="Associate Software Engineer">Associate Software Engineer</option>
						    					<option value="Software Engineer">Software Engineer</option>
						    					<option value="System Engineer">System Engineer</option>
						    					<option value="Testing Engineer">Testing Engineer</option>
						    					<option value="System Admin">System Admin</option>
						    					<option value="Team Leader">Team Leader</option>
						    					<option value="Module Leader">Module Leader</option>
						    					<option value="Manager">Manager</option>
						    					<option value="C.E.O">C.E.O</option>
						    				</select>
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputcontact">Gender</label>
                                           <select name="gender" id="gender" class="form-control" required="required">
						    					<option value="" selected="selected">Select gender</option>
						    					<option value="male">Male</option>
						    					<option value="female">Female</option>
						    				</select>
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputcountry">Country</label>
                                            <input type="text" class="form-control" name="country" id="country" required="required" placeholder="Enter country">
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputstate">State</label>
                                            <input type="text" class="form-control" name="state" id="state" required="required" placeholder="Enter state">
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputcity">City</label>
                                            <input type="text" class="form-control" name="city" id="city" required="required" placeholder="Enter city">
                                        </div>
                                    	<!-- <div class="form-group">
                                            <label for="exampleInputFile">File input</label>
                                            <input type="file" id="exampleInputFile">
                                            <p class="help-block">Example block-level help text here.</p>
                                        </div> -->
                                        <div class="checkbox">
                                            <label>
                                                <input type="checkbox">Agreeed
                                            </label>
                                        </div>
                                    </div>

                                    <div class="box-footer" align="center">
                                    	 <button type="reset" class="btn btn-primary">Reset</button>&nbsp;&nbsp;&nbsp;&nbsp;
                                         <button type="button"  id="submitBtn" class="btn btn-primary">Submit</button>
                                          
                                    </div>
                                </form>
                            </div>

                        </div>
                       
                    </div>   
                </section>
            </aside>
        </div>
  
  <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
  <script type="text/javascript">
  var contextPath;
  $(function(){
	  contextPath = $('#contextPath').val();
	  ShowTime();
	  $("#submitBtn").click(function(){
		$.blockUI({ 
	    		message: '<h3><img src="'+contextPath+'/resources/bootstrap/images/ajax-loader.gif"/></h3>',
	    		css: { 
	                border: 'none',     	               
	                '-webkit-border-radius': '10px', 
	                '-moz-border-radius': '10px',
	            } 
	    	}); 
			 
		  $.post(contextPath+"/admin/saveUserDetails",$('#New-Userform').serialize(), function(data) {
			  	$.unblockUI();
			  	 bootbox.alert(data.message,function(){
					});
		         $('#New-Userform')[0].reset();
		            //location.reload();
		      }); 
	  });
	  
	  
	  
  });
  
  </script>
        
</body>
</html>