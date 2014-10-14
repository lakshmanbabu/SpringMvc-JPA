<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="spring"  uri="http://www.springframework.org/tags"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>User UsageStatus</title>
</head>
<body>
<style>
 #chartdiv1 {
	width		:100%;
	height		: 300px;
	font-size	: 11px;
} 


#chartdiv {
	width		: 100%;
	height		: 300px;
	font-size	: 11px;
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
                        <li class="active">View Users Count</li>
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
                                <br/><br/>
                                  <div id="chartdiv1"></div>
                                  <div id="chartdiv"></div>
                             </div>
                         </div>
                     </div>
                 </div>

                </section>
            </aside>
        </div>
        
 <script type="text/javascript">
 
 
	var chart5 = AmCharts.makeChart("chartdiv1", {
	    "type": "pie",
	    "theme": "none",
	    "dataProvider": [{
	        "title": "Admins",
	        "value": '${adminUsers.size()}'
	    }, {
	        "title": "Users",
	        "value": '${appUser.size()}'
	    }],
	    "titleField": "title",
	    "valueField": "value",
	    "labelRadius": 5,
	
	    "radius": "42%",
	    "innerRadius": "60%",
	    "labelText": "[[title]]"
	}); 
	
	var json = (function () {
	    var json = null;
	    $.ajax({
	        'async': false,
	        'global': false,
	        'url': "${contextPath}/admin/getListOfCustomers",
	        'dataType': "json",
	        'success': function (data) {
	            json = data;
	        }
	    });
	    return json;
	})(); 
	
	var chart = AmCharts.makeChart("chartdiv", {
        "type": "serial",
        "theme": "light",
        "pathToImages": "http://www.amcharts.com/lib/3/images/",
        "dataDateFormat": "YYYY-MM-DD",
        "valueAxes": [{
        	"unit":"",
        	"unitPosition":"left",
            "axisAlpha": 0,
            "position": "left", 
            "title": "Registerd Users" , 
             "valueUnit":""
        }],
        "graphs": [{
			"id": "g1",
            "bullet": "round",
            "bulletBorderAlpha": 1,
            "bulletColor": "#FFFFFF",
            "bulletSize": 5,
            "hideBulletsCount": 50,
            "lineThickness": 2,
            "title": "red line",
            "useLineColorForBulletBorder": true,
            "valueField": "customers",
            "balloonText":"[[category]]<br><b><span style='font-size:12px;'>Registered Users:[[value]]</span></b>"
               
        }],
        "chartScrollbar": {
			"graph": "g1",
			"scrollbarHeight": 30
		},
        "chartCursor": {
            "cursorPosition": "mouse",
            "pan": true
        },
        "categoryField": "date",
        "categoryAxis": {
            "parseDates": true,
            "dashLength": 1,
            "minorGridEnabled": true,
            "position": "bottom"
        },
        exportConfig:{
          menuRight: '20px',
          menuBottom: '50px',
          menuItems: [{
          icon: 'http://www.amcharts.com/lib/3/images/export.png',
          format: 'png'	  
          }]  
        },
        "dataProvider":json
	}
    
	);

  </script>    
  
  
</body>
</html>