package dominio;

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class main {

    // Genera nuestros arrays de lista para almacenar informacion
    public static List<Vendedores> vendedores = new ArrayList<>();
    public static List<Productos> productos = new ArrayList<>();

    public static void main(String[] args) {
        int opcionElegida;
        boolean programaCorriendo = true;
        do {
            // Llama a la funcion para mostrar las opciones del menú
            mostrarMenu();
            // Espera que el usuario ingrese por teclado la opción mediante el 
            // validador ingresarInt()
            opcionElegida = ingresarInt();
            switch (opcionElegida) {
                case 1 ->
                    listarProductos();
                case 2 ->
                    listarVendedores();
                case 3 ->
                    agregarProductos();
                case 4 ->
                    agregarVendedores();
                case 5 -> {

                    System.out.println("Generando venta");

                    generarVenta();
                }
                case 9 -> {
                    System.out.println("Gracias por utilizar nuestro programa!\nUTN Bs As @ FRSR");
                    programaCorriendo = false;
                }
                default -> {
                    System.out.println("La opcion elegida no es valida");
                    pausar();
                }
            }
        } while (programaCorriendo);
    }

    public static void mostrarMenu() {
        System.out.println("Menú principal @ Sistema de ventas");
        System.out.println("");
        System.out.println("1 -> Listar productos");
        System.out.println("2 -> Listar vendedores");
        System.out.println("3 -> Agregar productos");
        System.out.println("4 -> Agregar vendedores");
        System.out.println("5 -> Generar venta");
        System.out.println("9 -> Salir");
        System.out.print("Seleccione una opción: ");
    }

    public static void pausar() {
        Scanner entrada = new Scanner(System.in);
        System.out.println("\nPresione ENTER para continuar...");
        entrada.nextLine();
    }

    public static void listarProductos() {
        System.out.println("\nListando productos: ");
        if (productos.size() > 0) {
            for (int i = 0; i < productos.size(); i++) {
                System.out.println(productos.get(i).toString());
            }
        } else {
            System.out.println("No existen productos ingresados todavia.");
        }
        pausar();
    }

    public static void listarVendedores() {
        System.out.println("\nListando vendedores:");
        if (vendedores.size() > 0) {
            for (int i = 0; i < vendedores.size(); i++) {
                System.out.println(vendedores.get(i).toString());
            }
        } else {
            System.out.println("No existen vendedores ingresados todavia.");
        }
        pausar();
    }

    public static void agregarProductos() {
        System.out.println("\nAgregando productos");
        System.out.println("Ingrese codigo del producto: ");
        int codigo = ingresarInt();
        System.out.println("Ingrese descripcion del producto: ");
        String descripcion = ingresarStr();
        System.out.println("Ingrese precio del producto: ");
        float precio = ingresarFloat();
        System.out.println("Ingrese stock inicial: ");
        int stock = ingresarInt();
        productos.add(new Productos(codigo, descripcion, precio, stock));
        pausar();
    }

    public static void agregarVendedores() {
        System.out.println("\nAgregando vendedores:");
        System.out.print("Ingrese nombre del nuevo vendedor: ");
        vendedores.add(new Vendedores(ingresarStr()));
        pausar();
    }

    // Funciones para validar tipo de entrada necesitada
    public static int ingresarInt() {
        Scanner entradaInt = new Scanner(System.in);
        while (!entradaInt.hasNextInt()) {
            System.out.print("Corregir dato, debe ser de tipo entero: ");
            entradaInt.next();
        }
        return entradaInt.nextInt();
    }

    public static float ingresarFloat() {
        Scanner entradaFloat = new Scanner(System.in);
        while (!entradaFloat.hasNextFloat()) {
            System.out.print("Corregir dato, debe ser numérico: ");
            entradaFloat.next();
        }
        return entradaFloat.nextFloat();
    }

    public static String ingresarStr() {
        Scanner entradaStr = new Scanner(System.in);
        while (!entradaStr.hasNext()) {
            System.out.println("Debe ingresar un dato correcto: ");
            entradaStr.next();
        }
        return entradaStr.next();
    }

    //Funcion para generar ventas
    public static void generarVenta() {
        int prodElegido , cantProductos ;
        int nroVendedor = 1, nroProducto = 1;
        int vendElegido = 1, contStock = 0;
        boolean esVendedorCargado = true;

        //Se verifica si alguno de los productos cargados tiene stock
        for (Productos producto : productos) {
            if (producto.getStock() > 0) {
                contStock++;
            }
        }

        //Controla el stock, que no sea 0 y que hayan productos cargados
        if (!productos.isEmpty() && contStock > 0) {

            //En caso de haber productos con stock, se muestra el listado
            System.out.println("------------------------------------------------");
            System.out.println("Seleccione un producto para la compra");
            // Se muestra la lista de productos cargados y se elige uno
            for (Productos producto : productos) {
                System.out.println((nroProducto) + producto.toString());
                nroProducto += 1;
            }
            prodElegido = ingresarInt();

            //Se verifica que se ingrese la opcion correcta y que tenga stock
            while ((prodElegido > productos.size() || prodElegido <= 0)
                    || (productos.get(prodElegido - 1).getStock() == 0)) {
                //Controla que el producto seleccionado este dentro de rango 
                if (prodElegido > productos.size() || prodElegido <= 0) {
                    System.out.println("Ese numero de producto no se encuentra");
                } else if (productos.get(prodElegido - 1).getStock() == 0) {
                    System.out.println("Producto sin stock");
                }
                System.out.println("Porfavor ingresar otro producto: ");
                prodElegido = ingresarInt();
            }

            // Se muestra la cantidad de productos en stock
            System.out.println("------------------------------------------------");
            System.out.println("Indicar la cantidad de "
                    + productos.get(prodElegido - 1).getDescripcion()
                    + "(s) a comprar? Disponibles "
                    + productos.get(prodElegido - 1).getStock()+": ");

            cantProductos = ingresarInt();

            // En caso de que la cantidad de productos elegidos sea mayor al stock
            if (cantProductos > productos.get(prodElegido - 1).getStock()) {
                do {
                    System.out.println("No puede facturar " + cantProductos
                            + " unidades del producto seleccionado");
                    System.out.println("Ingrese la cantidad deseada: ");
                    cantProductos = ingresarInt();

                } while (cantProductos > productos.get(prodElegido - 1).getStock());
            }
            System.out.println("");

            //Se descuenta la cantidad de productos vendidos en la matriz
            productos.get(prodElegido - 1).setStock(productos.get(prodElegido - 1)
                    .getStock() - cantProductos);

            //Elige el vendedor de la lista si es que hay 
            if (vendedores.isEmpty()) {
                System.out.println("No existen vendedores cargados, "
                        + "se generará una venta sin comisionar");
                System.out.println("");
                esVendedorCargado = false;
            } else {
                System.out.println("Seleccione un vendedor: ");
                for (Vendedores vendedor : vendedores) {
                    System.out.println(nroVendedor + vendedor.toString());
                    nroVendedor += 1;
                }
                vendElegido = ingresarInt();
            }

            //Se verifica que el vendedor seleccionado sea el correcto
            while ((vendElegido > vendedores.size() || vendElegido <= 0) && 
                    esVendedorCargado) {
                System.out.println("Ese numero de vendedor no se encuentra");
                System.out.println("Porfavor ingresar otro vendedor: ");
                vendElegido = ingresarInt();
            }

            //Imprime comprobante de compra con muchos datos importantes
            System.out.println("Gracias por comprar en nuestra tienda!!");
            System.out.println("------------------------------------------------");
            System.out.println("Detalle de su compra: ");
            System.out.println(productos.get(prodElegido - 1).mostrarDetalle());
            System.out.println("Valor final de la compra: $"
                    + productos.get(prodElegido - 1).getPrecio() * cantProductos);

            //suma la comision si tiene vendedor asignado
            if (esVendedorCargado) {
                vendedores.get(vendElegido - 1).
                        setComision((float) ((productos.get(prodElegido - 1)
                                .getPrecio() * cantProductos) * 0.3));
            }

            // En caso de tener vendedor asignado, se imprimen sus datos.
            if (esVendedorCargado) {
                System.out.println(vendedores.get(vendElegido - 1).toString());
                System.out.println("Comision que genera la venta (30% de la compra): $"
                        + vendedores.get(vendElegido - 1).getComision());
            } else {
                System.out.println("Vendedor generico no comisiona venta. ");
            }
        } else {
            System.out.println("");
            System.out.println("No hay datos suficientes para ejecutar la venta"); 
        }
        pausar();
    }
}
