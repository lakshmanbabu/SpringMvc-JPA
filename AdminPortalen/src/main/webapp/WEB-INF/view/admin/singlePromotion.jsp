<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>single Promotion</title>
</head>
<body  class="skin-blue">

<div class="wrapper row-offcanvas row-offcanvas-left">

            <!-- Right side column. Contains the navbar and content of the page -->
            <aside class="right-side">                
                <!-- Content Header (Page header) -->
                <section class="content-header">
                    <h1>
                        Promoted Links
                        <small>single Promotion</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="${contextPath}/admin/adminHome"><i class="fa fa-dashboard"></i> Home</a></li>
                        <li class="active">single Promotion</li>
                    </ol>
                </section>
	<input type="hidden" id="contextPath" value="${contextPath}"/>
 	<!-- Main content -->
         <section class="content">
				 <div class="pad margin no-print">
                   <div class="alert alert-success" role="alert" style="margin-top: -12px;">
				     <c:choose>
	                  	 <c:when test="${promotions.adLogoPath!=null}">
					        <img src="<c:url value="/resources/Images/${promotions.adLogoPath}"/>" width="90" height="60" alt="post Logo">
					      </c:when>
					      <c:otherwise>
					      	 <img src="${contextPath}/resources/Images/post-your-ad.gif" width="90" height="60" alt="post Logo">
					      </c:otherwise>
				      </c:choose>  
				    	<c:choose>
				        <c:when test="${promotions.type =='link' }">
				        	<h4 style="margin-top: -52px; margin-left: 100px;"><a href="javascript:void(0);" onclick="PromotionText('${promotions.promotionId}');" id="promotedText">${promotions.title}</a></h4>
				        	<fmt:formatDate value="${promotions.createdDate}" type="date"  var="createdDate" />
				        	<h6 style="margin-left: 100px;">to be promoted by <span style="color: #3c8dbc"> &nbsp; ${user.username}</span> &nbsp;&nbsp;  on &nbsp; ${createdDate} </h6>
				        	<h6 align="right"> <a href="javascript:void(0);" onclick="PromotionText('${promotions.promotionId}');"><span style="color: #3c8dbc">edit</span> </a></h6>
				        </c:when>
				        <c:otherwise>
				        	<h4 style="margin-top: -52px; margin-left: 100px;"><a href="javascript:void(0);" onclick="PromotionText('${promotions.promotionId}');" id="promotedText">${promotions.title}</a></h4>
				    	 	<fmt:formatDate value="${promotions.createdDate}" type="date"  var="createdDate" />
				    	 	<h6 style="margin-left: 100px;">to be promoted by <span style="color: #3c8dbc"> &nbsp; ${user.username}</span> &nbsp;&nbsp;  on &nbsp; ${createdDate} </h6>
				    	 	<textarea  name="title" id="title" style="height:100px; width:850px; margin-left: 75px; border-radius: 15px;" readonly="readonly" disabled="disabled">${promotions.promotValue}</textarea>
				        	 <div id="Container${status.count}">
						        <fb:like href="http://www.facebook.com/MYPAGEISAWESOME/like${promotions.promotionId}"></fb:like>
						         <a href="javascript:void(0);" onclick="PromotionText('${promotions.promotionId}');" style="float: right;"><span style="color: #3c8dbc">edit</span> </a>
					    	</div>
				        	<%-- <h6 align="right"> <a href="javascript:void(0);" onclick="PromotionText('${promotions.promotionId}');"><span style="color: #3c8dbc">edit</span> </a></h6> --%>
				        </c:otherwise>
				        </c:choose>
				    	
				    </div>
				   <div align="right"> <a onclick="EditPromoteDetails('${promotions.promotionId}')" data-backdrop="static" data-keyboard="false"><button type="button"  data-index="${promotions.promotionId}" class="btn btn-primary">edit creative</button> </a> </div>
                </div>
			</section>
         </aside>
   </div>
   
   <c:url value="/admin/updatePromotion" var="action"/>
   <div class="modal fade" id="editPromote-modal" tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-dialog">
     <div class="modal-content">
         <div class="modal-header">
             <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
             <h4 class="modal-title"> Update Promotion </h4>
         </div>
     <form  action="${action}"  method="POST" enctype="multipart/form-data" >
     <input name="promotionId"  id="promotionId" type="hidden" >
        <div class="modal-body">
            <div class="form-group">
                <div class="input-group">
                    <span class="input-group-addon">Title:</span>
                    <input name="title"  id="titleId" type="text" class="form-control" placeholder="Title"><br/>
                </div>
            </div>
             <div class="form-group">
                     <textarea class="form-control"  id="sampleText" style="height: 70px;"  disabled="disabled"></textarea>
               </div> 
              <div class="form-group">
                     
                      <div id="type"></div>
                     <div id="changeArea"></div>
           	</div>
           	    <div class="form-group">
                     <label for="exampleInputFile">upload header image:</label>
                     	<input class="form-control" type="file" name="file">
                     <p class="help-block">upload promotion Image</p>
                 </div>
          </div>
        <div class="modal-footer clearfix">

            <button type="button" class="btn btn-danger" data-dismiss="modal"><i class="fa fa-times"></i> Discard</button>

            <button type="submit" class="btn btn-primary pull-left"  > Update Promotion</button>
            </div>
        </form>
    </div>
