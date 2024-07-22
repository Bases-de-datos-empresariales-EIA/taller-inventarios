### Taller: Construcción de un Diagrama Entidad-Relación

#### Objetivo del Taller
El objetivo de este taller es que los estudiantes construyan un diagrama entidad-relación (ERD) a partir de un esquema de negocio detallado. Este ejercicio ayudará a comprender cómo se traducen los requisitos de negocio en un modelo de base de datos estructurado.

#### Contexto del Negocio

Tu empresa se dedica a la gestión de compras y ventas de productos. La empresa tiene diferentes departamentos que necesitan hacer un seguimiento de los costos y gestionar los inventarios. Los procesos de negocio incluyen la gestión de categorías de productos, la asignación de precios, la creación de órdenes de compra, la gestión de movimientos de inventario y la facturación de ventas. La empresa trabaja tanto con proveedores como con clientes.

### Descripción de los Elementos del Negocio

1. **Centro de Costos**:
   - **Descripción**: Los centros de costos son unidades organizativas dentro de la empresa que se utilizan para la contabilidad de los gastos. Cada centro de costos realiza órdenes de compra para adquirir productos necesarios para sus operaciones.
   - **Atributos Clave**: Código del centro de costos, órdenes de compra asociadas.

2. **Categoría de Producto**:
   - **Descripción**: Las categorías de productos agrupan los productos según sus características comunes. Esto facilita la organización y gestión de los productos.
   - **Atributos Clave**: Nombre de la categoría, descripción, productos asociados.

3. **Producto**:
   - **Descripción**: Los productos son los bienes que la empresa compra, vende y gestiona en su inventario. Cada producto pertenece a una categoría y puede tener diferentes precios a lo largo del tiempo.
   - **Atributos Clave**: Nombre del producto, descripción, categoría asociada, precios históricos, movimientos de inventario.

4. **Precio del Producto**:
   - **Descripción**: Los precios de los productos pueden variar y es necesario registrar estos cambios. Cada precio está asociado a una lista de precios específica.
   - **Atributos Clave**: Precio, producto asociado, lista de precios.

5. **Lista de Precios**:
   - **Descripción**: Las listas de precios contienen los precios de los productos en un momento específico. Estas listas se utilizan para definir las tarifas de venta y compra en diferentes periodos.
   - **Atributos Clave**: Nombre de la lista, fecha de vigencia, productos y precios incluidos.

6. **Orden de Compra**:
   - **Descripción**: Las órdenes de compra son documentos generados por los centros de costos para adquirir productos de los proveedores. Incluyen detalles como el total de la orden, la fecha, y el tercero (proveedor o cliente).
   - **Atributos Clave**: Código de la orden, total, fecha, centro de costos asociado, movimientos de productos, tercero asociado.

7. **Movimiento de Inventario**:
   - **Descripción**: Los movimientos de inventario registran la entrada y salida de productos en el almacén. Cada movimiento está asociado a un producto y puede estar relacionado con una orden de compra o una factura de venta.
   - **Atributos Clave**: Cantidad, fecha, tipo de movimiento (entrada o salida), producto asociado, orden de compra o factura de venta asociada, usuario responsable.

8. **Factura de Venta**:
   - **Descripción**: Las facturas de venta son documentos emitidos a los clientes para registrar la venta de productos. Incluyen detalles como el total de la factura, la fecha, y el tercero (cliente).
   - **Atributos Clave**: Código de la factura, total, fecha, tercero asociado, movimientos de productos.

9. **Usuario**:
   - **Descripción**: Los usuarios son empleados de la empresa que realizan y gestionan los movimientos de inventario.
   - **Atributos Clave**: Nombre, correo, identificación, movimientos de inventario.

10. **Tercero**:
    - **Descripción**: Los terceros son entidades externas con las que la empresa realiza transacciones. Pueden ser clientes o proveedores.
    - **Atributos Clave**: Nombre, NIT, tipo (cliente o proveedor), órdenes de compra asociadas, facturas de venta.

### Actividad del Taller

1. **Definición de Entidades y Atributos**:
   - Identificar y definir todas las entidades necesarias basadas en la descripción del negocio.
   - Definir los atributos clave para cada entidad.

2. **Definición de Relaciones**:
   - Determinar cómo se relacionan las entidades entre sí.
   - Definir el tipo de relación (uno a uno, uno a muchos, muchos a muchos) y las restricciones de integridad referencial.

3. **Construcción del Diagrama ERD**:
   - Usar una herramienta de modelado (como draw.io, Lucidchart, etc.) para construir el diagrama entidad-relación.
   - Asegurarse de que todas las entidades y relaciones estén claramente representadas y etiquetadas.
