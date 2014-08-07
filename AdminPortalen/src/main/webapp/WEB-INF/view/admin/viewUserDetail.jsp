<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>view Users</title>
</head>
<body class="skin-blue">
  	<div class="wrapper row-offcanvas row-offcanvas-left">
            <aside class="right-side">
                <!-- Content Header (Page header) -->
                <section class="content-header">
                    <h1>
                       View All Users
                        <small>manage all users</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="${contextPath}/admin/adminHome"><i class="fa fa-dashboard"></i> Home</a></li>
                        <li><a href="${contextPath}/admin/viewUserDetail">Users</a></li>
                        <li class="active">View All Users</li>
                    </ol>
                </section>

                <!-- Main content -->
                <section class="content">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="box">
                            
                                <div class="box-header">
                                    <!-- <h3 class="box-title">View All UserDetails</h3> -->
                                </div>
                                <div class="box-body table-responsive">
                                    <table id="example1" class="table table-bordered table-striped">
                                        <thead>
                                            <tr>
                                             	<th>S.No</th>
                                                <th>Username</th>
                                                <th>Password</th>
                                                <th>Email</th>
                                                <th>UserRole</th>
                                                <th>First Name</th>
                                                <th>Last Name</th>
                                                <th>Status</th>
                                                <th>Country</th>
                                                <th>Edit</th>
                                                <th>Delete</th>
                                            </tr>
                                        </thead>
                                        <tbody>
	                                        <c:forEach items="${userslist}" var="users" varStatus="status">
	                                            <tr>
	                                            	<td>${status.count}</td>
	                                                <td>${users.username}</td>
	                                                <td>${users.password}</td>
	                                                <td>${users.email}</td>
	                                                <td>${users.userRole}</td>
	                                                <td>${users.firstname}</td>
	                                                <td>${users.lastname}</td>
	                                                <td>
	                                                <c:choose>
	                                                <c:when test="${users.enabled =='true'}">
	                                                	<span class="label label-success">Active</span>
	                                                </c:when>
	                                                <c:otherwise>
	                                                	<span class="label label-default">Inactive</span>
	                                                </c:otherwise>
	                                                </c:choose>
	                                                </td>
	                                                <td>${users.country}</td>
	                                                <td>
	                                                	<a href="javascript:void(0);" onclick="EditUserDetails('${users.userId}')"><img src="${contextPath}/resources/img/edit.jpg" width="20px" height="20px" /></a>
	                                                </td>
	                                                <td>
    													<a onclick="deleteUser('${users.userId}');" href="javascript:void(0);" ><img src="${contextPath}/resources/img/delete1.png" width="25px"	height="25px" /></a>
	                                                </td>
	                                            </tr>
	                                          </c:forEach>
                                        </tbody>
                                       <!--  <tfoot>
                                            <tr>
                                                <th>Rendering engine</th>
                                                <th>Browser</th>
                                                <th>Platform(s)</th>
                                                <th>Engine version</th>
                                                <th>CSS grade</th>
                                            </tr>
                                        </tfoot> -->
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>

                </section>
            </aside>
        </div>
      
      <input type="hidden" id="contextPath" value="${contextPath}"/>
      
  <div id="editUserDialog" title="Update User" style="display: none; width: 700px; min-height: 16px; max-height: none; height: auto;"> 
				<form id="update-Userform">
				<input type="hidden" name="userId" id="userId" >
				<input type="hidden" name="userRoleId" class="form-control" id="userRoleId">
			    <div style="margin-left: 23px;">
			    	<table>
			    		<tr>
			    			<td style="width: 157px;">First Name</td>
			    			<td><input type="text" name="firstname" class="form-control" id="firstname" style="width: 261px;" required="required"></td>
			    		</tr>
			    		<tr>
			    			<td style="width: 157px;">Last Name</td>
			    			<td><input type="text" name="lastname" class="form-control" id="lastname" style="width: 261px;" required="required"></td>
			    		</tr>
			    		<tr>
			    			<td style="width: 157px;">User Name</td>
			    			<td><input type="text" name="username" class="form-control" id="username" style="width: 261px;" required="required"></td>
			    		</tr>
			    		<tr>
			    			<td style="width: 157px;">Email</td>
			    			<td><input type="text" name="email" class="form-control" id="email" style="width: 261px;" required="required"></td>
			    		</tr>
			    		<tr>
			    			<td style="width: 157px;">Password</td>
			    			<td ><input type="password" name="password" class="form-control" id="password" style="width: 261px;" required="required"></td>
			    		</tr>
			    		<tr>
			    			<td style="width: 157px;">User Role</td>
			    			<td>
			    			<select name="userRole" id="userRole" class="form-control" required="required">
								<option value="">Select UserRole</option>
								<option value="ROLE_ADMIN">ROLE_ADMIN</option>
								<option value="ROLE_USER">ROLE_USER</option>
							</select>
			    			</td>
			    		</tr>
			    		<tr>
			    			<td style="width: 157px;">Status </td>
			    			<td><input type="hidden" id="he"/>
			    				<select name="enabled" id="enabled" class="form-control" required="required">
			    					<option value="">Select Status</option>
			    					<option value="1">Active</option>
			    					<option value="0">Inactive</option>
			    				</select>
			    			</td>
			    		</tr>
			    		
			    		<tr>
			    			<td style="width: 157px;">Category</td>
			    			<td>
			    				 <select name="category" id="category" class="form-control" required="required">
			    					<option value="" selected="selected">Select category</option>
			    					<option value="Trainee">Trainee</option>
			    					<option value="Associate Software Engineer">Associate Software Engineer</option>
			    					<option value="Software Engineer">Software Engineer</option>
			    					<option value="System Engineer">System Engineer</option>
			    					<option value="Testing Engineer">Testing Engineer</option>
			    					<option value="System Admin">System Administrator</option>
			    					<option value="Team Leader">Team Leader</option>
			    					<option value="Module Leader">Module Leader</option>
			    					<option value="Manager">Manager</option>
			    					<option value="C.E.O">C.E.O</option>
			    				</select>
			    			</td>
			    		</tr>
			    			<tr>
			    			<td style="width: 157px;">Gender </td>
			    			<td><input type="hidden" id="he"/>
			    				<select name="gender" id="gender" class="form-control" required="required">
			    					<option value="" selected="selected">Select gender</option>
			    					<option value="male">Male</option>
			    					<option value="female">Female</option>
			    				</select>
			    			</td>
			    		</tr>
			    		<tr>
			    			<td style="width: 157px;">Contact Number</td>
			    			<td><input type="text" name="contactno" class="form-control" id="contactno" style="width: 261px;" required="required"></td>
			    		</tr>
			    		<tr>
			    			<td style="width: 157px;">City</td>
			    			<td><input type="text" name="city" class="form-control" id="city" style="width: 261px;" required="required"></td>
			    		</tr>
			    		<tr>
			    			<td style="width: 157px;">State</td>
			    			<td><input type="text" name="state" class="form-control" id="state" style="width: 261px;" required="required"></td>
			    		</tr>
			    		<tr>
			    			<td style="width: 157px;">Country</td>
			    			<td><input type="text" name="country" class="form-control" id="country" style="width: 261px;" required="required"></td>
			    		</tr>
			    	</table>
			        </div>
			</form>
	</div>
	
<div id="dialog" title="Delete User">
 Are you sure want to delete?
</div>
        
        
 	<!-- ============================== DATA TABES SCRIPT ===================================== -->
 <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
 <script type="text/javascript" src="${contextPath}/resources/js/common.js"></script> 
 
  <script type="text/javascript">
   $(function() {
	   
       $("#example1").dataTable();
       
   });
      
      
  </script>
</body>
</html>