</div>
  </div>
  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
 <script type="text/javascript">
 var contextPath;
 $(function(){
  contextPath = $('#contextPath').val();
  
  /* $('input:radio[name=r3]').on('ifChecked', function(event){
		 //alert($(this).val());
		  var val=$(this).val();
		  if(val=='link')
			  {
			  $("#type").html('<input type="hidden" class="form-control"  name="type" value="'+val+'">');
				$("#changeArea").html('<strong> Url </strong> <br/><input type="text" class="form-control"  name="promotValue" id="exampleInputPassword1" placeholder="enter url">');
			  }
		  if(val=="text"){
			  $("#type").html('<input type="hidden" class="form-control"  name="type" value="'+val+'">');
			  $("#changeArea").html(' <strong>text </strong><br/><textarea class="form-control" name="promotValue" id="sampleText" style="height: 70px;"></textarea>');
		  }
		 }); */
 });
 
 function PromotionText(promotionId){
	 contextPath = $('#contextPath').val();
  	window.location.href=contextPath+'/admin/singlePromotion/'+promotionId;
 }
 
 function EditPromoteDetails(promotionId){
		//alert(articleId);
		contextPath = $('#contextPath').val();
		
		    $.get(contextPath+"/admin/editPromoteDetails?promotionId="+promotionId, function(data) {
		    	
		    	$("#sampleText").val("A good title is important to the success of your campaign. admin portal users are an intelligent, thoughtful group, and reward those who engage them.");
		    	$("#promotionId").val(data.promotionId);
		    	$("#titleId").val(data.title);
		    	var val=data.type;
		    	 if(val=='link')
				  {
				  $("#type").html('<input type="hidden" class="form-control"  name="type" value="'+data.type+'">');
				  $("#changeArea").html('<strong> Url </strong> <br/><input type="text" class="form-control" value="'+data.promotValue+'" name="promotValue" id="exampleInputPassword1" placeholder="enter url">');
				  }
			  if(val=="text"){
				 
				  $("#type").html('<input type="hidden" class="form-control"  name="type" value="'+data.type+'">');
				  $("#changeArea").html(' <strong>text </strong><br/><textarea class="form-control" name="promotValue"  id="sampleText" style="height: 70px;">'+data.promotValue+'</textarea>');
			  }
			   
		   }); 
		var options ={bacdrop:true};
		$('#editPromote-modal').modal(options);
		
	}
function updatePromote(){
	
	$('#editPromote-modal').modal('hide');
}
 </script>
  <script src="http://connect.facebook.net/en_US/all.js#xfbml=1"></script>
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