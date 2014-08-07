
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en" >               
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><sitemesh:write property='title'/></title>
<meta name="keywords" content="wedding store, free web templates, free css templates" />
<meta name="description" content="Wedding Store is a free web template for everyone. Download this template from templatemo.com" />
<link href="http://fonts.googleapis.com/css?family=Lato:400,700,900,300italic,400italic,700italic,900italic|Signika:400,700,300,600" rel="stylesheet" type="text/css">
<link href="http://fonts.googleapis.com/css?family=Roboto:400,100,100italic,300,300italic,400italic,500,500italic,700,700italic,900,900italic|Roboto+Condensed:300italic,400italic,700italic,400,300,700" rel="stylesheet" type="text/css">

<link rel="stylesheet" href="${contextPath}/resources/css/jquery.dataTables.css" />

 
<script type="text/javascript" src="${contextPath}/resources/js/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="${contextPath}/resources/js/jquery.blockUI.js"></script>
<script type="text/javascript" src="${contextPath}/resources/js/bootbox.js"></script>
<script type="text/javascript" src="${contextPath}/resources/js/bootstrap.js"></script>


</head>

<body >
      
 
      
 	<sitemesh:write property='body'/>
 	
 

 <sitemesh:write property="footer"/>
 
 </body>
</html>