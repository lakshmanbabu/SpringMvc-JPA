<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>create Promotion</title>
</head>
<body  class="skin-blue">

<div class="wrapper row-offcanvas row-offcanvas-left">

            <!-- Right side column. Contains the navbar and content of the page -->
            <aside class="right-side">                
                <!-- Content Header (Page header) -->
                <section class="content-header">
                    <h1>
                        Create Promotion
                        <small>new Promotion</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="${contextPath}/admin/adminHome"><i class="fa fa-dashboard"></i> Home</a></li>
                        <li class="active">New Promotion</li>
                    </ol>
                </section>

 <!-- Main content -->
         <section class="content">
			<div class="row" style="margin-left: 190px;">
		        <div class="col-md-6">
		            <!-- general form elements -->
		            <div class="box box-primary" style="width: 620px;">
		                <div class="box-header">
		                    <h3 class="box-title">New Promotion</h3>
		                </div>
		               
		                <form role="form" id="promotion_form">
		                    <div class="box-body">
		                        <div class="form-group">
		                            <label for="exampleInputEmail1">Title</label>
		                           <textarea class="form-control" name="title" id="title" style="height: 100px;" required="required" placeholder="Title"></textarea>
		                        </div>
		                        <div class="form-group">
		                            <textarea class="form-control"  id="sampleText" style="height: 70px;"  disabled="disabled"></textarea>
		                        </div> 
		                        <div class="form-group">
		                            <label for="exampleInputFile">Post Type</label><br/>
                                        <label>
                                            <input type="radio" id="urlLink" name="r3"  tabindex="0" value="link" checked="checked"/>&nbsp; link ( clicks through to your URL )
                                        </label>
                                        <label style="margin-left: 55px;">
                                            <input type="radio" id="CustomizeText" name="r3" tabindex="1" value="text"/> &nbsp;text ( clicks through to text you customize )
                                        </label><br/><br/>
                                        <div id="type"></div>
                                       <div id="changeArea"></div>
		                        </div>
		                    </div>
							<input type="hidden" id="contextPath" value="${contextPath}"/>
		                    <div class="box-footer" style="margin-left:500px;">
		                     <!--  <button type="reset" class="btn btn-primary">Reset</button> -->
		                        <button type="button" class="btn btn-primary " id="submitBtn" style="margin-left: 26px;">next</button>
		                    </div>
		                </form>
		                
		              </div>
				  </div>
				</div>
           </section>
         </aside>
   </div>
 
 <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
<%-- <script src="${contextPath}/resources/js/jquery-ui-1.10.3.min.js" type="text/javascript"></script> --%>
 <script type="text/javascript">
 var contextPath;
 $(function(){
	 ShowTime();
  contextPath = $('#contextPath').val();
  
  $("#sampleText").val("A good title is important to the success of your campaign. admin portal users are an intelligent, thoughtful group, and reward those who engage them.");
  
  //Flat red color scheme for iCheck
     $('input[type="radio"].flat-red').iCheck({
         checkboxClass: 'icheckbox_flat-red',
         radioClass: 'iradio_flat-red'
     });
     $("#changeArea").html(' <strong>Url </strong> <br/><input type="text" class="form-control"  name="promotValue" id="exampleInputPassword1" placeholder=" enter url">');
     $("#type").html('<input type="hidden" class="form-control"  name="type" value="link">');
    $('input:radio[name=r3]').on('ifChecked', function(event){
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
		 });
      
    $("#submitBtn").click(function(){
		 
		  $.blockUI({ 
	    		message: '<h3><img src="'+contextPath+'/resources/bootstrap/images/ajax-loader.gif"/></h3>',
	    		css: { 
	                border: 'none',     	               
	                '-webkit-border-radius': '10px', 
	                '-moz-border-radius': '10px',
	            } 
	    	}); 
		  $.post(contextPath+"/admin/saveNewPromotion",$('#promotion_form').serialize(), function(data) {
			  $.unblockUI();
			  	 bootbox.alert(data.message,function(){
					});
		         $('#promotion_form')[0].reset();
		        window.location.href=contextPath+'/admin/viewPostedAd';
		      }); 
	  });
 });
 
 
 
 </script>    
</body>
</html>