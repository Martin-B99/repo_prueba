
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Página de error</title>
  
</head>
<body>
  
  <% String errorMessage = (String) request.getAttribute("errorMessage"); %>
  <% if (errorMessage != null && !errorMessage.isEmpty()) { %>
    <script>
      	
      alert("No Existe Cliente");
      window.history.back();
    </script>	
  <% } %>
  
    <% String errorIngreso = (String) request.getAttribute("errorIngreso"); %>
  <% if (errorIngreso != null && !errorIngreso.isEmpty()) { %>
    <script>
      alert("Datos incorrectos");
      window.history.back();
    </script>	
  <% } %>
   
   
  <% String errorInicio1 = (String) request.getAttribute("errorInicio1"); %>
  <% if (errorInicio1 != null && !errorInicio1.isEmpty()) { %>
    <script>
      
      alert("Error de conexión a la base de datos");
      window.history.back();
    </script>
  <% } %>
 
 
  <% String errorInicio2 = (String) request.getAttribute("errorInicio2"); %>
  <% if (errorInicio2 != null && !errorInicio2.isEmpty()) { %>
    <script>
     
      alert("Documento Incorrecto");
      window.history.back();
    </script>
  <% } %>
 
 
  <% String errorMessage2 = (String) request.getAttribute("errorMessage2"); %>
  <% if (errorMessage2 != null && !errorMessage2.isEmpty()) { %>
    <script>
      
      alert("Error de Datos");
      window.history.back();
    </script>
  <% } %>
 
 
  <% String errorMessage3 = (String) request.getAttribute("errorMessage3"); %>
  <% if (errorMessage3 != null && !errorMessage3.isEmpty()) { %>
    <script>
      
      alert("Error de Datos");
      window.history.back();
    </script>
  <% } %>
 
  <% String errorMessage4 = (String) request.getAttribute("errorMessage4"); %>
  <% if (errorMessage4 != null && !errorMessage4.isEmpty()) { %>
    <script>
      
      alert("Error de Datos");
      window.history.back();
    </script>
  <% } %>
 
  <% String errorMessage5 = (String) request.getAttribute("errorMessage5"); %>
  <% if (errorMessage5 != null && !errorMessage5.isEmpty()) { %>
    <script>
      
      alert("No Hay Pedido Seleccionado");
      window.history.back();
    </script>
  <% } %>
  
   <% String error = (String) request.getAttribute("error"); %>
  <% if (error != null && !error.isEmpty()) { %>
    <script>
      
      alert("Stock Insuficiente");
      window.history.back(); 
    </script>
  <% } %>
  
  
   <% String error1 = (String) request.getAttribute("error1"); %>
  <% if (error1 != null && !error1.isEmpty()) { %>
    <script>
      
      alert("Articulo Existente");
      window.history.back(); 
    </script>
  <% } %>
 
</body>
</html>