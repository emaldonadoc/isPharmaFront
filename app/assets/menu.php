<?php 
    require_once 'bin/data/Usuario.php';
    session_start();
    $usuario = $_SESSION['usuario'];
    if($usuario == NULL){
        header('Location: login.php');
    }
?>

<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Menu</title>
        <link rel="stylesheet" href="stylesheets/app.css">
    </head>
    <body>
        <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
            <div class="container">
                <div class="navbar-header">
                    <img class="navbar-brand" src="images/user.png" />
                    <span class="navbar-brand">
                        <?php
                            echo $usuario->getNombre();
                        ?>
                   </span>
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>

                </div>
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav navbar-right">
                        <li>
                            <a href="#" id="btn-cursos" style="font-size: 25px">Cursos</a>
                        </li>
                        <li>
                            <a href="#" id="btn-noticias" style="font-size: 25px">Noticias</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <div style="height: 80%">
            <div style="margin: 10px auto;width: 98%;height: 95%;text-align: left;">
                <div id="div-cursos" style="display: none">
                    <button class="btn btn-warning" id="btn-nuevo-curso" style="padding: 20px;font-size: 15px">
                        Nuevo Curso
                    </button>
                     <button class="btn btn-warning" id="btn-show-cursos" style="padding: 20px;font-size: 15px">
                        Todos los Cursos
                    </button>
                </div>
                <div id="div-noticias" style="display: none">
                    <button class="btn btn-warning" id="btn-nuevo-noticia" style="padding: 20px;font-size: 15px">
                        Nueva Noticia
                    </button>
                     <button class="btn btn-warning" id="btn-show-noticias" style="padding: 20px;font-size: 15px">
                        Todos las Noticias
                    </button>
                </div>
                <div id="div-container" style="overflow: auto;height: 80%"></div>
            </div>
        </div>
        <footer>
            <div style="float: right">
                <button class="btn btn-danger" id="btn-close" style="font-size: 14px;padding: 20px;margin-right: 10px">
                    Cerrar Sesión
                </button>
            </div>
        </footer>
        <script src="js/lib/jquery.js"></script>
        <script src="js/lib/bootstrap.min.js"></script>
        <script src="js/lib/mustache.js"></script>
        <script src="js/menu.js"></script>
    </body>
</html>
