<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>manage Category</title>
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
                      Manage Category
                        <small>manage category</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="${contextPath}/admin/adminHome"><i class="fa fa-dashboard"></i> Home</a></li>
                        <li class="active">View All Categories</li>
                    </ol>
                </section>
  				<input type="hidden" id="contextPath" value="${contextPath}"/>
                <!-- Main content -->
                <section class="content">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="box">
                                <div class="box-header" align="right">
                                <br/>
                                    <button class="btn btn-primary" onclick="openCategoryModel()">Add</button>  
                                </div>
								                            
                                <div class="box-body table-responsive">
                                    <table id="categoryTable" class="table table-bordered table-striped">
                                        <thead>
                                            <tr>
                                             	<th>S.No</th>
                                                <th>Category Name</th>
                                                <th>Edit</th>
                                                <th>Delete</th>
                                            </tr>
                                        </thead>
                                        <tbody>
	                                        <c:forEach items="${clist}" var="clist" varStatus="status">
	                                            <tr>
	                                            	<td>${status.count}</td>
	                                                <td>${clist.cName}</td>
	                                                <td>
	                                                	<a data-index="${status.count}" data-backdrop="static" data-keyboard="false"  onclick="EditCategoryDetails(this,'${clist.cId}')"><img src="${contextPath}/resources/img/edit.jpg" width="20px" height="20px" /></a>
	                                                </td>
	                                                <td>
    													<a data-index="${status.count}" onclick="deleteCategory(this,'${clist.cId}');" data-backdrop="static" data-keyboard="false" ><img src="${contextPath}/resources/img/delete1.png" width="25px"	height="25px" /></a>
	                                                </td>
	                                            </tr>
	                                            
	                                       <!-- COMPOSE MESSAGE MODAL -->
								        <div class="modal fade" id="compose-modal${status.count}" tabindex="-1" role="dialog" aria-hidden="true">
								            <div class="modal-dialog">
								                <div class="modal-content">
								                    <div class="modal-header">
								                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
								                        <h4 class="modal-title">  Update Category </h4>
								                    </div>
								                    <form id="categoryUpdate_form${status.count}">
								                     <input name="cId"  id="cId${status.count}" type="hidden" >
								                        <div class="modal-body">
								                            <div class="form-group">
								                                <div class="input-group">
								                                    <span class="input-group-addon">Category Name:</span>
								                                    <input name="cName"  id="cName${status.count}" type="text" class="form-control" placeholder="category Name">
								                                </div>
								                            </div>
								                            
								                        </div>
								                        <div class="modal-footer clearfix">
								
								                            <button type="button" class="btn btn-danger" data-dismiss="modal"><i class="fa fa-times"></i> Discard</button>
								
								                            <button type="button" class="btn btn-primary pull-left" data-btnid="${status.count}" onclick="UpdateCategory(this)" id="categoryUpdate"> Update Category</button>
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
							
							                            <button type="button" class="btn btn-primary pull-left" onclick="deleteCategoryYes(this,'${clist.cId}')" data-btnid="${status.count}" id="deleteArticle"> Yes , Delete Category </button>
							                        </div>
								                </div>
								            </div>
								        </div>
								       </c:forEach>
                                     </tbody>
                                  
                                 </table>
                             </div>
                         </div>
                     </div>
                 </div>

                </section>
            </aside>
        </div>

<div class="modal fade" id="addnew-Categorys" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title"> Save Category</h4>
            </div>
            <form id="category_form">
                <div class="modal-body">
                    <div class="form-group">
                        <div class="input-group">
                            <span class="input-group-addon">Category Name:</span>
                            <input name="cName"  id="cName" type="text" class="form-control" placeholder="category Name">
                        </div>
                    </div>
                </div>
                <div class="modal-footer clearfix">

                    <button type="button" class="btn btn-danger" data-dismiss="modal"><i class="fa fa-times"></i> Discard</button>

                    <button type="button" class="btn btn-primary pull-left"  onclick="SaveCategory()" id="saveCategory"> Save Category</button>
                </div>
            </form>
        </div>
    </div>
</div>


<script type="text/javascript">
var contextPath;
$(function(){
	ShowTime();
	contextPath = $('#contextPath').val();
	 $("#categoryTable").dataTable();
	 
	 $('#categoryUpdate').click(function(){
			
		 UpdateCategory(this);
		});
});

function EditCategoryDetails(param,cId){
	//alert(articleId);
	contextPath = $('#contextPath').val();
	var index = $(param).attr('data-index');
	
	   $.get(contextPath+"/admin/editCategory?cId="+cId, function(data) {
		   $("#cId"+index).val(data.cId);
		   $("#cName"+index).val(data.cName);
		   
	   });
	
	var options ={bacdrop:true};
	$('#compose-modal'+index).modal(options);
	
	//$('#compose-modal'+index).modal('hide');
}

function UpdateCategory(param){
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
	  $.post(contextPath+"/admin/updateCategories",$('#categoryUpdate_form'+index).serialize(), function(data) {
		  $.unblockUI();
		  	 bootbox.alert(data.message,function(){		});
		  	location.reload();
	      }); 
}

function deleteCategory(param,cId){
	
	var index = $(param).attr('data-index');
	
	$("#deleteAlert"+index).html("<img src='${contextPath}/resources/Images/alert-icon-red-md.png' style=' height:50px; width: 50px;'>&nbsp; Are you Sure! You want delete <span style='color:#3c8dbc'>Category "+cId+"</span>");
	var options ={bacdrop:true};
	$('#deleteArticle-modal'+index).modal(options);
}

function deleteCategoryYes(param,cId){
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
	 $.get(contextPath+"/admin/deleteCategory?cId="+cId, function(data) {
		 $.unblockUI();
	  	 bootbox.alert(data.message,function(){  	});
	  	 location.reload();
		   
	   });

}

function openCategoryModel(){
	
	var options ={bacdrop:true};
	$('#addnew-Categorys').modal(options);
}

function SaveCategory(){
    contextPath = $('#contextPath').val();
    
	$('#addnew-Categorys').modal('hide');
	
	 $.blockUI({ 
 		message: '<h3><img src="'+contextPath+'/resources/bootstrap/images/ajax-loader.gif"/></h3>',
 		css: { 
             border: 'none',     	               
             '-webkit-border-radius': '10px', 
             '-moz-border-radius': '10px',
         } 
 	}); 
  $.post(contextPath+"/admin/saveCategory",$('#category_form').serialize(), function(data) {
	  $.unblockUI();
	  	 bootbox.alert(data.message,function(){		});
	  	location.reload();
      }); 
}
</script>      
</body>
</html>