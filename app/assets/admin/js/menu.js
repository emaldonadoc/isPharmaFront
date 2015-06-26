$(document).ready(initMenu);

var divCursos;
var divNoticias;
var divContainer;

function initMenu(){
    $('#btn-close').click(closeSession);
    $("#btn-cursos").click(showDivCursos);
    $("#btn-noticias").click(showDivNoticias);
    $("#btn-nuevo-curso").click(showFormCurso);
    $("#btn-show-cursos").click(showCursos);
    $("#btn-nuevo-noticia").click(showFormNoticia);
    $("#btn-show-noticias").click(function(){
        showNoticias(1);
    });
    divCursos = $("#div-cursos");
    divNoticias = $("#div-noticias");
    divContainer = $("#div-container");
}

function closeSession(){
    location.href="bin/controller/CloseSession.php";
}

function showDivCursos(){
    divNoticias.hide();
    divCursos.show();
    divContainer.empty();
}

function showDivNoticias(){
    divNoticias.show();
    divCursos.hide();
    divContainer.empty();
}

function showFormCurso(){
    divContainer.empty();
    $.get('templates-ms/form-curso.php', function(template) {
      var rendered = Mustache.render(template,null);
      divContainer.html(rendered);
    });
}

function showCursos(){
    divContainer.empty();
    $.ajax({
       url: "bin/controller/GetCursos.php",
       type: "POST",
       dataType:"json",
       success : function(json){
           $.get('templates-ms/show-cursos.html', function(template) {
                var rendered = Mustache.render(template,json);
                divContainer.html(rendered);
            });
       },
       error: function(){}
    });
}

function remueveCurso(id){
    $.ajax({
       url: "bin/controller/RemueveCurso.php",
       type: "POST",
       data:{
           "id" :id
       }
    }).done(function(){
            showCursos();
    });
}

function showFormNoticia(){
    divContainer.empty();
    $.get('templates-ms/form-noticia.php', function(template) {
      var rendered = Mustache.render(template,null);
      divContainer.html(rendered);
    });
}

function showNoticias(pagina){
    divContainer.empty();
    $.ajax({
       url: "bin/controller/GetNoticias.php",
       data:{
           "pagina":pagina
       },
       type: "POST",
       dataType:"json",
       success : function(json){
           $.get('templates-ms/show-noticias.html', function(template) {
                var rendered = Mustache.render(template,json.data);
                divContainer.html(rendered);
            }).done(function(){
                paginador = $("#paginador");
                for(index = 1; index<= json.data.paginas; index++){
                    if(index !== parseInt(json.data.pagina)){
                        paginador.append($("<a>",{
                            click:function(){
                                showNoticias($(this).data('pagina'));
                            },
                            "data-pagina" : index,
                            text:index + ' '
                        }));
                    }
                }
            });
       },
       error: function(){}
    });
}

function remueveNoticia(id){
    $.ajax({
       url: "bin/controller/RemueveNoticia.php",
       type: "POST",
       data:{
           "id" :id
       }
    }).done(function(){
            showNoticias();
    });
}