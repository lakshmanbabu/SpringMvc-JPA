<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>profile page</title>
</head>
<body>
	<div class="wrapper row-offcanvas row-offcanvas-left">
            <!-- Right side column. Contains the navbar and content of the page -->
            <aside class="right-side">
                <!-- Content Header (Page header) -->
                <section class="content-header">
                    <h1>
                        admin profile
                        <small>admin profile</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="${contextPath}/admin/adminHome"><i class="fa fa-dashboard"></i> Home</a></li>
                        <li class="active">admin profile</li>
                    </ol>
                </section>

                <!-- Main content -->
                <section class="content">
                 <br/>
                  <c:url value="/admin/updateadminProfile" var="action"/>
                 <form role="form" action="${action}"  method="POST" enctype="multipart/form-data">
                    <div class="row">
                        <!-- left column -->
                        <div class="col-md-6">
                            <!-- general form elements -->
                            <div class="box box-primary">
                                <div class="box-header">
                                <c:choose>
                                <c:when test="${user.imagePath != null}">
                                	<a href="javascript:void(0);" class="pull-left"><img  alt="no image" title="profile image" class="img-circle " src='<c:url value="/resources/userImage/user${user.userId}.jpg"/>' width="120px;" height="120px;" style="margin-top: 9px;"></a>
                                   </c:when>
                                   <c:otherwise>
                                   <a href="javascript:void(0);" class="pull-left"><img  alt="no image" title="profile image" class="img-circle " src='${contextPath}/resources/Images/administrator.png' width="100px;" height="80px;" style="margin-top: 9px;"></a>
                                   </c:otherwise>
                                  </c:choose> 
                                    <h3 class="box-title"> &nbsp;&nbsp;update user profile</h3>
                                </div><!-- /.box-header -->
                                <!-- form start -->
                                
                                
                                <input type="hidden" name="userId" id="userId"  value="${user.userId}" >
                                    <div class="box-body">
                                         <div class="form-group">
                                            <label for="exampleInputEmail1">Username</label>
                                            <input type="text" class="form-control" name="username" id="username"  value="${user.username}" required="required" placeholder="Enter username">
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputEmail1">Email address</label>
                                            <input type="email" class="form-control" name="email" id="email" value="${user.email}" required="required" placeholder="Enter email">
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">Password</label>
                                            <input type="password" class="form-control" name="password" id="password" value="${user.password}" required="required" placeholder="Password">
                                        </div>
                                          <div class="form-group">
                                            <label for="exampleInputfirstname">First Name</label>
                                            <input type="text" class="form-control" name="firstname" id="firstname" value="${user.firstname}" required="required" placeholder="Enter firstname">
                                        </div>
                                          <div class="form-group">
                                            <label for="exampleInputlastName">Last Name</label>
                                            <input type="text" class="form-control" name="lastname" id="lastname" value="${user.lastname}" required="required"  placeholder="Enter lastname">
                                        </div>
                                          <div class="form-group">
                                            <label for="exampleInputcontact">Contact Number</label>
                                            <input type="text" class="form-control" name="contactno" id="contactno" value="${user.contactno}" required="required" placeholder="Enter contactno">
                                        </div>
                                         <div class="form-group">
                                            <label for="exampleInputcontact">Status</label>
                                           <select name="enabled" id="enabled" class="form-control" required="required">
						    					<option value="">Select Status</option>
						    					<option value="1">Active</option>
						    					<option value="0">Inactive</option>
						    				</select>
                                        </div>
                                    </div>

                            </div>
                        </div>
                        <!-- right column -->
                        <div class="col-md-6">
                            <div class="box box-warning">
                                <div class="box-header">
                                    <h3 class="box-title"></h3>
                                </div>
                                <div class="box-body" style="margin-top: 109px;">
                                 
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
                                           <select name="category" id="category" class="form-control" required="required" value="${user.category}">
						    					<option value="" >Select category</option>
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
                                           <select name="gender" id="gender" class="form-control" required="required"  value="${user.gender}">
						    					<option value="">Select gender</option>
						    					<option value="male">Male</option>
						    					<option value="female">Female</option>
						    				</select>
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputcountry">Country</label>
                                            <input type="text" class="form-control" name="country" id="country" value="${user.country}"  required="required" placeholder="Enter country">
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputstate">State</label>
                                            <input type="text" class="form-control" name="state" id="state" value="${user.state}"  required="required" placeholder="Enter state">
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputcity">City</label>
                                            <input type="text" class="form-control" name="city" id="city" value="${user.city}"  required="required" placeholder="Enter city">
                                        </div>
                                    	<div class="form-group">
                                            <label for="exampleInputFile">upload profile pic</label>
                                           	<input class="form-control" type="file" name="file">
                                           <!--  <p class="help-block">Example block-level help text here.</p> -->
                                        </div>
                                        <div class="checkbox">
                                            <label>
                                                <input type="checkbox">&nbsp;&nbsp; Accepting for Update
                                            </label>
                                        </div>
                                        
                                    <div class="box-footer">
                                        <button type="submit" id="updateBtn" class="btn btn-primary">Update</button>
                                    </div>
                                    </div>
                                </div>
                            </div>
                       		</div>
                         </form>
                       </section>
                     </aside>
                </div>
                   
 <script type="text/javascript">
 $(document).ready(function(){
	 ShowTime();
	 var userRole='${user.userRole}';
	 if(userRole=="ROLE_ADMIN"){
		 $("#userRole").val("ROLE_ADMIN");
	 }else{
		 $("#userRole").val("ROLE_USER");
	 }
	 
	 var enabled="{user.enabled}";
	 if(enabled){
	 	$("#enabled").val(1);
	 }else{
		 $("#enabled").val(0);
	 }
	 var category='${user.category}';
	 if(category=="Trainee"){
		 $("#category").val("Trainee");
	 }
	 if(category=="Associate Software Engineer"){
		 $("#category").val("Associate Software Engineer");
	 }
	 if(category=="Software Engineer"){
		 $("#category").val("Software Engineer");
	 }
	 if(category=="System Engineer"){
		 $("#category").val("System Engineer");
	 }
	 if(category=="Testing Engineer"){
		 $("#category").val("Testing Engineer");
	 }
	 if(category=="System Admin"){
		 $("#category").val("System Admin");
	 }
	 if(category=="Team Leader"){
		 $("#category").val("Team Leader");
	 }
	 if(category=="Module Leader"){
		 $("#category").val("Module Leader");
	 }
	 if(category=="Manager"){
		 $("#category").val("Manager");
	 }
	 if(category=="C.E.O"){
		 $("#category").val("C.E.O");
	 }
	 
	 var gender='${user.gender}';
	 if(gender=="male"){
		 $("#gender").val("male");
	 }else{
		 $("#gender").val("female");
	 }
	 
	 //alert(gender);
	 
 });
 
 
 </script>
               
</body>
</html>