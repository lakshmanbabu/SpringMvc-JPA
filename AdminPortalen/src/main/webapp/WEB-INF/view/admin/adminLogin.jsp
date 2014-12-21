<%@ page pageEncoding="ISO-8859-1"  contentType="text/html; charset=UTF-8" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%-- <%@ page session="false"%> --%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>admin Login</title>
</head>
<body>
 
	
	 <c:if test="${not empty error}">
	    <div class="alert alert-error" ><span style="color: red;" >  ${sessionScope['SPRING_SECURITY_LAST_EXCEPTION'].message}</span></div>
	</c:if> 
			
	
	
 <div align="center">
	<h3 align="center" >Admin Login</h3>
		<form name='f' action="<c:url value='/admin/j_spring_security_check' />" method='POST'>
	      
	       <fieldset id="field" style="width: 480px; height: 158px; padding-top: 34px;">
			<table >
				<tr>
					<td>Username  &nbsp;</td>
					<td><input type="text"  name="j_username" id="username" class="form-control" placeholder="Username" style="width: 250px;"/></td>
				</tr>
				
				<tr>
					<td> Password &nbsp;</td>
					<td><input type="password" name="j_password" id="password" class="form-control" placeholder="Password" style=" width: 250px; "/></td>
				</tr>
				<tr>
					
					<td colspan="2">
						<input type="reset" class="btn btn-primary"  value="Reset" style="margin-top: 22px; margin-left: 100px; " />
						<input type="submit" class="btn btn-primary"  value="Sign in" style="margin-top: 22px; margin-left: 19px;" />
					 </td>
				</tr>
			</table>
			 <div class="cleaner"></div>
			 	  
			</fieldset>
		</form>
		</div>  
	
	
</body>
</html>