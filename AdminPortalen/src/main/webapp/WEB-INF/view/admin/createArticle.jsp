<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>create article</title>
</head>
<body class="skin-blue">
<div class="wrapper row-offcanvas row-offcanvas-left">

            <!-- Right side column. Contains the navbar and content of the page -->
            <aside class="right-side">                
                <!-- Content Header (Page header) -->
                <section class="content-header">
                    <h1>
                        Create New Article
                        <small>new article</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="${contextPath}/admin/adminHome"><i class="fa fa-dashboard"></i> Home</a></li>
                        <li class="active">New Article</li>
                    </ol>
                </section>

 <!-- Main content -->
         <section class="content">
			<div class="row" style="margin-left: 190px;">
		        <div class="col-md-6">
		            <!-- general form elements -->
		            <div class="box box-primary">
		                <div class="box-header">
		                    <h3 class="box-title">New Article</h3>
		                </div>
		               
		                <form role="form" id="article_form">
		                    <div class="box-body">
		                        <div class="form-group">
		                            <label for="exampleInputEmail1">Article Title</label>
		                            <input type="text" class="form-control" name="articleTitle" id="articleTitle" placeholder="Enter article title" required="required">
		                        </div>
		                       <!--  <div class="form-group">
		                            <label for="exampleInputPassword1">Password</label>
		                            <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
		                        </div> -->
		                        <div class="form-group">
		                            <label for="exampleInputFile">Description</label>
		                         	<textarea type="password" class="form-control" name="articleDesc" id="articleDesc" style="height: 120px;" required="required" placeholder="Article Description"></textarea>
		                        </div>
		                    </div>
							<input type="hidden" id="contextPath" value="${contextPath}"/>
		                    <div class="box-footer" style="margin-left: 135px;">
		                      <button type="reset" class="btn btn-primary">Reset</button>
		                        <button type="button" class="btn btn-primary" id="submitBtn" style="margin-left: 26px;">Submit</button>
		                    </div>
		                </form>
		                
		              </div>
				  </div>
				</div>
           </section>
         </aside>
   </div>
   
   
   
 <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
<%--  <script src="${contextPath}/resources/js/jquery-ui-1.10.3.min.js" type="text/javascript"></script> --%>
 <script type="text/javascript">
 var contextPath;
 $(function(){
	 ShowTime();
	  contextPath = $('#contextPath').val();
	  
	  $("#submitBtn").click(function(){
			 
		  $.blockUI({ 
	    		message: '<h3><img src="'+contextPath+'/resources/bootstrap/images/ajax-loader.gif"/></h3>',
	    		css: { 
	                border: 'none',     	               
	                '-webkit-border-radius': '10px', 
	                '-moz-border-radius': '10px',
	            } 
	    	}); 
		  $.post(contextPath+"/admin/saveUserArticles",$('#article_form').serialize(), function(data) {
			  $.unblockUI();
			  	 bootbox.alert(data.message,function(){
					});
		         $('#article_form')[0].reset();
		            location.reload();
		      }); 
	  });
	  
	  
	  
 });
 
 
 
 </script>  
</body>
</html>