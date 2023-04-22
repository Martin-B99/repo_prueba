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
	
	public List Listar() {
		String consulta = "SELECT * FROM pedido";
		List<Pedido> lista = new ArrayList();
		try {
			con = cn.Conexion();
			ps = con.prepareStatement(consulta);
			rs = ps.executeQuery();
			while (rs.next()) {
				Pedido pedido = new Pedido();
				Cliente c = new Cliente();
				ClienteDAO cDAO = new ClienteDAO();
				pedido.setId_pedido(rs.getInt("id_pedido"));
				c = cDAO.buscarClienteId(rs.getInt("cliente"));
				pedido.setCliente(c);
				pedido.setTotal(rs.getDouble("total"));
				pedido.setCondicion(rs.getBoolean("pagado"));	
				lista.add(pedido);

			}
		} catch (SQLException ex) {
			Logger.getLogger(ArticuloDAO.class.getName()).log(Level.SEVERE, null, ex);
		}
		return lista;

	}
	
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
	
	public Pedido buscarPedidoId(int id) {
		con = cn.Conexion();
		String consulta = "SELECT * FROM pedido WHERE id_pedido=" + id;
		Pedido pedido = new Pedido();
        try {
            ps = con.prepareStatement(consulta);
            rs = ps.executeQuery();
            while (rs.next()) {
            	Cliente cliente = new Cliente();
            	ClienteDAO clienteDAO = new ClienteDAO();
            	pedido.setId_pedido(rs.getInt("id_pedido"));
            	cliente = clienteDAO.buscarClienteId(rs.getInt("cliente"));
            	pedido.setCliente(cliente);
            	pedido.setTotal(rs.getDouble("total"));
            	pedido.setCondicion(rs.getBoolean("pagado"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(PedidoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
		
		return pedido;
	}
	
	public ArrayList<Pedido> buscarPedidoCliente(int id) {
		con = cn.Conexion();
		String consulta = "SELECT * FROM pedido WHERE cliente=" + id;
		ArrayList<Pedido> pedidos = new ArrayList<Pedido>();
        try {
            ps = con.prepareStatement(consulta);
            rs = ps.executeQuery();
            while (rs.next()) {
            	Pedido pedido = new Pedido();
            	Cliente cliente = new Cliente();
            	ClienteDAO clienteDAO = new ClienteDAO();
            	pedido.setId_pedido(rs.getInt("id_pedido"));
            	cliente = clienteDAO.buscarClienteId(rs.getInt("cliente"));
            	pedido.setCliente(cliente);
            	pedido.setTotal(rs.getDouble("total"));
            	pedido.setCondicion(rs.getBoolean("pagado"));
            	pedidos.add(pedido);
            }
        } catch (SQLException ex) {
            Logger.getLogger(PedidoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
		
		return pedidos;
	}
	
	 
	 public void Actualizar(Pedido pedido) {
	        String sentencia = "UPDATE pedido set pagado=? WHERE id_pedido=?";
	        try {
	            con = cn.Conexion();
	            ps = con.prepareStatement(sentencia);
	            ps.setBoolean(1, pedido.isCondicion());
	            ps.setInt(2, pedido.getId_pedido());
           
	            ps.executeUpdate();

	        } catch (SQLException ex) {
	            Logger.getLogger(PedidoDAO.class.getName()).log(Level.SEVERE, null, ex);
	        }
	    }
	 
	 public void Eliminar(int id) {

	        String sql = "DELETE FROM pedido WHERE id_pedido=" + id;
	        con = cn.Conexion();
	        try {
	            ps = con.prepareStatement(sql);
	            ps.executeUpdate();
	        } catch (SQLException ex) {
	            Logger.getLogger(PedidoDAO.class.getName()).log(Level.SEVERE, null, ex);
	        }

	    }
	 
	 
	 public void EliminarClientePedido(ArrayList<Pedido> pedidos) {

	        String sql = "DELETE FROM pedido WHERE id_pedido= ?";
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

}
