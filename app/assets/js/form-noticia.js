$(document).ready(initForm);

var lblError;
var titulo;
var descripcion;
var imagen;

function initForm(){
    lblError = $("#noticia-error");
    titulo = $("#noticia-titulo");
    descripcion = $("#noticia-descripcion");
    imagen = $("#noticia-imagen").change(function(){
        lblError.empty();
        if(!validExtension(this.value)){
            lblError.text("La imagen deben ser de tipo jpg o pdf, no se permiten otro tipo de formatos, favor de revisarlo.");
            this.value=null;
        }
    });
    $("#btn-crea-noticia").click(creaNoticia);
}

function validExtension(fileName){
    var fileExtension = fileName.substring(fileName.lastIndexOf('.') + 1);
    switch(fileExtension.toLowerCase()){
        case 'jpg': case 'png':
            return true;
        break;
        default:
            return false;
        break;
    }
}
       
       
function creaNoticia(){
    lblError.empty();
    
    if(titulo.val() ===''){
        lblError.text('Por favor ingrese el titulo de la noticia');
        return;
    }
    
    if(imagen.val() ===''){
        lblError.text('Por favor adjunte la imagen de la noticia');
        return;
    }
    
     if(descripcion.val() ===''){
        lblError.text('Por favor ingrese la descripcion de la noticia');
        return;
    }
    
    var file_data = imagen.prop("files")[0];   
    var form_data = new FormData();                  
    form_data.append("imagen", file_data);
    form_data.append("titulo", titulo.val());
    form_data.append("descripcion", descripcion.val());
    
    console.log(form_data);
    
    $.ajax({
       url : "bin/controller/CreaNoticia.php",
       data : form_data,
       cache: false,
       contentType: false,
       processData: false,
       method:"POST",
       dataType: "json",
       success: function(json){
           if(!json.success){
               lblError.text(json.message);
               return;
           }else{
               $("#div-container").empty();
           }
       }
    });
}