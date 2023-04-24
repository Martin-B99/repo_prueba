package controlador;

import java.io.IOException;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Scanner;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

import org.apache.jasper.tagplugins.jstl.core.ForEach;

import modelo.Articulo;
import modelo.ArticuloDAO;
import modelo.ArticuloPedido;
import modelo.ArticuloPedidoDAO;
import modelo.Cliente;
import modelo.ClienteDAO;
import modelo.Pedido;
import modelo.PedidoDAO;
import modelo.TipoArticuloDAO;
import modelo.Tipo_Articulo;

/**
 * Servlet implementation class Controlador
 */
@WebServlet("/Controlador")
public class Controlador extends HttpServlet {
	private static final long serialVersionUID = 1L;

	Cliente cliente = new Cliente();
	ClienteDAO clienteDAO = new ClienteDAO();

	Articulo articulo = new Articulo();
	ArticuloDAO articuloDAO = new ArticuloDAO();
	
	Tipo_Articulo tipoArt = new Tipo_Articulo();
	TipoArticuloDAO tipoArtDAO = new TipoArticuloDAO();
	
	Pedido pedido = new Pedido();
	PedidoDAO pedidoDAO = new PedidoDAO();
	
	ArticuloPedido articulopedido = new ArticuloPedido();
	ArticuloPedidoDAO articulopedidoDAO = new ArticuloPedidoDAO();
	
	
	List<ArticuloPedido> articulos_pedidos = new ArrayList<ArticuloPedido>();
	List<Articulo> listaArticulos = new ArrayList<Articulo>();
	ArrayList<Pedido> pedidos = new ArrayList<Pedido>();

	int idCliente;
	int idArticulo;
	int idTipo;
	String NombreCliente;
	int id;
	double totalpedido;
	
	String nombre;
	double precio;
	double cantidad;
	double subtotal;
	String total;
	int idPedido;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Controlador() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("Prueba de Git Bash");
		String menu = request.getParameter("menu");
		String accion = request.getParameter("accion");
		if (menu.equals("Principal")) {
			request.getRequestDispatcher("Principal.jsp").forward(request, response);
		}
		
		if (menu.equals("Articulos")) {
			switch (accion) {
			case "Listar":
				List lista= articuloDAO.Listar();
				request.setAttribute("articulo", lista);
				break;
			
		
			case "Agregar":
				String nombre = request.getParameter("txtnombre"); 
				String descripcion = request.getParameter("txttipo_articulo");
				String stock = request.getParameter("txtstock"); 
				String precio = request.getParameter("txtprecio");
				tipoArt = tipoArtDAO.buscarTipo(descripcion);
				articulo.setNombre(nombre);
				articulo.setStock(stock);
				articulo.setPrecio(precio);
				articulo.setTa(tipoArt);
				articuloDAO.Agregar(articulo);
				request.getRequestDispatcher("Controlador?menu=Articulos&accion=Listar").forward(request, response);
		  
		  	break;
		  	
			case "Actualizar":
				Articulo articulo1 = new Articulo();
				Tipo_Articulo tipoArt1 = new Tipo_Articulo();
				String nombreUpdate = request.getParameter("txtnombre"); 
				String descripcionUpdate = request.getParameter("txttipo_articulo");
				String stockUpdate = request.getParameter("txtstock"); 
				String precioUpdate = request.getParameter("txtprecio"); 
				tipoArt1 = tipoArtDAO.buscarTipo(descripcionUpdate);
				articulo1.setNombre(nombreUpdate);
				articulo1.setStock(stockUpdate);
				articulo1.setPrecio(precioUpdate);
				articulo1.setTa(tipoArt1);
				articulo1.setId(idArticulo);
				articuloDAO.Actualizar(articulo1);
				request.getRequestDispatcher("Controlador?menu=Articulos&accion=Listar").forward(request, response);

				break;
				
			case "Cargar":

				idArticulo = Integer.parseInt(request.getParameter("id"));
				Articulo articulo = articuloDAO.ListarPorId(idArticulo);
				request.setAttribute("articuloSeleccionado", articulo);
				request.getRequestDispatcher("Controlador?menu=Articulos&accion=Listar").forward(request, response);

				break;
			case "Eliminar":

				idArticulo = Integer.parseInt(request.getParameter("id"));
				articulopedidoDAO.EliminarArticuloPedido2(idArticulo);
				articuloDAO.Eliminar(idArticulo);
				request.getRequestDispatcher("Controlador?menu=Articulos&accion=Listar").forward(request, response);

				break;
				
			case "Filtrar":
				tipoArt = new Tipo_Articulo();
				String filtro = request.getParameter("filtro");
				if (filtro.equals("Todos")) {
					List listaa= articuloDAO.Listar();
					request.setAttribute("articulo", listaa);
					
				}else {
				tipoArt = tipoArtDAO.buscarTipo(filtro);
				listaArticulos = articuloDAO.ListarPorTipo(tipoArt.getId());
				System.out.println(listaArticulos);
				request.setAttribute("articulo", listaArticulos);
				break;
			}
			}
			
			
			request.getRequestDispatcher("Articulos.jsp").forward(request, response);
		}

