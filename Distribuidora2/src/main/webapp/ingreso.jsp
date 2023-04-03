<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta charset="utf-8">
    
    <link rel="stylesheet" href="style.css">
<title>Inicio</title>
 <link rel="icon" type="image" href="distribuidora_logo.png">
</head>
<body>


 <div class="center">

 <center>
  <img alt="logo" src="distribuidora_logo.png"  width="200" height="200" >
   </center>
      <h1>¡Bienvenido!</h1>
      <form action="Validar" method="POST">
        <div class="txt_field">
        
          <input type="text" required name="txtusuario">
          <span></span>
          <label>Usuario</label>
        </div>
        <div class="txt_field">
          <input type="password" required name="txtpassword">
          <span></span>
          <label>Contraseña</label>
        </div>
        <div class="pass">¿Olvidaste tu Contraseña?</div>
        <input type="submit" name="accion" value="Ingresar">
        <br></br>
        <!--  
        <div class="signup_link">
          Not a member? <a href="#">Signup</a>
        </div>-->
        <center>
      <button class="btn-contacto"><a href="index.jsp">Volver al Inicio</a></button>
        </center>
        
      </form>
    </div>

</body>
</html>