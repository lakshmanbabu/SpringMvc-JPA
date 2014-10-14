<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>sent Items</title>
</head>
<body>
<div class="wrapper row-offcanvas row-offcanvas-left">
          <!-- Right side column. Contains the navbar and content of the page -->
	<aside class="right-side">
	    <!-- Content Header (Page header) -->
     <section class="content-header">
             <h1>
                 Mailbox
                 <small>mailbox</small>
             </h1>
             <ol class="breadcrumb">
                 <li><a href="${contextPath}/admin/adminHome"><i class="fa fa-dashboard"></i> Home</a></li>
                 <li class="active">all mails</li>
             </ol>
            </section>

	<!-- Main content -->
	<section class="content">
	   
	    <div class="mailbox row">
	        <div class="col-xs-12">
             <div class="box box-solid">
                <div class="box-body">
                    <div class="row">
                        <div class="col-md-3 col-sm-4" style="width: 23%;">
                          
                            <div class="box-header">
                                <i class="fa fa-inbox"></i>
                                <h3 class="box-title">INBOX</h3>
                            </div>
                          <input type="hidden" id="contextPath" value="${contextPath}"/>
                            <a class="btn btn-block btn-primary" data-toggle="modal" data-target="#compose-modal"><i class="fa fa-pencil"></i> Compose Message</a>
                            <!-- Navigation - folders-->
                            <div style="margin-top: 15px;">
                                <ul class="nav nav-pills nav-stacked">
                                    <li class="header">Folders</li>
                                    <li <c:if test="${page=='mailBox'}"> class="active" </c:if>><a href="${contextPath}/admin/mailBox"><i class="fa fa-inbox"></i> Inbox (${folderssize.size()})</a></li>
                                   <!--  <li><a href="#"><i class="fa fa-pencil-square-o"></i> Drafts</a></li> -->
                                    <li <c:if test="${page=='sentItems'}"> class="active" </c:if>><a href="${contextPath}/admin/sentItems"><i class="fa fa-mail-forward"></i> Sent</a></li>
                                    <!-- <li><a href="#"><i class="fa fa-star"></i> Starred</a></li>
                                    <li><a href="#"><i class="fa fa-folder"></i> Junk</a></li> -->
                                </ul>
                            </div>
                        </div>
                        <div class="col-md-9 col-sm-8">
                            <div class="row pad">
                                <div class="col-sm-6">
                                    <label style="margin-right: 10px;">
                                        <input type="checkbox" class="flat-red"/>
                                    </label>
                                    <!-- Action button -->
                                    <div class="btn-group">
                                        <button type="button" class="btn btn-default btn-sm btn-flat dropdown-toggle" data-toggle="dropdown">
                                            Action <span class="caret"></span>
                                        </button>
                                        <ul class="dropdown-menu" role="menu">
                                            <li><a href="#">Mark as read</a></li>
                                            <li><a href="#">Mark as unread</a></li>
                                            <li class="divider"></li>
                                            <li><a href="#">Move to junk</a></li>
                                            <li class="divider"></li>
                                            <li><a href="#">Delete</a></li>
                                        </ul>
                                    </div>

                                </div>
                                <div class="col-sm-6 search-form">
                                    <form action="#" class="text-right">
                                        <div class="input-group">
                                            <input type="text" class="form-control input-sm" placeholder="Search">
                                            <div class="input-group-btn">
                                                <button type="submit" name="q" class="btn btn-sm btn-primary"><i class="fa fa-search"></i></button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>

                            <div class="table-responsive" id="replaceMessageBody">
                                <!-- THE MESSAGES -->
                                <table class="table table-mailbox">
                                <c:forEach items="${folders}" var="folders" varStatus="status">
                                   <c:choose>
                                   <c:when test="${folders.status == 0}">
                                    <tr class="unread">
                                        <td class="small-col"><input type="checkbox" /></td>
                                        <td class="small-col"><i class="fa fa-star-o"></i></td>
                                        <td class="name"><a href="${contextPath}/admin/viewMsg/${folders.id}" >${folders.receiverEmail}</a></td>
                                        <td class="subject"><a href="${contextPath}/admin/viewMsg/${folders.id}" >${folders.message.subject}</a></td>
                                        <fmt:formatDate value="${folders.message.sentDateTime}" var="sentDate" type="both" dateStyle="MEDIUM" />
                                        <td class="time">${sentDate}</td>
                                    </tr>
                                    </c:when>
                                    <c:otherwise>
                                     <tr >
                                        <td class="small-col"><input type="checkbox" /></td>
                                        <td class="small-col"><i class="fa fa-star-o"></i></td>
                                        <td><a href="${contextPath}/admin/viewMsg/${folders.id}" >${folders.senderEmail}</a></td>
                                        <td class="subject"><a href="${contextPath}/admin/viewMsg/${folders.id}" >${folders.message.subject}</a></td>
                                        <fmt:formatDate value="${folders.message.sentDateTime}" var="sentDate" type="both" dateStyle="MEDIUM" />
                                        <td class="time">${sentDate}</td>
                                    </tr>
                                    </c:otherwise>
                                    </c:choose>
                                    </c:forEach>
                                    
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="box-footer clearfix" id="msgCount">
                    <div class="pull-right">
                        <small>Showing 1-12/1,240</small>
                        <button class="btn btn-xs btn-primary"><i class="fa fa-caret-left"></i></button>
                        <button class="btn btn-xs btn-primary"><i class="fa fa-caret-right"></i></button>
                    </div>
                </div>
            </div>
        </div>
    </div>
   
        </section>
    </aside>