		if (menu.equals("Clientes")) {

			switch (accion) {
			case "Listar":
				List lista = clienteDAO.Listar();
				request.setAttribute("cliente", lista);

				break;

			case "Agregar":

				String nombre = request.getParameter("txtnombre");
				String telefono = request.getParameter("txttelefono");
				String direccion = request.getParameter("txtdireccion");
				cliente.setNombre(nombre);
				cliente.setTelefono(telefono);
				cliente.setDireccion(direccion);

				clienteDAO.Agregar(cliente);
				request.getRequestDispatcher("Controlador?menu=Clientes&accion=Listar").forward(request, response);

				break;

			case "Actualizar":
				Cliente cliente1 = new Cliente();
				String nombreUpdate = request.getParameter("txtnombre");
				String telefonoUpdate = request.getParameter("txttelefono");
				String direccionUpdate = request.getParameter("txtdireccion");
				cliente1.setNombre(nombreUpdate);
				cliente1.setTelefono(telefonoUpdate);
				cliente1.setDireccion(direccionUpdate);
				cliente1.setId(idCliente);
				clienteDAO.Actualizar(cliente1);
				request.getRequestDispatcher("Controlador?menu=Clientes&accion=Listar").forward(request, response);

				break;
			case "Cargar":

				idCliente = Integer.parseInt(request.getParameter("id"));
				Cliente cliente = clienteDAO.ListarPorId(idCliente);
				request.setAttribute("clienteSeleccionado", cliente);
				request.getRequestDispatcher("Controlador?menu=Clientes&accion=Listar").forward(request, response);

				break;
			case "Eliminar":

				idCliente = Integer.parseInt(request.getParameter("id"));
				pedidos = pedidoDAO.buscarPedidoCliente(idCliente);
				articulopedidoDAO.EliminarArticuloPedidoCliente(pedidos);
				pedidoDAO.EliminarClientePedido(pedidos);
				clienteDAO.Eliminar(idCliente);
				request.getRequestDispatcher("Controlador?menu=Clientes&accion=Listar").forward(request, response);

				break;
			}

			request.getRequestDispatcher("Clientes.jsp").forward(request, response);
		}
		
		  if (menu.equals("TipoArticulo")) {
			  switch (accion) {
				case "Listar":
					List lista = tipoArtDAO.Listar();
					request.setAttribute("tipo_articulo", lista);
					
					break;
					
				case "Agregar":

					String descripcion = request.getParameter("txtdescripcion");
					if (descripcion.isEmpty()) {
						JOptionPane.showMessageDialog(null, "Error de Datos",
		                		  "Algo Anda Mal", JOptionPane.WARNING_MESSAGE);					
					}else {
					tipoArt.setDescripcion(descripcion);

					tipoArtDAO.Agregar(tipoArt);
					}
					request.getRequestDispatcher("Controlador?menu=TipoArticulo&accion=Listar").forward(request, response);

					break;
				case "Actualizar":
					Tipo_Articulo tipo_art1 = new Tipo_Articulo();
					String descripcionUpdate = request.getParameter("txtdescripcion");
					tipo_art1.setDescripcion(descripcionUpdate);
					tipo_art1.setId(idTipo);
					tipoArtDAO.Actualizar(tipo_art1);
					request.getRequestDispatcher("Controlador?menu=TipoArticulo&accion=Listar").forward(request, response);

					break;
				case "Cargar":

					idTipo = Integer.parseInt(request.getParameter("id"));
					Tipo_Articulo tipo_articulo = tipoArtDAO.ListarPorId(idTipo);
					request.setAttribute("tipoArticuloSeleccionado", tipo_articulo);
					request.getRequestDispatcher("Controlador?menu=TipoArticulo&accion=Listar").forward(request, response);
					break;
					
				case "Eliminar":

					idTipo = Integer.parseInt(request.getParameter("id"));
					articuloDAO.EliminarTipo(idTipo); 
					tipoArtDAO.Eliminar(idTipo);
					request.getRequestDispatcher("Controlador?menu=TipoArticulo&accion=Listar").forward(request, response);

					break;
			  }
		  request.getRequestDispatcher("TipoArticulo.jsp").forward(request, response); 
			  }
		  
