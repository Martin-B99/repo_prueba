<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!doctype html>
<html lang="en">

    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        
        
		 <link rel="stylesheet" href="stylebotones.css">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
		
        <title>Ventas</title>
         <link rel="icon" type="image" href="distribuidora_logo.png">
         
    </head>
    <body>
        <div class="row">
            <div class="card col-md-4">
                <div class="card-body">
                   <h5 class="card-title" align="center">Ventas</h5>
                    <h6 class="card-subtitle mb-2 text-muted" align="center">En este panel podras Gestionar Las Ventas</h6>
                     <center>
  						<img alt="logo" src="ventas.png"  width="200" height="200" >
   					</center>
                   
                </div>
            </div>
          
         
			
            <div class="col-md-8">
                <table class="table">
                    <thead class="thead-dark">
                        <tr>
                        	<th scope="col">Id</th>
                           	<th scope="col">Tipo Articulo</th>
                            <th scope="col">Nombre</th>
                            <th scope="col">Stock</th>
                            <th scope="col">Precio</th>
                            <th scope="col">Acciones</th>
                            
                            <div>
					
					<form action="Controlador?menu=Articulos&accion=Filtrar" method="POST">
					  <label for="filtro" style="font-weight: bold;">Filtrar por:</label>
					  <select id="filtro" name="filtro" style="padding: 5px; margin-right: 10px;">
					    <option value="">Seleccionar una opción</option>
					    <option value="Caramelo">Caramelo</option>
					    <option value="Galletita">Galletita</option>
					    <option value="Chocolate">Chocolate</option>
					    <option value="Tostada">Tostada</option>
					    <option value="Chupaleta">Chupaleta</option>
					    <option value="Gaseosa">Gaseosa</option>
					  </select>
					  <button type="submit" style="background-color: blue; color: white; padding: 10px; margin: 10px;">Filtrar</button> 
					</form>
				</div>	
                            
                            
                        </tr>
                    </thead>
                    <tbody>
                    
                        <c:forEach var="articulo" items="${articulo}">

                            <tr>
                            	<td>${articulo.getId()}</td>
 								<td>${articulo.getTa().getDescripcion()}</td>
                                <td>${articulo.getNombre()}</td>                               
                                <td>${articulo.getStock()}</td>
                                <td>${articulo.getPrecio()}</td>
                               
              
                                <td>
                              
                                
   
                          <a class="btn btn-success" href="Controlador?menu=Articulos&accion=Cargar&id=${articulo.getId()}">Pagado</a>
                              <a class="btn btn-secondary" href="Controlador?menu=Articulos&accion=Eliminar&id=${articulo.getId()}">No Pagado</a>
                                </td>

                            </tr>
                        </c:forEach>


                    </tbody>
                </table>
            </div>
            </div>

            <!-- Optional JavaScript -->
            <!-- jQuery first, then Popper.js, then Bootstrap JS -->
            <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
            <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
            <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
    </body>
</html>