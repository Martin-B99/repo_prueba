<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
         <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Bootstrap CSS -->
      <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">

        <title>Sistema de ventas</title>
         <link rel="icon" type="image" href="distribuidora_logo.png">
        <style>
            @media print{
                .seccion1, .btn, .columna{
                    display:none;
                }
            }
        </style>
    </head>
    <body>
        <div class="row">
            <div class="col-md-5 seccion1">
                <div class="card">
                    <h5 class="card-header">Datos cliente</h5>
                    <div class="card-body">
                        <form method="post" action="Controlador?menu=Pedidos">
                            <div class="row">
                                <div class="col-md-4 d-flex form-group">
                                    <input type="text" name="txtidcliente" class="form-control" placeholder="Id"  value="${cliente.getId()}">
                                    <input type="submit" name="accion" value="BuscarCliente" class="btn btn-outline-dark"> 
                                </div>
                                <div class="col-md-4 d-flex form-group">
                                 	<input type="text" name="txtnombrecliente" class="form-control" placeholder="Nombre"  value="${cliente.getNombre()}">
                                 </div>
                                 <div class="col-md-4 d-flex form-group">
                                 	<input type="text" name="txttelefono" class="form-control" placeholder="Telefono"  value="${cliente.getTelefono()}">
                                 </div>
                                 <div class="col-md-4 d-flex form-group">
                                 	<input type="text" name="txtdireccion" class="form-control" placeholder="Direccion"  value="${cliente.getDireccion()}">
                                 </div>
                            </div>
                            <div class="row"></div>

                        </form>
                    </div>
                </div>
                <div class="card">
                    <h5 class="card-header">Datos producto</h5>
                    <div class="card-body">
                        <form action="Controlador?menu=Pedidos" method="post">
                            <div class="row">
                                <div class="5 d-flex form-group">
                                    <input type="number" name="txtidproducto" class="form-control" placeholder="Id" value="${articulo.getId()}">
                                    <input type="submit" name="accion" value="BuscarProducto" class="btn btn-outline-dark">
                                </div>
                                <div class="col-md-6 d-flex form-group">
                                    <input type="text" name="txtnombreproducto" class="form-control" placeholder="Nombre Articulo" value="${articulo.getNombre()}">
                                </div>
                                <div class="col-md-4 d-flex form-group">
                                    <input type="text" name="txtprecioproducto" class="form-control" placeholder="$ 0000.00" value="${articulo.getPrecio()}">
                                </div>
                                <div class="col-md-8 d-flex form-group">
                                    <input type="number" value="1" name="cantidadproducto" class="form-control" placeholder="Cantidad">
                                </div>
                            </div>
                            <input type="submit" class="btn btn-primary" name="accion" value="AgregarProducto" >
                            <input type="submit" class="btn btn-success" name="accion" value="Actualizar" >
                            <div class="row"></div>

                        </form>
                        <center>
  						<img alt="logo" src="pedido.png"  width="200" height="200" >
   					</center>
                    </div>
                </div>
            </div>
            <div class="col-md-7">
                <div class="card">
                    <div class="card-body">
                         <table class="table">
                         
                     
                      
                         
                         
                    <thead class="thead-dark">
                        <tr>
                          
                            <th scope="col">Codigo</th>
                            <th scope="col">Producto</th>
                            <th scope="col">Precio</th>
                            <th scope="col">Cantidad</th>
                            <th scope="col">Total</th>
                            <th scope="col" class="columna">Acciones</th>
                        </tr>
                    </thead>
                    <tbody> 
                  
                   <c:forEach var="lista_articulos" items="${lista_articulos}">
                        <tr>
                            
                            <td>${lista_articulos.getId()}</td>
                            <td>${lista_articulos.getNombre()}</td>
                            <td>$ ${lista_articulos.getPrecio()}</td>
                            <td>${lista_articulos.getCantidad()}</td>
                            <td>$ ${lista_articulos.getSubtotal()}</td>
                            <td class="columna">
                                <a class="btn btn-warning" href="Controlador?menu=Pedidos&accion=Eliminar&id=${lista_articulos.getId()}">Eliminar</a>
                                <a class="btn btn-danger" href="Controlador?menu=Pedidos&accion=Cargar&id=${lista_articulos.getId()}">Editar</a>
                            </td>
                        </tr>
                        </c:forEach> 
                      
                   </tbody>
                </table>
                    </div>
                    <div class="card-footer d-flex">
                        <div class="col-md-8 text-center">
                            <a class="btn btn-success" onclick="print()" href="Controlador?menu=GenerarVenta&accion=GenerarVenta">Generar Venta</a>
                            <a class="btn btn-danger" href="Controlador?menu=GenerarVenta&accion=NuevaVenta">Nueva Venta</a>
                          
                        </div>
                        <div class="col-md-4">
                            <input type=text" name="txttotalapagar" class="form-control" placeholder="$ 00.000.00" disabled="disabled" value="${totalapagar}">
                         </div>
                    </div>
                    
                </div>

            </div>
        </div>

        <!-- Optional JavaScript; choose one of the two! -->

        <!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>

        <!-- Option 2: jQuery, Popper.js, and Bootstrap JS
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s" crossorigin="anonymous"></script>
        -->
    </body>
</html>