		  if (menu.equals("Pedidos")) {
			  
				
				switch (accion) {
				  
				  case "BuscarCliente":
					  try {
						  idCliente = Integer.parseInt(request.getParameter("txtidcliente"));
		                  cliente = clienteDAO.buscarClienteId(idCliente);
		                  
					} catch (NumberFormatException nfe) {
					                 
		                JOptionPane.showMessageDialog(null, "Id Invalido",
		                		  "Algo Anda Mal", JOptionPane.WARNING_MESSAGE);
					}
					  request.setAttribute("cliente", cliente);
	                  break;
	                  
	              
				  case "BuscarProducto":
	                  
					  try {
					  idArticulo = Integer.parseInt(request.getParameter("txtidproducto"));
	                  articulo = articuloDAO.buscarArticuloId(idArticulo);
	                  request.setAttribute("cliente", cliente);
	                  request.setAttribute("articulo", articulo);	                  
	                  request.setAttribute("lista_articulos", articulos_pedidos);
	                  request.setAttribute("totalapagar", total);
	                  break;
	                  
					  } catch (NumberFormatException ed) {
					  JOptionPane.showMessageDialog(null, "Error de Datos",
	                		  "Algo Anda Mal", JOptionPane.WARNING_MESSAGE);
					  			
					}
					  request.setAttribute("cliente", cliente);    	                  
	                  request.setAttribute("lista_articulos", articulos_pedidos);
	                  request.setAttribute("totalapagar", total);
					  request.getRequestDispatcher("Pedidos.jsp").forward(request, response);
					  break;
				 
				  case "AgregarProducto":	
					  
					  int existente = 0;
					  try {
					  	
					  	request.setAttribute("cliente", cliente);
	                    totalpedido = 0;
	                    articulopedido = new ArticuloPedido(); 
	                    request.setAttribute("cliente", cliente);
		                request.setAttribute("lista_articulos", articulos_pedidos);
	                    idArticulo = Integer.parseInt(request.getParameter("txtidproducto"));
	                    nombre = request.getParameter("txtnombreproducto");
	                    precio =   Double.parseDouble(request.getParameter("txtprecioproducto"));
	                    cantidad = Double.parseDouble(request.getParameter("cantidadproducto"));
	                    if (cantidad > Double.parseDouble(articulo.getStock())) {                    	
	                    	JOptionPane.showMessageDialog(null, "Stock Insuficiente");
	                    	id--;
							break;
						}
					  
                    
	                    id++;
	                    subtotal = precio * cantidad;
	                    articulopedido.setId(id);
	                    articulopedido.setNombre(nombre);
	                    articulopedido.setCantidad(cantidad);
	                    articulopedido.setPrecio(precio);
	                    articulopedido.setSubtotal(subtotal);
	                    articulopedido.setId(idArticulo);	      
	                    
					 
	                    if (articulos_pedidos.size() == 0) {
	                    	articulos_pedidos.add(articulopedido);	
	                    } else {	
	                    	for (int i= 0; i < articulos_pedidos.size();i++) {
	                    		if (articulos_pedidos.get(i).getNombre().equals(articulopedido.getNombre())) {
	                    			existente = 1;	                   
	                    		}
	                    	}
	                    	if (existente == 1) {
	                    		JOptionPane.showMessageDialog(null, "Articulo Existente");             
	                    	} else {
	                    		articulos_pedidos.add(articulopedido);	
	                    	}
	                    }	
	                    request.setAttribute("lista_articulos", articulos_pedidos);                
	                    for (int i = 0; i < articulos_pedidos.size(); i++) {
	                    	totalpedido += articulos_pedidos.get(i).getSubtotal();
	                    }
	                    NumberFormat formatoNumero1 = NumberFormat.getNumberInstance();
	                    total = formatoNumero1.format(totalpedido);	                    
	                    request.setAttribute("totalapagar", total);
	                    	break;
	                    	
					  } catch (NumberFormatException e2) {
						  JOptionPane.showMessageDialog(null, "Error de Datos",
		                		  "Algo Anda Mal", JOptionPane.WARNING_MESSAGE);
						  break;
						}
	              
				  case "Eliminar":
					  	int idB = 0;
					  	idArticulo = Integer.parseInt(request.getParameter("id"));
					  	articulo = articuloDAO.buscarArticuloId(idArticulo);					  	
					  	for (int i = 0; i < articulos_pedidos.size(); i ++) {
					  		if (articulos_pedidos.get(i).getId() == articulo.getId()) {
					  			idB = i;
							}
							
						}				  	
					  	articulos_pedidos.remove(idB);		
					  	request.setAttribute("cliente", cliente);
		                request.setAttribute("lista_articulos", articulos_pedidos);	       
		                request.setAttribute("totalapagar", total);
					  	break;
					  	
				  case "Actualizar":
					  try {
					  request.setAttribute("cliente", cliente);
	                  request.setAttribute("articulo", articulo);	                  
	                  request.setAttribute("lista_articulos", articulos_pedidos);
					  ArticuloPedido articulopedidoU = new ArticuloPedido();
					  int idE = 0;					                    
	                  idArticulo = Integer.parseInt(request.getParameter("txtidproducto"));
	                  nombre = request.getParameter("txtnombreproducto");
	                  precio =   Double.parseDouble(request.getParameter("txtprecioproducto"));
	                  cantidad = Double.parseDouble(request.getParameter("cantidadproducto"));
					  articulo = articuloDAO.buscarArticuloId(idArticulo);
					  if (cantidad > Double.parseDouble(articulo.getStock())) {                    	
	                    	JOptionPane.showMessageDialog(null, "Stock Insuficiente");
	                    	id--;
	                    	break;
					  }
					  for (int i = 0; i < articulos_pedidos.size(); i ++) {
						  if (articulos_pedidos.get(i).getId() == articulo.getId()) {
							  idE = i;
						  }
					  }
					  id++;
	                  subtotal = precio * cantidad;
	                  articulopedidoU.setId(id);
	                  articulopedidoU.setNombre(nombre);
	                  articulopedidoU.setCantidad(cantidad);
	                  articulopedidoU.setPrecio(precio);
	                  articulopedidoU.setSubtotal(subtotal);
	                  articulopedidoU.setId(idArticulo);
					  articulos_pedidos.set(idE, articulopedidoU);	 
					  request.setAttribute("totalapagar", total);
	                  break;
					  } catch (NumberFormatException e2) {
						  JOptionPane.showMessageDialog(null, "Error de Datos",
		                		  "Algo Anda Mal", JOptionPane.WARNING_MESSAGE);
						  break;
						}
	                  
				  case "Cargar":				 
					  idArticulo = Integer.parseInt(request.getParameter("id"));
					  articulo = articuloDAO.buscarArticuloId(idArticulo);
					  request.setAttribute("cliente", cliente);
					  request.setAttribute("articulo", articulo);
					  request.setAttribute("lista_articulos", articulos_pedidos);
					  request.setAttribute("totalapagar", total);
					  
	                
				  }
				
				
					
		  		
					request.getRequestDispatcher("Pedidos.jsp").forward(request, response);
				}
		 
		  
		  
