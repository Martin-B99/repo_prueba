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
                    <h6 class="card-subtitle mb-2 text-muted" align="center">En este panel podras Gestionar el pago de las Ventas</h6>
                     <center>
  						<img alt="logo" src="ventas.png"  width="200" height="200" >
   					</center>
                  <div>
                        <form action="Controlador?menu=Ventas" method="POST">
                        
                            <div class="form-group">
                                <label>Id Pedido</label>
                                <input type="text" class="form-control" name="txtidpedido" value="${pedidoseleccionado.getId_pedido()}" readonly >
                            </div>
                            
                            <div class="form-group">
                                <label>Cliente</label>
                                <input type="text" class="form-control" name="txtcliente" value="${pedidoseleccionado.getCliente().getNombre()}" readonly >
                            </div>
                            
                            <div class="form-group">
                                <label>Total</label>
                                <input type="text" class="form-control" name="txttotal" value="${pedidoseleccionado.getTotal()}" readonly>
                            </div>
                            <div class="form-group">
 							  <label>Condición de Pago</label>
							  <select class="form-control" name="txtcondicion">
							    <option value="pagado" ${pedidoseleccionado.isCondicion() ? 'selected' : ''}>Pagado</option>
							    <option value="no_pagado" ${!pedidoseleccionado.isCondicion() ? 'selected' : ''}>No Pagado</option>
							  </select>
							</div>

			
							<datalist id="pago">
                            	<option value="Pagado"></option>
                            	<option value="No Pagado"></option>                           
                            </datalist>
                         
       

                            <input type="submit" class="btn btn-primary" name="accion" value="Actualizar" >
                          
                        </form>
                    </div>
                </div>
            </div>
         
			
            <div class="col-md-8">
                <table class="table">
                    <thead class="thead-dark">
                        <tr>
                        	<th scope="col">Id</th>
                           	<th scope="col">Cliente</th>
                            <th scope="col">Total</th>
                            <th scope="col">Condición de Pago</th>
                            
                         
                            
                            
                        </tr>
                    </thead>
                   
                    <tbody>
                    
                        <c:forEach var="pedido" items="${pedido}">

                            <tr>
                            	<td>${pedido.getId_pedido()}</td>
 								<td>${pedido.getCliente().getNombre()}</td>
                                <td>${pedido.getTotal()}</td>                               
                                <td>${pedido.condicion ? '‎ ‎‎  ‎ ‎‎ ‎ ‎ ‎ ‎ ‎‎ Pagado' : '‎ ‎ ‎ ‎ ‎ ‎ ‎ No Pagado'}</td>
                               
              
                                <td>
                              
                                
   
                          <a class="btn btn-success" href="Controlador?menu=Ventas&accion=Cargar&id=${pedido.getId_pedido()}">Pago</a>
                              <a class="btn btn-secondary" href="Controlador?menu=Ventas&accion=Eliminar&id=${pedido.getId_pedido()}">Eliminar</a>
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