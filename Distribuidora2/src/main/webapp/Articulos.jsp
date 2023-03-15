<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!doctype html>
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">

        <title>Articulos</title>
        <link rel="icon" type="image" href="distribuidora_logo.png">
    </head>
    <body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <a class="navbar-brand" href="Controlador?menu=Principal">Distribuidora</a>
           
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            
           

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                  <!--  <li class="nav-item active">
                        <a class="nav-link">Home<span class="sr-only">(current)</span></a>
                    </li>-->
                    
                    <li class="nav-item">
                        <a class="nav-link" href="Controlador?menu=Clientes&accion=Listar" target="miContenedor">Clientes</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="Controlador?menu=Articulos&accion=Listar" target="miContenedor">Articulos</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="Controlador?menu=Pedidos&accion=Listar" target="miContenedor">Pedidos</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="Controlador?menu=TipoArticulo&accion=Listar" target="miContenedor">Tipo Articulo</a>
                    </li>
                </ul>
                <div class="btn-group">
                    <button type="button" class="btn btn-danger dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        ${usuario.getNombre()}
                    </button>
                    <div class="dropdown-menu">
                        <a class="dropdown-item" href="#"><i class="fas fa-user"></i></a>
                        <a class="dropdown-item" href="#">${usuario.getDocumento()}</a>
                        <a class="dropdown-item" href="#">${usuario.getCorreo()}</a>
                        <div class="dropdown-divider"></div>
                        <form class="dropdown-item" method="POST" action="Validar">
                            <button class="btn btn-danger center-block" type="submit" name="accion" value="Salir">Cerrar Sesion</button>
                        </form>
                    </div>
                </div>
            </div>
        </nav>
    
        <div class="row">
            <div class="card col-md-4">
                <div class="card-body">
                    <h5 class="card-title">Articulos</h5>
                    <h6 class="card-subtitle mb-2 text-muted">En este panel podras gestionar los Articulos</h6>
                    <div>
                        <form action="Controlador?menu=Articulos" method="POST">
                        
                            <div class="form-group">
                                <label>Nombre</label>
                                <input type="text" class="form-control" name="txtnombre" value="${articuloSeleccionado.getNombre()}">
                            </div>
                            
                            <div class="form-group">
                                <label>Tipo Articulo</label>
                                <input type="text" class="form-control" name="txttipo_articulo" value="${articuloSeleccionado.getTa().getDescripcion()}">
                            </div>
                            
                            <div class="form-group">
                                <label>Stock</label>
                                <input type="text" class="form-control" name="txtstock" value="${articuloSeleccionado.getStock()}">
                            </div>
                            <div class="form-group">
                                <label>Precio</label>
                                <input type="text" class="form-control" name="txtprecio" value="${articuloSeleccionado.getPrecio()}">
                            </div>
                         
       

                            <input type="submit" class="btn btn-primary" name="accion" value="Agregar" >
                            <input type="submit" class="btn btn-success" name="accion" value="Actualizar" >
                        </form>
                    </div>
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
                                    <a class="btn btn-warning" href="Controlador?menu=Articulos&accion=Cargar&id=${articulo.getId()}">Editar</a>
                                    <a class="btn btn-danger" href="Controlador?menu=Articulos&accion=Eliminar&id=${articulo.getId()}">Eliminar</a>
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