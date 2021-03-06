<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"  pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title><sitemesh:write property='title'/></title>
<meta name="keywords" content="wedding store, free web templates, free css templates" />

<link href="http://fonts.googleapis.com/css?family=Lato:400,700,900,300italic,400italic,700italic,900italic|Signika:400,700,300,600" rel="stylesheet" type="text/css">
<link href="http://fonts.googleapis.com/css?family=Roboto:400,100,100italic,300,300italic,400italic,500,500italic,700,700italic,900,900italic|Roboto+Condensed:300italic,400italic,700italic,400,300,700" rel="stylesheet" type="text/css">

 <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
 <link href="${contextPath}/resources/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
 <link href="${contextPath}/resources/css/ionicons.min.css" rel="stylesheet" type="text/css" />
 <link href="${contextPath}/resources/css/fullcalendar/fullcalendar.css" rel="stylesheet" type="text/css" />
  <link href="${contextPath}/resources/css/iCheck/all.css" rel="stylesheet" type="text/css" />
 <link href="${contextPath}/resources/css/daterangepicker/daterangepicker-bs3.css" rel="stylesheet" type="text/css" />
 <link href="${contextPath}/resources/css/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css" rel="stylesheet" type="text/css" />
 <link href="${contextPath}/resources/css/AdminLTE.css" rel="stylesheet" type="text/css" />
<link href="${contextPath}/resources/css/datatables/dataTables.bootstrap.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="${contextPath}/resources/css/jquery-ui.css" /> 
<link type="text/css" rel="stylesheet" href="${contextPath}/resources/css/Paginationstyles.css" />

 <!-- jQuery 2.0.2 -->
<!--   <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script> -->
 <script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.1/jquery.min.js"></script>
  <script src="${contextPath}/resources/js/bootstrap.min.js" type="text/javascript"></script>
 <script src="//cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
  <script src="${contextPath}/resources/js/plugins/fullcalendar/fullcalendar.min.js" type="text/javascript"></script>
  <script src="${contextPath}/resources/js/plugins/jqueryKnob/jquery.knob.js" type="text/javascript"></script>
  <script src="${contextPath}/resources/js/plugins/daterangepicker/daterangepicker.js" type="text/javascript"></script>
  <script src="${contextPath}/resources/js/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js" type="text/javascript"></script>
  <script src="${contextPath}/resources/js/plugins/iCheck/icheck.min.js" type="text/javascript"></script>
  <script src="${contextPath}/resources/js/AdminLTE/app.js" type="text/javascript"></script>
  <script src="${contextPath}/resources/js/AdminLTE/dashboard.js" type="text/javascript"></script>     
  <script type="text/javascript" src="${contextPath}/resources/js/common.js"></script> 
  <script src="${contextPath}/resources/js/AdminLTE/demo.js" type="text/javascript"></script>
  <script type="text/javascript" src="${contextPath}/resources/js/bootbox.js"></script>
  <script type="text/javascript" src="${contextPath}/resources/js/jquery.blockUI.js"></script>
  <script src="${contextPath}/resources/js/plugins/datatables/jquery.dataTables.js" type="text/javascript"></script>
  <script src="${contextPath}/resources/js/plugins/datatables/dataTables.bootstrap.js" type="text/javascript"></script>
  <script type="text/javascript" src="${contextPath}/resources/js/jquery-ui.js"></script>
  <script type="text/javascript" src="${contextPath}/resources/js/jquery.pajinate.js"></script>
  <script type="text/javascript" src="${contextPath}/resources/js/countries.js"></script>
 <script type="text/javascript" src="${contextPath}/resources/js/jquery.validate.js"></script>
 
 
<!------------- Charts ------------->
<script type="text/javascript" src="${contextPath}/resources/js/amcharts.js"></script>
<script type="text/javascript" src="${contextPath}/resources/js/serial.js"></script>
<script type="text/javascript" src="${contextPath}/resources/js/light.js"></script>
<script type="text/javascript" src="${contextPath}/resources/js/pie.js"></script>
<!------------- amchart google locations ------------->
<!-- <script type="text/javascript" src="http://www.amcharts.com/lib/3/maps/js/worldLow.js"></script> -->
<script type="text/javascript" src="http://www.amcharts.com/lib/3/themes/none.js"></script>
<style type="text/css">
.InputError{
color: red;
}

