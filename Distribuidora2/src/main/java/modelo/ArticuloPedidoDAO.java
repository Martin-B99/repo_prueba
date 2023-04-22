package modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import org.apache.jasper.tagplugins.jstl.core.ForEach;

import config.Conexion;

public class ArticuloPedidoDAO {
	
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
	Conexion cn = new Conexion();
	int r;
	
	public int AgregarArticulos(List<ArticuloPedido> articulos_pedidos, int id) {		
			 String sentencia =
					 "INSERT INTO pedido_articulo (id_pedido, id_articulo) VALUES (?,?)"
					 ; try { 
						 con = cn.Conexion(); 
						 ps = con.prepareStatement(sentencia);
						 for (ArticuloPedido articuloPedido : articulos_pedidos) {
							 ps.setInt(1, id);
							 ps.setInt(2, articuloPedido.getId()); 
							 ps.executeUpdate();
						}						 						 					
						 } catch (SQLException ex) {
					 Logger.getLogger(ArticuloPedidoDAO.class.getName()).log(Level.SEVERE, null, ex); }
	
		 return r;
	}
	
	 public void EliminarArticuloPedido(int id) {

	        String sql = "DELETE FROM pedido_articulo WHERE id_pedido=" + id;
	        con = cn.Conexion();
	        try {
	            ps = con.prepareStatement(sql);
	            ps.executeUpdate();
	        } catch (SQLException ex) {
	            Logger.getLogger(PedidoDAO.class.getName()).log(Level.SEVERE, null, ex);
	        }

	    }
	 
	 public void EliminarArticuloPedidoCliente(ArrayList<Pedido> pedidos) {

	        String sql = "DELETE FROM pedido_articulo WHERE id_pedido= ?";
	        con = cn.Conexion();
	        try {
	        	for (Pedido pedido : pedidos) {
		            ps = con.prepareStatement(sql);
		            ps.setInt(1, pedido.getId_pedido());
		            ps.executeUpdate();
				}
	        } catch (SQLException ex) {
	            Logger.getLogger(PedidoDAO.class.getName()).log(Level.SEVERE, null, ex);
	        }

	    }
	 
	 public void EliminarArticuloPedido2(int id) {

	        String sql = "DELETE FROM pedido_articulo WHERE id_articulo=" + id;
	        con = cn.Conexion();
	        try {
	            ps = con.prepareStatement(sql);
	            ps.executeUpdate();
	        } catch (SQLException ex) {
	            Logger.getLogger(PedidoDAO.class.getName()).log(Level.SEVERE, null, ex);
	        }

	    }


}