		  if (menu.equals("GenerarVenta")) {
			  
			  switch (accion) {  
			  case "GenerarVenta":
				  int idPedido;
				  pedidoDAO.AgregarPedido(cliente, totalpedido);
				  idPedido = pedidoDAO.DevolverIdPedido();
				  articulopedidoDAO.AgregarArticulos(articulos_pedidos,idPedido);
				  articuloDAO.ActualizarStock(articulos_pedidos);
				  JOptionPane.showMessageDialog(null, "Venta Generada Correctamente");
				  request.setAttribute("cliente", cliente);
                  request.setAttribute("articulo", articulo);	                  
                  request.setAttribute("lista_articulos", articulos_pedidos);
                  break;
                 
              
			  case "NuevaVenta":
				  articulos_pedidos.removeAll(articulos_pedidos);
				  request.getRequestDispatcher("Pedidos.jsp").forward(request, response);
		  }
			request.getRequestDispatcher("Pedidos.jsp").forward(request, response);
		
		  }
		  
		  
		  
		  
		  if (menu.equals("Ventas")) {
				switch (accion) {
				case "Listar":
					List lista= pedidoDAO.Listar();
					request.setAttribute("pedido", lista);

					break;
			
					
				case "Cargar":

					idPedido = Integer.parseInt(request.getParameter("id"));
					Pedido pedidoseleccionado = pedidoDAO.buscarPedidoId(idPedido);
					request.setAttribute("pedidoseleccionado", pedidoseleccionado);
					request.getRequestDispatcher("Controlador?menu=Ventas&accion=Listar").forward(request, response);
					

					break;
					
				case "Actualizar":
					
					pedido = new Pedido();				
					String condicion = request.getParameter("txtcondicion");
					pedido = pedidoDAO.buscarPedidoId(idPedido);
					if (condicion.equals("Pagado")|| condicion.equals("pagado") ) {
						pedido.setCondicion(true);
					} else {
						pedido.setCondicion(false);
					}
	
					pedidoDAO.Actualizar(pedido);
				
					
					request.getRequestDispatcher("Controlador?menu=Ventas&accion=Listar").forward(request, response);
					
					break;
					
		 
				
				case "Eliminar":
					try {
						idPedido = Integer.parseInt(request.getParameter("id")); 
						articulopedidoDAO.EliminarArticuloPedido(idPedido);
						pedidoDAO.Eliminar(idPedido);
						request.getRequestDispatcher("Controlador?menu=Ventas&accion=Listar").forward(request, response);
						
					} catch (NumberFormatException ea) {
						JOptionPane.showMessageDialog(null, "No Hay Pedido Seleccionado",
		                		  "Algo Anda Mal", JOptionPane.WARNING_MESSAGE);
						
					
						request.getRequestDispatcher("Controlador?menu=Ventas&accion=Listar").forward(request, response);
						
					}
					break;
					
				}
							
				
				
				
				request.getRequestDispatcher("Ventas.jsp").forward(request, response);
		  }		
		  
//---------------------------------------------------------------------------------------------------------------
//################################################################################################################
//#################################################################################################################
//#################################################################################################################
//#################################################################################################################
//#################################################################################################################
//#################################################################################################################
//#################################################################################################################
		  
