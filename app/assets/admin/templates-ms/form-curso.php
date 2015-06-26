<div style="margin: 20px auto;text-align: center">
    <table style="width: 100%">
        <tr>
            <td style="text-align: right"><span>Titulo</span></td>
            <td><input type="text" required id="curso-titulo"/></td>
        </tr>
        <tr>
            <td style="text-align: right"><span>Imagen</span></td>
            <td><input type="file" required id="curso-imagen"/></td>
        </tr>
        <tr>
            <td style="text-align: right"><span>Descripcion</span></td>
            <td><textarea cols="50" rows="10" required id="curso-descripcion"></textarea></td>
        </tr>
        <tr>
            <td colspan="2"><span id="curso-error" style="color:red"></span></td>
        </tr>
    </table>
    <button class="btn btn-success" id="btn-crea-curso" style="margin-top: 10px">Crear curso</button>
</div>
<script src="js/form-curso.js"></script>