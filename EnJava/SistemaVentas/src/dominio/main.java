package dominio;

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class main {

    // Genera nuestros arrays de lista para almacenar informacion
    public static List<Vendedores> vendedores = new ArrayList<>();
    public static List<Productos> productos = new ArrayList<>();

    public static void main(String[] args) {
        Scanner entrada = new Scanner(System.in);
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
                    pausar();
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
}
