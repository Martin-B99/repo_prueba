package modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.List;

import com.mysql.cj.protocol.Resultset;

import config.Conexion;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import config.Conexion;

public class PedidoDAO {
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
	Conexion cn = new Conexion();
	int r;
	int id = 0;
	
	public int AgregarPedido(Cliente cliente, double totalpedido) {
		 
		 String sentencia =
		 "INSERT INTO pedido (cliente,total,pagado) VALUES (?,?,?)"
		 ; try { 
			 con = cn.Conexion(); 
			 ps = con.prepareStatement(sentencia);
			 ps.setInt(1, cliente.getId()); 
			 ps.setDouble(2, totalpedido); 
			 ps.setBoolean(3, false);
			 ps.executeUpdate(); 
			 } catch (SQLException ex) {
		 Logger.getLogger(ArticuloDAO.class.getName()).log(Level.SEVERE, null, ex); }
		 return r;
		 }
	
	public int DevolverIdPedido() {
		 String sentencia =
		 "SELECT MAX(id_pedido) FROM pedido"
		 ;try {
				con = cn.Conexion();
				ps = con.prepareStatement(sentencia);
				rs = ps.executeQuery();
				while (rs.next()) {
					id = rs.getInt(1);

				}
			} catch (SQLException ex) {
		 Logger.getLogger(ArticuloDAO.class.getName()).log(Level.SEVERE, null, ex); }
		 
		 return id;
		 }
	
	

}
