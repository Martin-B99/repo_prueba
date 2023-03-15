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
        <style>
            @media print{
                .seccion1, .btn, .columna{
                    display:none;
                }
            }
        </style>
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
            <div class="col-md-5 seccion1">
                <div class="card">
                    <h5 class="card-header">Datos cliente</h5>
                    <div class="card-body">
                        <form method="post" action="Controlador?menu=Pedidos">
                            <div class="row">
                                <div class="col-md-8 d-flex">
                                    <input type="text" name="txtnombrecliente" class="form-control" placeholder="Nombre cliente"  value="${cliente.getNombre()}">
                                    <input type="submit" name="accion" value="BuscarCliente" class="btn btn-outline-dark">
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
                                <div class="col-md-4 d-flex form-group">
                                    <input type="number" name="txtidproducto" class="form-control" placeholder="Codigo Producto" value="${articulo.getId()}">
                                    <input type="submit" name="accion" value="BuscarProducto" class="btn btn-outline-dark">
                                </div>
                                <div class="col-md-8 d-flex form-group">
                                    <input type="text" name="txtnombreproducto" class="form-control" placeholder="Nombre Producto" value="${articulo.getNombre()}">
                                </div>
                                <div class="col-md-4 d-flex form-group">
                                    <input type="text" name="txtprecioproducto" class="form-control" placeholder="$ 0000.00" value="${articulo.getPrecio()}">
                                </div>
                                <div class="col-md-8 d-flex form-group">
                                    <input type="number" value="1" name="cantidadproducto" class="form-control" placeholder="Cantidad">
                                </div>
                            </div>
                            <input type="submit" name="accion" value="AgregarProducto" class="btn btn-outline-primary col text-center">
                            <div class="row"></div>

                        </form>
                    </div>
                </div>
            </div>
            <div class="col-md-7">
                <div class="card">
                    <div class="card-header">
                        <div class="form-group row">
                             <label class="col-sm-2 col-form-label">Numero de factura</label>
                             <input class="form-control col-md-4" type="text" name="txtnumerofactura" value="${numerofactura}">
                        </div>
                       
                    </div>
                    <div class="card-body">
                         <table class="table">
                    <thead class="thead-dark">
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">Codigo</th>
                            <th scope="col">Producto</th>
                            <th scope="col">Precio</th>
                            <th scope="col">Cantidad</th>
                            <th scope="col">Total</th>
                            <th scope="col" class="columna">Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                   
                       <c:forEach var="lista" items="${listaventas}">
                        <tr>
                            <th scope="row" style="width: 30px;">${lista.getItem()}</th>
                            <td style="width: 30px;">${lista.getIdProducto()}</td>
                            <td style="width: 350px;">${lista.getDescripcionProducto()}</td>
                            <td>$ ${lista.getPrecio()}</td>
                            <td style="width: 30px;">${lista.getCantidad()}</td>
                            <td>$ ${lista.getSubtotal()}</td>
                            <td class="columna">
                                <a class="btn btn-danger">Eliminar</a>
                                <a class="btn btn-warning">Editar</a>
                            </td>
                        </tr>
                        </c:forEach>

                       </tbody>
                </table>
                    </div>
                    <div class="card-footer d-flex">
                        <div class="col-md-8 text-center">
                            <a class="btn btn-success" onclick="print()" href="Controlador?menu=Ventas&accion=GenerarVenta">Generar Venta</a>
                            <a class="btn btn-danger" href="Controlador?menu=Ventas&accion=NuevaVenta">Nueva Venta</a>
                          
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