</div>

	
        <!-- COMPOSE MESSAGE MODAL -->
        <div class="modal fade" id="compose-modal" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title"><i class="fa fa-envelope-o"></i> Compose New Message</h4>
                    </div>
                    <form id="compose_Form">
                        <div class="modal-body">
                            <div class="form-group">
                                <div class="input-group">
                                    <span class="input-group-addon">TO:</span>
                                    <input name="receiverEmail" type="email" class="form-control" placeholder="Email TO">
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="input-group">
                                    <span class="input-group-addon">CC:</span>
                                    <input name="ccEmail" type="email" class="form-control" placeholder="Email CC">
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="input-group">
                                    <span class="input-group-addon">BCC:</span>
                                    <input name="bccEmail" type="email" class="form-control" placeholder="Email BCC">
                                </div>
                            </div>
                             <div class="form-group">
                                <div class="input-group">
                                    <span class="input-group-addon">Subject:</span>
                                    <input name="subject" type="text" class="form-control" placeholder="subject">
                                </div>
                            </div>
                            <div class="form-group">
                                <textarea name="body" id="body" class="form-control" placeholder="Message" style="height: 120px;"></textarea>
                            </div>
                           <!--  <div class="form-group">
                                <div class="btn btn-success btn-file">
                                    <i class="fa fa-paperclip"></i> Attachment
                                    <input type="file" name="attachment"/>
                                </div>
                                <p class="help-block">Max. 32MB</p>
                            </div> -->

                        </div>
                        <div class="modal-footer clearfix">

                            <button type="button" class="btn btn-danger" data-dismiss="modal"><i class="fa fa-times"></i> Discard</button>

                            <button type="submit" class="btn btn-primary pull-left" ><i class="fa fa-envelope"></i> Send Message</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>


 <script type="text/javascript">
 
 var contextPath;
 
 $(function(){
		
	 $( "#compose_Form").validate({
			errorClass:'InputError',
			validClass:'InputSuccess',
			rules: {
				receiverEmail:{required:true},
				},
				
			messages: {			
				receiverEmail: {
					required: "Please Enter the To Email"
				},
				
			},
			submitHandler: function(form) {			 
				contextPath = $('#contextPath').val();
				$('#compose-modal').modal('hide');
				 $.blockUI({ 
			 		message: '<h3><img src="'+contextPath+'/resources/bootstrap/images/ajax-loader.gif"/></h3>',
			 		css: { 
			             border: 'none',     	               
			             '-webkit-border-radius': '10px', 
			             '-moz-border-radius': '10px',
			         } 
			 	}); 
				  $.post(contextPath+"/admin/sendComposeMail",$('#compose_Form').serialize(), function(data) {
					  $.unblockUI();
					  	 bootbox.alert(data.message,function(){		});
					  	 $('#compose_Form')[0].reset();
					  	location.reload();
				     }); 
				  
				}
			});
	 
 });
 
    $(function() {
    	ShowTime();
    	
        "use strict";

        //iCheck for checkbox and radio inputs
        $('input[type="checkbox"]').iCheck({
            checkboxClass: 'icheckbox_minimal-blue',
            radioClass: 'iradio_minimal-blue'
        });

      //Flat red color scheme for iCheck
        $('input[type="checkbox"].flat-red, input[type="radio"].flat-red').iCheck({
            checkboxClass: 'icheckbox_flat-red',
            radioClass: 'iradio_flat-red'
        });
        //When unchecking the checkbox
        $("#check-all").on('ifUnchecked', function(event){
            //Uncheck all checkboxes
            $("input[type='checkbox']", ".table-mailbox").iCheck("uncheck");
        });
        //When checking the checkbox
        $("#check-all").on('ifChecked', function(event){
            //Check all checkboxes
            $("input[type='checkbox']", ".table-mailbox").iCheck("check");
        });
        //Handle starring for glyphicon and font awesome
        $(".fa-star, .fa-star-o, .glyphicon-star, .glyphicon-star-empty").click(function(e){
            e.preventDefault();
            //detect type
            var glyph = $(this).hasClass("glyphicon");
            var fa = $(this).hasClass("fa");

            //Switch states
            if (glyph) {
                $(this).toggleClass("glyphicon-star");
                $(this).toggleClass("glyphicon-star-empty");
            }

            if (fa) {
                $(this).toggleClass("fa-star");
                $(this).toggleClass("fa-star-o");
            }
        });

        //Initialize WYSIHTML5 - text editor
        $("#body").wysihtml5();
    });
            
 
</script>

</body>
</html>