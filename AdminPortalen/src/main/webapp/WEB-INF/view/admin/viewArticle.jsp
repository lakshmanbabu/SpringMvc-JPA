<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>View Article</title>
</head>
<body class="skin-blue">
<style type="text/css">
a { cursor: pointer; }
p{
word-break:break-all;
}
</style>
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
  				<input type="hidden" id="contextPath" value="${contextPath}"/>
                <!-- Main content -->
                <section class="content">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="box">
                                <div class="box-header">
                                    <!-- <h3 class="box-title">View All UserDetails</h3> -->
                                </div>
                                <div class="box-body table-responsive">
                                    <table id="articleTable" class="table table-bordered table-striped">
                                        <thead>
                                            <tr>
                                             	<th>S.No</th>
                                                <th>Article Title</th>
                                                <th>Article Description</th>
                                                <th>Edit</th>
                                                <th>Delete</th>
                                            </tr>
                                        </thead>
                                        <tbody>
	                                        <c:forEach items="${articles}" var="article" varStatus="status">
	                                            <tr>
	                                            	<td>${status.count}</td>
	                                                <td>${article.articleTitle}</td>
	                                                <td><p>${article.articleDesc}</p></td>
	                                                <td>
	                                                	<a data-index="${status.count}" data-backdrop="static" data-keyboard="false"  onclick="EditArticleDetails(this,'${article.articleId}')"><img src="${contextPath}/resources/img/edit.jpg" width="20px" height="20px" /></a>
	                                                </td>
	                                                <td>
    													<a data-index="${status.count}" onclick="deleteUser(this,'${article.articleId}');" data-backdrop="static" data-keyboard="false" ><img src="${contextPath}/resources/img/delete1.png" width="25px"	height="25px" /></a>
	                                                </td>
	                                            </tr>
	                                            
	                                       <!-- COMPOSE MESSAGE MODAL -->
								        <div class="modal fade" id="compose-modal${status.count}" tabindex="-1" role="dialog" aria-hidden="true">
								            <div class="modal-dialog">
								                <div class="modal-content">
								                    <div class="modal-header">
								                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
								                        <h4 class="modal-title"> Update Article </h4>
								                    </div>
								                    <form id="articleUpdate_form${status.count}">
								                     <input name="articleId"  id="articleId${status.count}" type="hidden" >
								                        <div class="modal-body">
								                            <div class="form-group">
								                                <div class="input-group">
								                                    <span class="input-group-addon">Article Title:</span>
								                                    <input name="articleTitle"  id="articleTitle${status.count}" type="text" class="form-control" placeholder="Article Title">
								                                </div>
								                            </div>
								                            <div class="form-group">
								                            <span class="input-group-addon">Article Description:</span>
								                                <textarea name="articleDesc" id="articleDesc${status.count}" class="form-control" placeholder="Article Description" style="height: 120px;"></textarea>
								                            </div>
								                        </div>
								                        <div class="modal-footer clearfix">
								
								                            <button type="button" class="btn btn-danger" data-dismiss="modal"><i class="fa fa-times"></i> Discard</button>
								
								                            <button type="button" class="btn btn-primary pull-left" data-btnid="${status.count}" onclick="articleUpdate(this)" id="articleUpdate"> Update Article</button>
								                        </div>
								                    </form>
								                </div>
								            </div>
								        </div>
								        
								         <div class="modal fade" id="deleteArticle-modal${status.count}" tabindex="-1" role="dialog" aria-hidden="true">
								            <div class="modal-dialog">
								                <div class="modal-content">
								                    <div class="modal-header">
								                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
								                        <h4 class="modal-title">Delete Article </h4>
								                    </div>
							                      <div class="modal-body">
							                            <div class="form-group">
							                                <div class="input-group">
							                                    <h4 id="deleteAlert${status.count}"></h4>
							                                </div>
							                            </div>
							                        </div>
							                        <div class="modal-footer clearfix">
													 <input name="articleId"  id="articleId${status.count}" type="hidden" >
							                            <button type="button" class="btn btn-danger" data-dismiss="modal"><i class="fa fa-times"></i> Discard</button>
							
							                            <button type="button" class="btn btn-primary pull-left" onclick="deleteArticle(this,'${article.articleId}')" data-btnid="${status.count}" id="deleteArticle"> Yes , Delete Article</button>
							                        </div>
								                </div>
								            </div>
								        </div>
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
      
 
  <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>      
<script type="text/javascript">
var contextPath;
$(function(){
	contextPath = $('#contextPath').val();
	 $("#articleTable").dataTable();
	 
	$('#articleUpdate').click(function(){
		
		articleUpdate(this);
	})
});


function EditArticleDetails(param,articleId){
	//alert(articleId);
	contextPath = $('#contextPath').val();
	var index = $(param).attr('data-index');
	
	   $.get(contextPath+"/admin/editArticleDetails?articleId="+articleId, function(data) {
		   $("#articleId"+index).val(data.articleId);
		   $("#articleTitle"+index).val(data.articleTitle);
		   $("#articleDesc"+index).val(data.articleDesc);
		   
	   });
	
	var options ={bacdrop:true};
	$('#compose-modal'+index).modal(options);
	
	//$('#compose-modal'+index).modal('hide');
}


function articleUpdate(param){
	contextPath = $('#contextPath').val();
	
	var index = $(param).attr('data-btnid');
	$('#compose-modal'+index).modal('hide');
	
	 $.blockUI({ 
 		message: '<h3><img src="'+contextPath+'/resources/bootstrap/images/ajax-loader.gif"/></h3>',
 		css: { 
             border: 'none',     	               
             '-webkit-border-radius': '10px', 
             '-moz-border-radius': '10px',
         } 
 	}); 
	  $.post(contextPath+"/admin/updateArticle",$('#articleUpdate_form'+index).serialize(), function(data) {
		  $.unblockUI();
		  	 bootbox.alert(data.message,function(){		});
		  	location.reload();
	      }); 
}
function deleteUser(param,articleId){
	
	var index = $(param).attr('data-index');
	
	$("#deleteAlert"+index).html("<img src='${contextPath}/resources/Images/alert-icon-red-md.png' style=' height:50px; width: 50px;'>&nbsp; Are you Sure! You want delete <span style='color:#3c8dbc'>article "+articleId+"</span>");
	var options ={bacdrop:true};
	$('#deleteArticle-modal'+index).modal(options);
}

function deleteArticle(param,articleId){
	contextPath = $('#contextPath').val();
	
	var index = $(param).attr('data-btnid');
	$('#deleteArticle-modal'+index).modal('hide');
	
	$.blockUI({ 
		message: '<h3><img src="'+contextPath+'/resources/bootstrap/images/ajax-loader.gif"/></h3>',
		css: { 
            border: 'none',     	               
            '-webkit-border-radius': '10px', 
            '-moz-border-radius': '10px',
        } 
	}); 
	 $.get(contextPath+"/admin/deleteArticleDetails?articleId="+articleId, function(data) {
		 $.unblockUI();
	  	 bootbox.alert(data.message,function(){  	});
	  	 location.reload();
		   
	   });

}
 </script>     
</body>
</html>