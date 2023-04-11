package modelo;

public class ArticuloPedido {
	
	private Integer id;
	private String nombre;
	private Double precio;
	private Double subtotal;
	private Double cantidad;
	private Integer IdArticulo;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public Double getPrecio() {
		return precio;
	}
	public void setPrecio(Double precio) {
		this.precio = precio;
	}
	public Double getSubtotal() {
		return subtotal;
	}
	public void setSubtotal(Double subtotal) {
		this.subtotal = subtotal;
	}
	public Double getCantidad() {
		return cantidad;
	}
	public void setCantidad(Double cantidad) {
		this.cantidad = cantidad;
	}
	public Integer getIdArticulo() {
		return IdArticulo;
	}
	public void setIdArticulo(Integer idArticulo) {
		IdArticulo = idArticulo;
	}
	
	

}
