<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>posted Promotes</title>
</head>
<body  class="skin-blue">
<link type="text/css" rel="stylesheet" href="${contextPath}/resources/css/Paginationstyles.css" />
<style type="text/css">

</style>
<div class="wrapper row-offcanvas row-offcanvas-left">

            <!-- Right side column. Contains the navbar and content of the page -->
            <aside class="right-side">                
                <!-- Content Header (Page header) -->
                <section class="content-header">
                    <h1>
                       My Promoted Links
                        <small>view Promotion</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="${contextPath}/admin/adminHome"><i class="fa fa-dashboard"></i> Home</a></li>
                        <li class="active">view all Promotion</li>
                    </ol>
                </section>
                <hr/>
	<input type="hidden" id="contextPath" value="${contextPath}"/>
 	<!-- Main content -->

         <section>
         
			<div class="pad margin no-print" id="paging_container8">
			<div  class="content">
				 <c:forEach items="${promotions}" var="promotions" varStatus="status">
                   <div class="alert alert-success"  role="alert" style="margin-top: -12px; height: 120px;">
                   	<c:choose>
                  	 <c:when test="${promotions.adLogoPath!=null}">
				        <img src="<c:url value="/resources/Images/${promotions.adLogoPath}"/>" width="90" height="60" alt="post Logo">
				      </c:when>
				      <c:otherwise>
				      	 <img src="${contextPath}/resources/Images/post-your-ad.gif" width="70" height="50" alt="post Logo">
				      </c:otherwise>
				      </c:choose>  
				        <c:choose>
				        <c:when test="${promotions.type =='link' }">
					        <h4 style="margin-top: -52px; margin-left: 100px;"><a href="${promotions.promotValue}">${promotions.title}</a></h4>
					       
				    	</c:when>
				    	<c:otherwise>
				    	<h4 style="margin-top: -52px; margin-left: 100px;"><a href="javascript:void(0);" onclick="PromotionText('${promotions.promotionId}');" id="promotedText">${promotions.title}</a></h4>
				    	</c:otherwise>
				    	</c:choose>
				    	<fmt:formatDate value="${promotions.createdDate}" type="date"  var="createdDate" />
				    	 <h6 style="margin-left: 100px;">to be promoted by <span style="color: #3c8dbc">&nbsp;${user.username}</span> &nbsp;&nbsp;  on &nbsp; ${createdDate} </h6>
				    	<%--  <div class="fb_share">
						    <a name="fb_share" type="box_count" share_url="<?php the_permalink() ?>"    href="http://www.facebook.com/sharer.php">Share</a>
					      <script src="http://static.ak.fbcdn.net/connect.php/js/FB.Share" type="text/javascript"></script>
					      </div>  --%>
					      <br/>
					      <div id="Container${status.count}">
					        <fb:like href="http://www.facebook.com/MYPAGEISAWESOME/like${status.count}"></fb:like>
					         <a href="javascript:void(0);" onclick="PromotionText('${promotions.promotionId}');" style="float: right;"><span style="color: #3c8dbc">edit</span> </a>
					    </div>
				    	 
				    </div>
				    </c:forEach>
                </div>
                <div class="page_navigation" style="margin-left: 35px;"></div>
              </div>
			</section>
         </aside>
   </div>
   
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
<%--  <script src="${contextPath}/resources/js/jquery-ui-1.10.3.min.js" type="text/javascript"></script> --%>
 <script src="http://connect.facebook.net/en_US/all.js#xfbml=1"></script>
    
 <script type="text/javascript">
 var contextPath;
 $(function(){
  contextPath = $('#contextPath').val();
  ShowTime();
  $('#paging_container8').pajinate({
		num_page_links_to_display : 3,
		items_per_page : 5	
	});
  
  
 });
 
 function PromotionText(promotionId){
	 contextPath = $('#contextPath').val();
  window.location.href=contextPath+'/admin/singlePromotion/'+promotionId;
 }
 $(document).ready(function(){
		/* $('li:odd, .content > *:odd').css('background-color','#FFD9BF'); */
	});
 </script>
 
 <script type="text/javascript">
  window.fbAsyncInit = function() {
    FB.init({appId: 'YOUR_APP_ID_HERE', status: true, cookie: true,
             xfbml: true});
  };
  (function() {
    var e = document.createElement('script'); e.async = true;
    e.src = document.location.protocol +
      '//connect.facebook.net/en_US/all.js';
    document.getElementById('fb-root').appendChild(e);
  }());
</script>  
</body>
</html>