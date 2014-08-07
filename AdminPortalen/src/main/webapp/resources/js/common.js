 var contextPath;
 
$(document).ready(function(){

    $('#dialog').hide();
    
  }); //Main Jquery End


function EditUserDetails(userId){
    contextPath = $('#contextPath').val();
   // alert(userId);
    $('#dialog').hide();
    $.get(contextPath+"/admin/editUserDetails?userId="+userId, function(data) {
        
      
      // alert(data.enabled);
        $('#userId').val(data.userId);   
        $('#firstname').val(data.firstname);
        $('#lastname').val(data.lastname);
        $('#username').val(data.username);
        $('#email').val(data.email);
        $('#password').val(data.password);
        $('#userRole').val(data.userRole);
       // $('#userRoleId').val(data.userRoles.userRoleId);
        
        if(data.enabled){     
        	$("#enabled").val(1);
        	//$("#enabled option:contains('1')").attr('selected', true);        			
        }else{
        	$("#enabled").val(0);
        	//$("#enabled option:contains('0')").attr('selected', false);
        }
        $('#city').val(data.city);
        $('#state').val(data.state);
        $('#country').val(data.country);
        $('#gender').val(data.gender);
        $('#contactno').val(data.contactno);
        $('#he').val(data.enabled);
        $('#category').val(data.category);
        $("#editUserDialog").dialog({
             resizable: false,
             modal: true,
             width:'auto',
             height:'auto',
             buttons: {
                       "Cancel ": function(e) { 
                           $( this ).dialog( "close" );
                           },
                       "Update": function(e) {
                           updateUserDetails(e);
                           $( this ).dialog( "close" );
                        }
                    }
                });
      });
   
  
}


function updateUserDetails(e){
    e.preventDefault();
    //alert($('#employmentForm').serialize());
  
     $.post(contextPath+"/admin/updateUserDetails",$('#update-Userform').serialize(), function() {
         $('#update-Userform')[0].reset();
            location.reload();
      }); 
}


function addNewUser(){
    
    contextPath = $('#contextPath').val();
    $('#dialog').hide();
    $('#update-Userform')[0].reset();
    $( "#editUserDialog" ).dialog({
        resizable: false,
        modal: true,
        width:'auto',
        height:'auto',
        buttons: {
              "Cancel ": function(e) { 
                  $( this ).dialog( "close" );
                  },
              "Update": function(e) {
                  saveUserDetails(e);
                  $( this ).dialog( "close" );
               }
              }
          });
    
}

function saveUserDetails(e){
    e.preventDefault();
  
     $.post(contextPath+"/saveUserDetails",$('#update-Userform').serialize(), function(data) {
         //alert(data.message);
         $('#successMsg').html(data.message);
         $('#update-Userform')[0].reset();
            location.reload();
      }); 
}

function deleteUser(userId){
    contextPath = $('#contextPath').val();
   
    $( "#dialog" ).dialog({
        resizable: false,
        modal: true,
        width:'auto',
        height:'auto',
        buttons: {
              "Cancel ": function(e) { 
                  $( this ).dialog( "close" );
                  },
              "Delete": function(e) {
                  deleteUserById(e,userId);
                  $( this ).dialog( "close" );
               }
              }
         });
}

function deleteUserById(e,userId){
    
    e.preventDefault();
   // alert(FPortfolioId);
    $.get(contextPath+"/admin/deleteUser/"+userId, function() {
           location.reload();
       }); 
}