</style>


<script type="text/javascript">

/* window.onload = function(){date()}, setInterval(function(){date()}, 1000);

function date() {
    var now = new Date(),
        now = now.getHours()+':'+now.getMinutes()+':'+now.getSeconds();
    $('#time').html(now);
} */
$(document).ready(function() {
	ShowTime();
	});
function ShowTime() {
	var dt = new Date();
	document.getElementById("time").innerHTML = dt.toLocaleTimeString();
	window.setTimeout("ShowTime()", 1000); // Here 1000(milliseconds) means one 1 Sec  
}
</script>
</head>
<body  class="skin-blue">

 <!-- header logo: style can be found in header.less -->
        <header class="header">
            <a href="${contextPath}/admin/adminHome" class="logo">
                <!-- Add the class icon to your logo image or logo icon to add the margining -->
                Admin Portal
            </a>
    
            <!-- Header Navbar: style can be found in header.less -->
            <nav class="navbar navbar-static-top" role="navigation">
                <!-- Sidebar toggle button-->
                <sec:authorize access="isAuthenticated()">
         		   <sec:authorize access="hasRole('ROLE_ADMIN')">
		                <a href="#" class="navbar-btn sidebar-toggle" data-toggle="offcanvas" role="button">
		                    <span class="sr-only">Toggle navigation</span>
		                    <span class="icon-bar"></span>
		                    <span class="icon-bar"></span>
		                    <span class="icon-bar"></span>
		                </a>
                	</sec:authorize>
                </sec:authorize>
                <div class="navbar-right">
                <sec:authorize access="isAuthenticated()">
         		  <sec:authorize access="hasRole('ROLE_ADMIN')">
                    <ul class="nav navbar-nav">
                        <!-- Messages: style can be found in dropdown.less-->
                        <li class="dropdown messages-menu">
                        
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <i class="fa fa-envelope"></i>
                                <span class="label label-success">${folderssize.size()}</span>
                            </a>
                            <ul class="dropdown-menu">
                                <li class="header">You have ${folderssize.size()} messages</li>
                                <li>
                                    <!-- inner menu: contains the actual data -->
                                    <ul class="menu">
                                        <li><!-- start message -->
                                            <a href="#">
                                                <div class="pull-left">
                                                    <img src="${contextPath}/resources/img/avatar3.png" class="img-circle" alt="Image"/>
                                                </div>
                                                <h4>
                                                    Support Team
                                                    <small><i class="fa fa-clock-o"></i> 5 mins</small>
                                                </h4>
                                                <p>Why not buy a new awesome theme?</p>
                                            </a>
                                        </li><!-- end message -->
                                        <li>
                                            <a href="#">
                                                <div class="pull-left">
                                                    <img src="${contextPath}/resources/img/avatar2.png" class="img-circle" alt="image"/>
                                                </div>
                                                <h4>
                                                    AdminLTE Design Team
                                                    <small><i class="fa fa-clock-o"></i> 2 hours</small>
                                                </h4>
                                                <p>Why not buy a new awesome theme?</p>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <div class="pull-left">
                                                    <img src="${contextPath}/resources/img/avatar.png" class="img-circle" alt="image"/>
                                                </div>
                                                <h4>
                                                    Developers
                                                    <small><i class="fa fa-clock-o"></i> Today</small>
                                                </h4>
                                                <p>Why not buy a new awesome theme?</p>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <div class="pull-left">
                                                    <img src="${contextPath}/resources/img/avatar2.png" class="img-circle" alt="image"/>
                                                </div>
                                                <h4>
                                                    Sales Department
                                                    <small><i class="fa fa-clock-o"></i> Yesterday</small>
                                                </h4>
                                                <p>Why not buy a new awesome theme?</p>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <div class="pull-left">
                                                    <img src="${contextPath}/resources/img/avatar.png" class="img-circle" alt="image"/>
                                                </div>
                                                <h4>
                                                    Reviewers
                                                    <small><i class="fa fa-clock-o"></i> 2 days</small>
                                                </h4>
                                                <p>Why not buy a new awesome theme?</p>
                                            </a>
                                        </li>
                                    </ul>
                                </li>
                                <li class="footer"><a href="${contextPath}/admin/mailBox">See All Messages</a></li>
                            </ul>
                        </li>
                         <c:set value="${nlist.size()}" var="size"/>
                        <!-- Notifications: style can be found in dropdown.less -->
                        <li class="dropdown notifications-menu">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <i class="fa fa-warning"></i>
                                <span class="label label-warning">${size}</span>
                            </a>
                            <ul class="dropdown-menu">
                                <li class="header">You have ${size} notifications</li>
                                <li>
                                    <!-- inner menu: contains the actual data -->
                                    <ul class="menu">
                                   
                                    <c:forEach items="${nlist}" var="notofication" varStatus="status" >
                                        <c:choose>
                                       		<c:when test="${notofication.checkMsg =='article'}">
	                                       		<!-- <li>
		                                            <a href="#">
		                                                <i class="fa fa-user"></i> new members joined
		                                            </a>
		                                        </li> -->
		                                        <li>
				                                    <a href="#">
														 <i class="fa fa-user"></i> <span class="message">New user registration</span> <span class="time" style="margin-left: 60px;">1 min</span> 
				                                    </a>
				                                </li>
                                        	</c:when>
                                        	<c:when test="${notofication.checkMsg =='promote'}">
	                                       		<!-- <li>
		                                            <a href="#">
		                                                <i class="ion ion-ios7-cart success"></i> new promotion posted
		                                            </a>
		                                        </li> -->
		                                        <li>
				                                   <a href="#">
													 <i class="fa fa-list-alt"></i> <span class="message">new promotion posted</span> <span class="time" style="margin-left: 56px;">8 min</span> 
				                                   </a>
				                               </li>
                                        	</c:when>
                                        </c:choose>
                                          </c:forEach>
                                        <%-- <li>
                                            <a href="#">
                                                <i class="ion ion-ios7-people info"></i> 5 new members joined today
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <i class="fa fa-warning danger"></i> Very long description here that may not fit into the page and may cause design problems
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <i class="fa fa-users warning"></i> 5 new members joined
                                            </a>
                                        </li>

                                        <li>
                                            <a href="#">
                                                <i class="ion ion-ios7-cart success"></i> 25 sales made
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <i class="ion ion-ios7-person danger"></i> You changed your username
                                            </a>
                                        </li> --%>
                                    </ul>
                                </li>
                                <li class="footer"><a href="${contextPath}/admin/viewNotifications">View all</a></li>
                            </ul>
                        </li>
                        <!-- Tasks: style can be found in dropdown.less -->
                        <li class="dropdown tasks-menu">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <i class="fa fa-tasks"></i>
                                <span class="label label-danger">9</span>
                            </a>
                            <ul class="dropdown-menu">
                                <li class="header">You have 9 tasks</li>
                                <li>
                                    <!-- inner menu: contains the actual data -->
                                    <ul class="menu">
                                        <li><!-- Task item -->
                                            <a href="#">
                                                <h3>
                                                    Design some buttons
                                                    <small class="pull-right">20%</small>
                                                </h3>
                                                <div class="progress xs">
                                                    <div class="progress-bar progress-bar-aqua" style="width: 20%" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
                                                        <span class="sr-only">20% Complete</span>
                                                    </div>
                                                </div>
                                            </a>
                                        </li><!-- end task item -->
                                        <li><!-- Task item -->
                                            <a href="#">
                                                <h3>
                                                    Create a nice theme
                                                    <small class="pull-right">40%</small>
                                                </h3>
                                                <div class="progress xs">
                                                    <div class="progress-bar progress-bar-green" style="width: 40%" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
                                                        <span class="sr-only">40% Complete</span>
                                                    </div>
                                                </div>
                                            </a>
                                        </li><!-- end task item -->
                                        <li><!-- Task item -->
                                            <a href="#">
                                                <h3>
                                                    Some task I need to do
                                                    <small class="pull-right">60%</small>
                                                </h3>
                                                <div class="progress xs">
                                                    <div class="progress-bar progress-bar-red" style="width: 60%" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
                                                        <span class="sr-only">60% Complete</span>
                                                    </div>
                                                </div>
                                            </a>
                                        </li><!-- end task item -->
                                        <li><!-- Task item -->
                                            <a href="#">
                                                <h3>
                                                    Make beautiful transitions
                                                    <small class="pull-right">80%</small>
                                                </h3>
                                                <div class="progress xs">
                                                    <div class="progress-bar progress-bar-yellow" style="width: 80%" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
                                                        <span class="sr-only">80% Complete</span>
                                                    </div>
                                                </div>
                                            </a>
                                        </li><!-- end task item -->
                                    </ul>
                                </li>
                                <li class="footer">
                                    <a href="#">View all tasks</a>
                                </li>
                            </ul>
                        </li>
                        <!-- User Account: style can be found in dropdown.less -->
                        <li class="dropdown user user-menu">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <i class="glyphicon glyphicon-user"></i>
                                <span>${user.firstname} ${user.lastname} <i class="caret"></i></span>
                            </a>
                            <ul class="dropdown-menu">
                                <!-- User image -->
                                <li class="user-header bg-light-blue">
                                <c:choose>
                                <c:when test="${user.imagePath !=null}">
                                    <img src=" <c:url value="/resources/userImage/user${user.userId}.jpg"/>" class="img-circle" alt="Image" />
                                 </c:when>
                                 <c:otherwise>
                                    <img src="${contextPath}/resources/Images/administrator.png" class="img-circle" alt="Image" />
                                 </c:otherwise>
                                 </c:choose>   
                                    <p>
                                        ${user.firstname} ${user.lastname} - ${user.category}
                                        <c:set var="now" value="${user.createdDate}" />
                                        <small>Member since <fmt:formatDate type="date"     value="${now}" /></small>
                                    </p>
                                </li>
                                <!-- Menu Body -->
                                <li class="user-body">
                                    <div class="col-xs-4 text-center">
                                        <a href="#">Followers</a>
                                    </div>
                                    <div class="col-xs-4 text-center">
                                        <a href="#">Sales</a>
                                    </div>
                                    <div class="col-xs-4 text-center">
                                        <a href="#">Friends</a>
                                    </div>
                                </li>
                                <!-- Menu Footer-->
                                <li class="user-footer">
                                    <div class="pull-left">
                                        <a href="${contextPath}/admin/adminProfile" class="btn btn-default btn-flat">Profile</a>
                                    </div>
                                    <div class="pull-right">
                                        <a href="<c:url value='/admin/j_spring_security_logout'/>" class="btn btn-default btn-flat">Sign out</a>
                                    </div>
                                </li>
                            </ul>
                        </li>
                    </ul>
                  </sec:authorize>
         	   </sec:authorize>
              </div>
            </nav>
        </header>
        
   <div class="wrapper row-offcanvas row-offcanvas-left">
   <sec:authorize access="isAuthenticated()">
     <sec:authorize access="hasRole('ROLE_ADMIN')">
            <!-- Left side column. contains the logo and sidebar -->
            <aside class="left-side sidebar-offcanvas">
                <!-- sidebar: style can be found in sidebar.less -->
                <section class="sidebar">
                    <!-- Sidebar user panel -->
                    <div class="user-panel">
                        <div class="pull-left image">
                             <c:choose>
                                <c:when test="${user.imagePath !=null}">
                                    <img src=" <c:url value="/resources/userImage/user${user.userId}.jpg"/>" class="img-circle" alt="Image" />
                                 </c:when>
                                 <c:otherwise>
                                    <img src="${contextPath}/resources/Images/administrator.png" class="img-circle" alt="User Image" />
                                 </c:otherwise>
                            </c:choose>  
                        </div>
                        <div class="pull-left info">
                            <p>Hello, ${user.firstname}</p>

                            <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
                        </div>
			           <div class="panel panel-default hidden-xs">
				            <div class="v-center">
				              <div class="col-xs-8">
				                <h1 class="text-center margin-top-10"><a current-time="'h:mm:ss a'" id="time" href="javascript:void(0);" title="Calendar" style="color: #2a6496; font-size: 15px;">2:14:20 PM</a></h1>
				              </div>
				              <div class="col-xs-4 bg-info">
				                <h1 class="margin-bottom-15 margin-top-15 text-center">
				                 <span class="fa fa-clock-o fa-2x" style="color: #2a6496; font-size: 23px;"></span>
				                </h1>
				              </div>
				          </div>
				      </div>
					         
                    </div>
                    <!-- search form -->
                    <form action="#" method="get" class="sidebar-form">
                        <div class="input-group">
                            <input type="text" name="q" class="form-control" placeholder="Search..."/>
                            <span class="input-group-btn">
                                <button type='submit' name='seach' id='search-btn' class="btn btn-flat"><i class="fa fa-search"></i></button>
                            </span>
                        </div>
                    </form>
                   
                    <ul class="sidebar-menu">
                        <li class="active">
                            <a href="${contextPath}/admin/adminHome">
                                <i class="fa fa-dashboard"></i> <span>Dashboard</span>
                            </a>
                        </li>
                         <li>
                            <a href="${contextPath}/admin/mailBox">
                                <i class="fa fa-envelope"></i> <span>Mailbox</span>
                                <small class="badge pull-right bg-yellow">${folderssize.size()}</small>
                            </a>
                        </li>
                         <li class="treeview">
                            <a href="#">
                                <i class="fa fa-users"></i>
                                <span>Application Users</span>
                                <i class="fa fa-angle-left pull-right"></i>
                            </a>
                            <ul class="treeview-menu">
                                <li><a href="${contextPath}/admin/createUser"><i class="fa fa-user"></i> <span>Create NewUsers</span></a></li>
                                <li><a href="${contextPath}/admin/viewUserDetail"><i class="fa fa-users"></i> <span>View Users</span></a></li>
                                <li><a href="${contextPath}/admin/viewUsage"><i class="fa fa-signal"></i> View Usage Status</a></li>
                            </ul>
                        </li>
                      
                      <li class="treeview">
                            <a href="#">
                                <i class="fa fa-users"></i>
                                <span>Manage Articles</span>
                                <i class="fa fa-angle-left pull-right"></i>
                            </a>
                            <ul class="treeview-menu">
                                <li><a href="${contextPath}/admin/createArticle"><i class="fa fa-tasks"></i> <span>Create Articles</span></a></li>
                                <li><a href="${contextPath}/admin/viewArticle"><i class="fa fa-th-list"></i> <span>View All Articles</span></a></li>
                            </ul>
                        </li>
                      
                       <li class="treeview">
                            <a href="#">
                                <i class="fa fa-users"></i>
                                <span>Manage AD'S</span>
                                <i class="fa fa-angle-left pull-right"></i>
                            </a>
                            <ul class="treeview-menu">
                                <li><a href="${contextPath}/admin/createPromotion"><i class="fa fa-meh-o"></i> <span>New Ad's</span></a></li>
                                <li><a href="${contextPath}/admin/viewPostedAd"><i class="fa fa-list-alt"></i> <span>Posted Promotions/Ad's</span></a></li>
                            </ul>
                        </li>
                     	<li class="treeview">
                            <a href="#">
                                <i class="fa fa-users"></i>
                                <span>Manage Notifications</span>
                                <i class="fa fa-angle-left pull-right"></i>
                            </a>
                            <ul class="treeview-menu">
                                <li><a href="${contextPath}/admin/viewNotifications"><i class="fa fa-warning"></i> <span>Notifications</span></a></li>
                            </ul>
                        </li>
                        <li class="treeview">
                            <a href="#">
                                <i class="fa fa-users"></i>
                                <span>Manage Categories</span>
                                <i class="fa fa-angle-left pull-right"></i>
                            </a>
                            <ul class="treeview-menu">
                                <li><a href="${contextPath}/admin/manageCategory"><i class="fa fa-flag-checkered"></i> <span>Categories</span></a></li>
                            </ul>
                        </li>
                        
                       
                          <li class="active">
                            <a href="${contextPath}/admin/manageMap">
                                <i class="fa fa-globe"></i> <span>Manage Map</span>
                            </a>
                        </li>
                       
                    </ul>
                </section>
            </aside> 
	</sec:authorize>
 </sec:authorize>
 
	<sitemesh:write property='body'/>
</div>
	
	
	<sitemesh:write property="footer"/>
	
	 
 
	
</body>
</html>