		  else if(menu.equals("PrincipalVendedor")) {
				request.getRequestDispatcher("PrincipalVendedor.jsp").forward(request, response);
		  }
			
		  
		  if (menu.equals("ArticulosVendedor")) {
				switch (accion) {
				case "Listar":
					List lista= articuloDAO.Listar();
					request.setAttribute("articulo", lista);

					break;
				
			
				case "Agregar":
					String nombre = request.getParameter("txtnombre"); 
					String descripcion = request.getParameter("txttipo_articulo");
					String stock = request.getParameter("txtstock"); 
					String precio = request.getParameter("txtprecio");
					tipoArt = tipoArtDAO.buscarTipo(descripcion);
					articulo.setNombre(nombre);
					articulo.setStock(stock);
					articulo.setPrecio(precio);
					articulo.setTa(tipoArt);
					articuloDAO.Agregar(articulo);
					request.getRequestDispatcher("Controlador?menu=ArticulosVendedor&accion=Listar").forward(request, response);
			  
			  	break;
			  	
				case "Actualizar":
					Articulo articulo1 = new Articulo();
					Tipo_Articulo tipoArt1 = new Tipo_Articulo();
					String nombreUpdate = request.getParameter("txtnombre"); 
					String descripcionUpdate = request.getParameter("txttipo_articulo");
					String stockUpdate = request.getParameter("txtstock"); 
					String precioUpdate = request.getParameter("txtprecio"); 
					tipoArt1 = tipoArtDAO.buscarTipo(descripcionUpdate);
					articulo1.setNombre(nombreUpdate);
					articulo1.setStock(stockUpdate);
					articulo1.setPrecio(precioUpdate);
					articulo1.setTa(tipoArt1);
					articulo1.setId(idArticulo);
					articuloDAO.Actualizar(articulo1);
					request.getRequestDispatcher("Controlador?menu=ArticulosVendedor&accion=Listar").forward(request, response);

					break;
					
				case "Cargar":

					idArticulo = Integer.parseInt(request.getParameter("id"));
					Articulo articulo = articuloDAO.ListarPorId(idArticulo);
					request.setAttribute("articuloSeleccionado", articulo);
					request.getRequestDispatcher("Controlador?menu=ArticulosVendedor&accion=Listar").forward(request, response);

					break;
				case "Eliminar":

					idArticulo = Integer.parseInt(request.getParameter("id"));
					articuloDAO.Eliminar(idArticulo);
					request.getRequestDispatcher("Controlador?menu=ArticulosVendedor&accion=Listar").forward(request, response);

					break;
				}
				
				request.getRequestDispatcher("ArticulosVendedor.jsp").forward(request, response);
			}

