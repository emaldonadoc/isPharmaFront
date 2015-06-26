<div style="margin: 20px auto;text-align: center">
    <table style="width: 100%">
        <tr>
            <td style="text-align: right"><span>Titulo</span></td>
            <td><input type="text" required id="noticia-titulo"/></td>
        </tr>
        <tr>
            <td style="text-align: right"><span>Imagen</span></td>
            <td><input type="file" required id="noticia-imagen"/></td>
        </tr>
        <tr>
            <td style="text-align: right"><span>Descripcion</span></td>
            <td><textarea cols="50" rows="10" required id="noticia-descripcion"></textarea></td>
        </tr>
        <tr>
            <td colspan="2"><span id="noticia-error" style="color:red"></span></td>
        </tr>
    </table>
    <button class="btn btn-success" id="btn-crea-noticia" style="margin-top: 10px">Crear noticia</button>
</div>
<script src="js/lib/bootstrap-datepicker.js"></script>
<script src="js/form-noticia.js"></script>