package controlador;

import java.awt.event.WindowEvent;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

import modelo.Excepcion;
import modelo.Usuario;
import modelo.UsuarioDAO;

/**
 * Servlet implementation class Validar
 */
@WebServlet("/Validar")
public class Validar extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Validar() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    
    
    
    Usuario usuario = new Usuario();
    UsuarioDAO usuarioDAO = new UsuarioDAO();
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		  String accion = request.getParameter("accion");
	        if (accion.equalsIgnoreCase("Ingresar")) {
	        	try {
	        		
	        	
	        	try {
	        		int documento = Integer.parseInt(request.getParameter("txtusuario"));
		            String pass = request.getParameter("txtpassword");
		            usuario = usuarioDAO.Validar(documento, pass);
		            System.out.print("dato"+usuario.getNombre());
		            if(usuario.getNombre()!= null && usuario.getRol().equals("Admin")){
		                System.out.print("dato1"+usuario.getNombre());
		                request.setAttribute("usuario", usuario);
		                request.getRequestDispatcher("Controlador?menu=Principal").forward(request, response);
		                

		            }
		            else if(usuario.getNombre()!= null && usuario.getRol().equals("Empleado")){
		                System.out.print("dato1"+usuario.getNombre());
		                request.setAttribute("usuario", usuario);
		                request.getRequestDispatcher("Controlador?menu=PrincipalVendedor").forward(request, response);}
		                
		            
		            
		            else{
		            	try {
                    		
	                    		throw new Excepcion("Usuario o Contraseña Incorrecta");  
	                    		
	                    	
	                    } catch (Excepcion ee) {
	                    	
	                 	   String errorInicio3 = ee.getMessage();
	                    request.setAttribute("errorInicio3", ee.getMessage()); 
	                    request.getRequestDispatcher("error.jsp").forward(request, response);
	                    
	                    }
		            	
		                
		            }
		            
		            
	        	} catch (NullPointerException e) {
	        		

					String errorInicio1 = e.getMessage();
				   request.setAttribute("errorInicio1", e.getMessage()); 
				   request.getRequestDispatcher("error.jsp").forward(request, response); 
	        		
	        	}
				} catch (NumberFormatException nfe) {
			
						String errorInicio2 = nfe.getMessage();
					   request.setAttribute("errorInicio2", nfe.getMessage()); 
					   request.getRequestDispatcher("error.jsp").forward(request, response); 
	                
				}
	        	request.getRequestDispatcher("ingreso.jsp").forward(request, response);
	            
	            
	            

	        }else{
	            request.getRequestDispatcher("ingreso.jsp").forward(request, response);
	        }

	    }
	}









