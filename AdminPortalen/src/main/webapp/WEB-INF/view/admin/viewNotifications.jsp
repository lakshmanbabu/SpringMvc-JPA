<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Notifications</title>
</head>
<body class="skin-blue">
<div class="wrapper row-offcanvas row-offcanvas-left">
            <aside class="right-side">
               
                <section class="content-header">
                    <h1>
                       View Notifications
                        <small> all notification</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="${contextPath}/admin/adminHome"><i class="fa fa-dashboard"></i> Home</a></li>
                        <li class="active">notification</li>
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
                                    <table id="notificationTable" class="table table-bordered table-striped">
                                        <thead>
                                            <tr>
                                             	<th>S.No</th>
                                                <th>Message</th>
                                                <th>Sender Email</th>
                                                <th>Receiver Email</th>
                                                <th>Delete</th>
                                            </tr>
                                        </thead>
                                        <tbody>
	                                        <c:forEach items="${nlist}" var="nlist" varStatus="status">
	                                            <tr>
	                                            	<td>${status.count}</td>
	                                                <td><p>${nlist.notifactionMsg}</p></td>
	                                                <td>${nlist.senderEmail}</td>
	                                                <td>${nlist.receiverEmail}</td>
	                                                 <td>
    													<a href="javascript:void(0);" data-index="${status.count}" onclick="deleteNotification('${nlist.ntId}');" data-backdrop="static" data-keyboard="false" ><img src="${contextPath}/resources/img/delete1.png" width="25px"	height="25px" /></a>
	                                                </td>
	                                            </tr>
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
        
 <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>    
<%-- <script src="${contextPath}/resources/js/jquery-ui-1.10.3.min.js" type="text/javascript"></script> --%>  
<script type="text/javascript">
var contextPath;
$(function(){
	
	ShowTime();
	contextPath = $('#contextPath').val();
	 $("#notificationTable").dataTable();
	
});    

function deleteNotification(nId){
	contextPath = $('#contextPath').val();
	
	$.blockUI({ 
		message: '<h3><img src="'+contextPath+'/resources/bootstrap/images/ajax-loader.gif"/></h3>',
		css: { 
            border: 'none',     	               
            '-webkit-border-radius': '10px', 
            '-moz-border-radius': '10px',
        } 
	}); 
	 $.get(contextPath+"/admin/deleteNotification?nId="+nId, function(data) {
		 $.unblockUI();
	  	 bootbox.alert(data.message,function(){  	});
	  	 location.reload();
		   
	   });
}

</script>     
   
</body>
</html>