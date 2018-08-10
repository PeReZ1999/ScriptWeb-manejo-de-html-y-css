<?php include ('../templates/head.php'); ?>

<div class="fondo_c" >
<br>
      <form class="form" action="#" method="post">
          <h2>CONTACTENOS</h2>
          <p>
          <input class="input" type="text" name="nombre" placeholder="Nombre" required>
          <input  class="input"type="text" name="apellidos" placeholder="Apellidos" required>
          <input  class="input" type="email" name="correo" placeholder="Correo" required>
          <input class="input" type="text" name="telefono" placeholder="Teléfono" required>
          <input class="input" type="text" name="asunto" placeholder="Asunto" required>
          </p>

            <p>
              <select class="select" name="motivo">
                <option>Quejas</option>
                <option>Sugerencias</option>
                <option>Soporte tecnico</option>
                <option>Nuevo Servicio</option>
                <option selected="selected">--seleccionar--</option>
              </select>
            </p>

          <textarea class="textarea" name="mensaje" placeholder="Escriba aqui su mensaje" required></textarea>
          <input class="input" type="submit" value="ENVIAR" id="boton">
      </form>
</div>
