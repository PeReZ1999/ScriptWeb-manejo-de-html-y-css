<?php include ('../templates/head.php'); ?>
<div class="fondo_r">
  <div class="container">

    <br>
    <form>

        <center>
      <h1   class="label"><b>REGISTRO</b></h1>
        </center>

        <article class="article_r">

          <label class="usu">NOMBRES </label>
          <input class="celdas" type="text" placeholder="Nombres...">

          <label class="usu"> APELLIDOS </label>
          <input class="celdas" type="text" placeholder="Apellidos...">

          <label class="usu"> TIPO DE USUARIO </label>
            <select class="desplegar" >
              <option value="volvo">Coodinador</option>
              <option value="saab">Instructor</option>
              <option value="opel">Aprendiz</option>
              <option value="audi">Visitante</option>
            </select>

            <label class="usu"> GENERO </label>
              <select class="desplegar_1" >
                <option value="volvo">Mujer</option>
                <option value="saab">Hombre</option>
                <option selected="selected" value="opel">sexo...</option>
              </select>

              <label class="usu"> TIPO DE DOCUMENTO </label>
                <select class="desplegar_1_1" >
                  <option value="volvo">T.I</option>
                  <option value="saab">C.C</option>
                  <option selected="selected" value="opel">Documento...</option>
                </select>

          <label class="usu"> N° DOCUMENTO </label>
          <input class="celdas" type="text" placeholder="101019987...">

          <label class="usu"> CORREO</label>
          <input class="celdas" type="text" placeholder="pepito@hotmail.com">


          <label class="usu"> N° CELULAR </label>
          <input class="celdas" type="text" placeholder="3118732549">

          <label class="usu"> TELEFONO </label>
          <input class="celdas_1 " type="text" placeholder="6844653">

          <label class="usu"> DIRECCIÓN </label>
          <input class="celdas_1" type="text" placeholder="Cll 122b bis #34 - 123">

          <label class="usu"> NOMBRE DE USUARIO </label>
          <input class="celdas_1" type="text" placeholder="Pepito el mejor">

          <label class="usu1"> CONFIRMAR NOMBRE DE USUARIO </label>
          <input class="celdas2" type="text" placeholder="Pepito el mejor">

          <label class="usu"> PASWORD </label>
          <input class="celdas_1" type="password" placeholder="***********">

          <label class="usu"> CONFIRMAR PASWORD </label>
          <input class="celdas_1" type="password" placeholder="***********">


          <center>

          <button class="button button1">Registrate con FACEBOOK</button>
          <button class="button_1 button2">Enviar datos</button>

        </center>
<br><br>

      </article>
    </form>
  </div>
</div>
