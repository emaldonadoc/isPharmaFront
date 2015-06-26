<?php
    session_start();
    if($_SESSION['usuario'] != NULL){
        header('Location: menu.php');
    }
?>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Login</title>
        <link href="css/bootstrap.css" rel="stylesheet">
        <link href="css/modern-business.css" rel="stylesheet">
        <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    </head>
    <body>
        
       <div style="margin: 30px auto;width: 500px;height: 400px;border: #00BFFF outset thick;text-align: center">
           <div  class="btn-primary" style="padding: 20px;font-size: 30px">Login</div>
           <table style="font-size: 20px;width: 100%">
                <tr>
                    <td style="padding: 15px;text-align: right">
                        <span>Usuario</span>
                    </td>
                    <td><input type="text" id="login-user"/></td>
                </tr>
                <tr>
                    <td style="padding: 15px;text-align: right">
                        <span>Password</span>
                    </td>
                    <td><input type="password" id="login-password"/></td>
                </tr>
                <tr>
                    <td style="padding: 20px;" colspan="2">
                         <span style="color: red" id="login-message-error" ></span>
                     </td>
                </tr>
            </table>
           
           <div>
                <button style="padding: 30px;font-size: 22px" id="btn-login" class="btn btn-primary">Ingresar</button>
            </div>
        </div>

        <script src="js/jquery.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/login.js"></script>
    </body>
</html>
