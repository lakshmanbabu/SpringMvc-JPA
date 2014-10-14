<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Create New User</title>
</head>
<style type="text/css">

</style>
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
                                            <input type="text" class="form-control" name="contactno" id="contactno"  placeholder="Enter contactno">
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
                                           <!--  <input type="text" class="form-control" name="country" id="country" required="required" placeholder="Enter country"> -->
	                                        <select onchange="print_state('state',this.selectedIndex);" id="country" name ="country"   class="form-control" required="required">
										        <option >Select Country</option>
										    </select>
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputstate">State</label>
                                          <!--   <input type="text" class="form-control" name="state" id="state" required="required" placeholder="Enter state"> -->
                                        <select name ="state" id="state" required="required" class="form-control">
								        	<option >Select State</option>
									        <option value="Alabama">Alabama</option>
									        <option value="Alaska">Alaska</option>
									        <option value="Arizona">Arizona</option>
									        <option value="Arkansas">Arkansas</option>
									        <option value="California">California</option>
									        <option value="Colorado">Colorado</option>
									        <option value="Connecticut">Connecticut</option>
									        <option value="Delaware">Delaware</option>
									        <option value="Florida">Florida</option>
									        <option value="Georgia">Georgia</option>
									        <option value="Hawaii">Hawaii</option>
									        <option value="Idaho">Idaho</option>
									        <option value="Illinois">Illinois</option>
									        <option value="Indiana">Indiana</option>
									        <option value="Iowa">Iowa</option>
									        <option value="Kansas">Kansas</option>
									        <option value="Kentucky">Kentucky</option>
									        <option value="Louisiana">Louisiana</option>
									        <option value="Maine">Maine</option>
									        <option value="Maryland">Maryland</option>
									        <option value="Massachusetts">Massachusetts</option>
									        <option value="Michigan">Michigan</option>
									        <option value="Minnesota">Minnesota</option>
									        <option value="Mississippi">Mississippi</option>
									        <option value="Missouri">Missouri</option>
									        <option value="Montana">Montana</option>
									        <option value="Nebraska">Nebraska</option>
									        <option value="Nevada">Nevada</option>
									        <option value="New Hampshire">New Hampshire</option>
									        <option value="New Jersey">New Jersey</option>
									        <option value="New Mexico">New Mexico</option>
									        <option value="New York">New York</option>
									        <option value="North Carolina">North Carolina</option>
									        <option value="North Dakota">North Dakota</option>
									        <option value="Ohio">Ohio</option>
									        <option value="Oklahoma">Oklahoma</option>
									        <option value="Oregon">Oregon</option>
									        <option value="Pennsylvania">Pennsylvania</option>
									        <option value="Rhode Island">Rhode Island</option>
									        <option value="South Carolina">South Carolina</option>
									        <option value="South Dakota">South Dakota</option>
									        <option value="Tennessee">Tennessee</option>
									        <option value="Texas">Texas</option>
									        <option value="Utah">Utah</option>
									        <option value="Vermont">Vermont</option>
									        <option value="Virginia">Virginia</option>
									        <option value="Washington">Washington</option>
									        <option value="West Virginia">West Virginia</option>
									        <option value="Wisconsin">Wisconsin</option>
									        <option value="Wyoming">Wyoming</option>
								    	</select>
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
                                                <input type="checkbox" id="acceptId" > Form Agreement Acceptance
                                            </label>
                                        </div>
                                    </div>

                                    <div class="box-footer" align="center">
                                    	 <button type="reset" class="btn btn-primary">Reset</button>&nbsp;&nbsp;&nbsp;&nbsp;
                                         <button type="submit"  id="submitBtn" class="btn btn-primary">Submit</button>
                                          
                                    </div>
                                </form>
                            </div>

                        </div>
                       
                    </div>   
                </section>
            </aside>
        </div>
  

<script language="javascript">print_country("country");</script> 
 
<script type="text/javascript">
  
  $('select option[value="USA"]').attr("selected",true);
  
  var contextPath;
  $(function(){
	  contextPath = $('#contextPath').val();
	  ShowTime();
	 /*  $("#submitBtn").click(function(){
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
	  }); */
	  
	 //form validation messages
	 
	  $("#New-Userform").validate({
			errorClass:'InputError',
			validClass:'InputSuccess',
			rules: {
				username:{required:true},
				firstname:{required:true},
				 lastname:{required:true},
				password:{required:true},
				email:{required:true},
				userRole:{required:true},
				category:{required:true},
				gender:{required:true},
				country:{required:true},
				state:{required:true},
				city:{required:true},
				acceptId:{required:true}, 
				},
				
			messages: {			
				username: {
					required: "Please Enter Username"
				},
			    firstname: {
					required: "Please Enter Firstname"
				},
				lastname: {
					required: "Please Enter Lastname"
				},
				password: {
					required: "Please Enter Password"
				},
				email: {
					required: "Please Enter valid email"
				},
				userRole: {
					required: "Please Select User Role"
				},
				category: {
					required: "Please Select Category"
				},
				gender: {
					required: "Please Select Gender"
				},
				country: {
					required: "Please Select Country"
				},
				state: {
					required: "Please Select State"
				},
				city: {
					required: "Please Enter City"
				},
				acceptId: {
					required: "Please Accept form"
				}, 
				
			},
			submitHandler: function(form) {			 
				contextPath = $('#contextPath').val();
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
				}
			});
	  
  });
  
  </script>
        
</body>
</html>