			if (menu.equals("ClientesVendedor")) {

				switch (accion) {
				case "Listar":
					List lista = clienteDAO.Listar();
					request.setAttribute("cliente", lista);

					break;

				case "Agregar":

					String nombre = request.getParameter("txtnombre");
					String telefono = request.getParameter("txttelefono");
					String direccion = request.getParameter("txtdireccion");
					cliente.setNombre(nombre);
					cliente.setTelefono(telefono);
					cliente.setDireccion(direccion);

					clienteDAO.Agregar(cliente);
					request.getRequestDispatcher("Controlador?menu=ClientesVendedor&accion=Listar").forward(request, response);

					break;

				case "Actualizar":
					Cliente cliente1 = new Cliente();
					String nombreUpdate = request.getParameter("txtnombre");
					String telefonoUpdate = request.getParameter("txttelefono");
					String direccionUpdate = request.getParameter("txtdireccion");
					cliente1.setNombre(nombreUpdate);
					cliente1.setTelefono(telefonoUpdate);
					cliente1.setDireccion(direccionUpdate);
					cliente1.setId(idCliente);
					clienteDAO.Actualizar(cliente1);
					request.getRequestDispatcher("Controlador?menu=ClientesVendedor&accion=Listar").forward(request, response);

					break;
				case "Cargar":

					idCliente = Integer.parseInt(request.getParameter("id"));
					Cliente cliente = clienteDAO.ListarPorId(idCliente);
					request.setAttribute("clienteSeleccionado", cliente);
					request.getRequestDispatcher("Controlador?menu=ClientesVendedor&accion=Listar").forward(request, response);

					break;
				case "Eliminar":

					idCliente = Integer.parseInt(request.getParameter("id"));
					clienteDAO.Eliminar(idCliente);
					request.getRequestDispatcher("Controlador?menu=ClientesVendedor&accion=Listar").forward(request, response);

					break;
				}

				request.getRequestDispatcher("ClientesVendedor.jsp").forward(request, response);
			}
			
			  if (menu.equals("TipoArticuloVendedor")) {
				  switch (accion) {
					case "Listar":
						List lista = tipoArtDAO.Listar();
						request.setAttribute("tipo_articulo", lista);
						
						break;
						
					case "Agregar":

						String descripcion = request.getParameter("txtdescripcion");
						tipoArt.setDescripcion(descripcion);

						tipoArtDAO.Agregar(tipoArt);
						request.getRequestDispatcher("Controlador?menu=TipoArticuloVendedor&accion=Listar").forward(request, response);

						break;
					case "Actualizar":
						Tipo_Articulo tipo_art1 = new Tipo_Articulo();
						String descripcionUpdate = request.getParameter("txtdescripcion");
						tipo_art1.setDescripcion(descripcionUpdate);
						tipo_art1.setId(idTipo);
						tipoArtDAO.Actualizar(tipo_art1);
						request.getRequestDispatcher("Controlador?menu=TipoArticuloVendedor&accion=Listar").forward(request, response);

						break;
					case "Cargar":

						idPedido = Integer.parseInt(request.getParameter("id_pedido"));
						Tipo_Articulo tipo_articulo = tipoArtDAO.ListarPorId(idTipo);
						request.setAttribute("tipoArticuloSeleccionado", tipo_articulo);
						request.getRequestDispatcher("Controlador?menu=TipoArticuloVendedor&accion=Listar").forward(request, response);
						break;
						
					case "Eliminar":

						idTipo = Integer.parseInt(request.getParameter("id"));
						articuloDAO.EliminarTipo(idTipo); 
						tipoArtDAO.Eliminar(idTipo);
						request.getRequestDispatcher("Controlador?menu=TipoArticuloVendedor&accion=Listar").forward(request, response);

						break;
				  }
			  request.getRequestDispatcher("TipoArticuloVendedor.jsp").forward(request, response); 
				  }
			  
		
			
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
