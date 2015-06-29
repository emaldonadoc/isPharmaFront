$(document).ready(initLogin);

var btnButton;
var lblError;
var user;
var password;

function initLogin(){
    btnButton = $('#btn-login').click(sendLogin);
    lblError = $('#login-message-error');
    user = $('#login-user');
    password = $('#login-password');
}

function sendLogin(){
    lblError.empty();
    
    if(user.val() ===''){
        lblError.text('Por favor ingrese su nombre de usuario');
        return;
    }
    
    if(password.val() ===''){
        lblError.text('Por favor ingrese su password');
        return;
    }
    
    $.ajax({
       url : "bin/controller/Login.php",
       data : {
           "user" : user.val(),
           "password" : password.val()
       },
       cache: false,
       method:"POST",
       dataType: "json",
       success: function(json){
           if(!json.success){
               lblError.text(json.message);
               return;
           }
           location.href="menu.php";
       }
    });
}