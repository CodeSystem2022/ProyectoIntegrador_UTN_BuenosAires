package dominio;

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class main {

    public static void main(String[] args) {
        Scanner entrada = new Scanner(System.in);
        boolean programaCorriendo = true;
        List<Vendedores> vendedores = new ArrayList<Vendedores>();
        List<Productos> productos = new ArrayList<Productos>();
        do {
            System.out.println("Menú principal @ Sistema de ventas");
            System.out.println("");
            System.out.println("1 -> Listar productos");
            System.out.println("2 -> Listar vendedores");
            System.out.println("3 -> Agregar productos");
            System.out.println("4 -> Agregar vendedores");
            System.out.println("5 -> Generar venta");
            System.out.println("9 -> Salir");
            int opcionElegida = Integer.parseInt(entrada.nextLine());
            switch (opcionElegida) {
                case 1 -> {
                    System.out.println("listando productos");
                    if (productos.size() > 0) {
                        for (int i = 0; i < productos.size(); i++) {
                            System.out.println("----------");
                            System.out.println("Codigo producto: " + productos.get(i).getCodigo());
                            System.out.println("Descripcion producto: " + productos.get(i).getDescripcion());
                            System.out.println("Precio producto: " + productos.get(i).getPrecio());
                            System.out.println("Stock disponible del producto: " + productos.get(i).getStock());
                        }
                    } else {
                        System.out.println("No existen productos ingresados todavia.");
                    }
                    System.out.println("Presione ENTER para continuar...");
                    entrada.nextLine();
                }
                case 2 -> {
                    System.out.println("Listando vendedores");
                    if (vendedores.size() > 0) {
                        for (int i = 0; i < vendedores.size(); i++) {
                            System.out.println("----------");
                            System.out.println("Codigo vendedor: " + vendedores.get(i).getCodigo());
                            System.out.println("Nombre vendedor: " + vendedores.get(i).getNombreVendedor());
                            System.out.println("Comision vendedor: $" + vendedores.get(i).getComision());
                        }
                    } else {
                        System.out.println("No existen vendedores ingresados todavia.");
                    }
                    System.out.println("Presione ENTER para continuar...");
                    entrada.nextLine();
                }
                case 3 -> {
                    System.out.println("agregando productos");
                    System.out.println("Ingrese codigo del producto: ");
                    int codigo = Integer.parseInt(entrada.next());
                    System.out.println("Ingrese descripcion del producto: ");
                    String descripcion = entrada.next();
                    System.out.println("Ingrese precio del producto: ");
                    float precio = Float.parseFloat(entrada.next());
                    System.out.println("Ingrese stock inicial: ");
                    int stock = Integer.parseInt(entrada.next());
                    productos.add(new Productos(codigo, descripcion, precio, stock));
                    System.out.println("Presione ENTER para continuar...");
                    entrada.nextLine();
                }
                case 4 -> {
                    System.out.println("Agregando vendedores:");
                    System.out.print("Ingrese nombre del nuevo vendedor: ");
                    var contador = vendedores.size() + 1;
                    String vendedor = entrada.next();
                    vendedores.add(new Vendedores(contador, vendedor, 0));
                    System.out.println("Presione ENTER para continuar...");
                    entrada.nextLine();
                }
                case 5 -> {
                    System.out.println("Generando venta");
                    System.out.println("Presione ENTER para continuar...");
                    entrada.nextLine();
                }
                case 9 -> {
                    System.out.println("Saliendo");
                    programaCorriendo = false;
                }
                default ->
                    System.out.println("La opcion elegida no es valida");
            }
            System.out.println("opcionElegida = " + opcionElegida);

        } while (programaCorriendo);

    }
}
