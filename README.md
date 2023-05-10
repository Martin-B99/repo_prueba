Lista de integrantes:

-	Bolatti, Martin Francisco.  Legajo: 46449.

-	Santagati, Juan Pablo. Legajo: 46158

Enunciado general del trabajo práctico.

-	El sistema desarrollado es para una distribuidora mayorista de productos de almacén, el cual el mismo permitirá crear, actualizar, eliminar y visualizar el listado de productos, pedidos, clientes y tipo de productos.

Clave de acceso al sistema:

-	Usuario administrador:
User: 123.
Password:123.

-	Usuario vendedor:
User:1234.
Password:1234.

Modelo de Dominio:

[![Captura.jpg](https://i.postimg.cc/bYFhVRrJ/Captura.jpg)](https://postimg.cc/3WpVdmg5)

Listado de Casos de Usos: 

ABMC simple: 

-	CUU01- Alta de cliente.

-	CUU02 – Eliminar cliente.

-	CUU03 – Actualización de cliente.

-	CUU04 – Buscar cliente.

-	CUU05 – Alta tipo artículo.

-	CUU06 – Eliminar tipo artículo.

-	CUU07 – Actualizar tipo artículo.

-	CUU08 – Buscar tipo artículo.

ABMC de entidad dependiente:

Los siguientes casos de usos refieren a la entidad Artículo la cual depende de la entidad Tipo Articulo

-	CUU09 – Alta de artículo.

-	CUU10 – Baja de artículo.

-	CUU11 – Actualización de artículo.

-	CUU12 – Buscar Artículo.

-	CUU13 - Registrar Pedido.

- CUU14 - Registrar pago.

Caso de uso Complejo:

-	CUR15 – Realizar Venta.

Camino Básico: 
El vendedor realiza la busqueda del cliente mediante su id, el sistema muestra los datos por pantalla. El vendedor ingresa en el sistema los artículos solicitados por el cliente con sus respectivas cantidades y genera el pedido, el sistema lo registra e informa el registro de mismo.
Cuando el cliente realiza el pago del pedido, el vendedor registra el pago del mismo en el sistema cambiando la condición de No pagado a Pagado, el sistema lo registra.

Restricciones del caso de uso: Las cantidades ingresadas por el vendedor no pueden ser mayor al stock existente de cada producto.
