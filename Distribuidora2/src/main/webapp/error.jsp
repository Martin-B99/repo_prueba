
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
   <link rel="stylesheet" href="style.css">
  <title>Página de error</title>
  
</head>
<body>


  <% String errorIngreso = (String) request.getAttribute("errorIngreso"); %>
  <% if (errorIngreso != null && !errorIngreso.isEmpty()) { %>
    <script>
    var alerta = document.createElement('div');
    alerta.classList.add('alert');
    alerta.innerHTML = '<h1>¡Error!</h1><p>Datos incorrectos.</p><button>Volver</button>';
    document.body.appendChild(alerta);

    var boton = alerta.querySelector('button');
    boton.addEventListener('click', function() {
      window.history.back();
    });
     
    </script>	
  <% } %>
  
  <% String errorMessage = (String) request.getAttribute("errorMessage"); %>
  <% if (errorMessage != null && !errorMessage.isEmpty()) { %>
    <script>
      	
    var alerta = document.createElement('div');
    alerta.classList.add('alert');
    alerta.innerHTML = '<h1>¡Error!</h1><p>No Existe Cliente.</p><button>Volver</button>';
    document.body.appendChild(alerta);

    var boton = alerta.querySelector('button');
    boton.addEventListener('click', function() {
      window.history.back();
    });
    </script>	
  <% } %>

   
   
  <% String errorInicio1 = (String) request.getAttribute("errorInicio1"); %>
  <% if (errorInicio1 != null && !errorInicio1.isEmpty()) { %>
    <script>
    
    var alerta = document.createElement('div');
    alerta.classList.add('alert');
    alerta.innerHTML = '<h1>¡Error!</h1><p>Error de conexión a la base de datos.</p><button>Volver</button>';
    document.body.appendChild(alerta);

    var boton = alerta.querySelector('button');
    boton.addEventListener('click', function() {
    	window.location.href = "ingreso.jsp";
    });
      
     
    </script>
  <% } %>
 
 
  <% String errorInicio2 = (String) request.getAttribute("errorInicio2"); %>
  <% if (errorInicio2 != null && !errorInicio2.isEmpty()) { %>
    <script>
    
    var alerta = document.createElement('div');
    alerta.classList.add('alert');
    alerta.innerHTML = '<h1>¡Error!</h1><p>Documento Incorrecto.</p><button>Volver</button>';
    document.body.appendChild(alerta);

    var boton = alerta.querySelector('button');
    boton.addEventListener('click', function() {
    	window.location.href = "ingreso.jsp";
    });
     
    
    </script>
  <% } %>
  
  
   <% String errorInicio3 = (String) request.getAttribute("errorInicio3"); %>
  <% if (errorInicio3 != null && !errorInicio3.isEmpty()) { %>
    <script>
     
    var alerta = document.createElement('div');
    alerta.classList.add('alert');
    alerta.innerHTML = '<h1>¡Error!</h1><p>Usuario o Contraseña Incorrecta.</p><button>Volver</button>';
    document.body.appendChild(alerta);

    var boton = alerta.querySelector('button');
    boton.addEventListener('click', function() {
    	window.location.href = "ingreso.jsp";
    });
     
    
    </script>
  <% } %>
 
 
  <% String errorMessage2 = (String) request.getAttribute("errorMessage2"); %>
  <% if (errorMessage2 != null && !errorMessage2.isEmpty()) { %>
    <script>
      
    var alerta = document.createElement('div');
    alerta.classList.add('alert');
    alerta.innerHTML = '<h1>¡Error!</h1><p>Error de Datos.</p><button>Volver</button>';
    document.body.appendChild(alerta);

    var boton = alerta.querySelector('button');
    boton.addEventListener('click', function() {
      window.history.back();
    });
    
     
    </script>
  <% } %>
 

  <% String Venta = (String) request.getAttribute("Venta"); %>
  <% if (Venta != null && !Venta.isEmpty()) { %>
    <script>
      
    var alerta = document.createElement('div');
    alerta.classList.add('alert');
    alerta.innerHTML = '<h1>¡Bien!</h1><p>Venta Generada Correctamente.</p><button>Volver</button>';
    document.body.appendChild(alerta);

    var boton = alerta.querySelector('button');
    boton.addEventListener('click', function() {
      window.history.back();
    });
    
     
    </script>
  <% } %>
 

  
   <% String error = (String) request.getAttribute("error"); %>
  <% if (error != null && !error.isEmpty()) { %>
    <script>
    var alerta = document.createElement('div');
    alerta.classList.add('alert');
    alerta.innerHTML = '<h1>¡Error!</h1><p>Stock Insuficiente.</p><button>Volver</button>';
    document.body.appendChild(alerta);

    var boton = alerta.querySelector('button');
    boton.addEventListener('click', function() {
      window.history.back();
    });
   
    </script>
  <% } %>
  
  
   <% String error1 = (String) request.getAttribute("error1"); %>
  <% if (error1 != null && !error1.isEmpty()) { %>
    <script>
    
    var alerta = document.createElement('div');
    alerta.classList.add('alert');
    alerta.innerHTML = '<h1>¡Error!</h1><p>El Articulo Ya Existe</p><button>Volver</button>';
    document.body.appendChild(alerta);

    var boton = alerta.querySelector('button');
    boton.addEventListener('click', function() {
      window.history.back();
    });
      
     
    </script>
  <% } %>
  
  
 
</body>
</html>