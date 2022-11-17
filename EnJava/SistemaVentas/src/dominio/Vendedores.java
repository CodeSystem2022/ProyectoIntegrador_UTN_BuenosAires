package dominio;

public class Vendedores {

    // Atributos
    private static int contador;
    private String nombreVendedor;
    private int codigoVendedor;
    private float comision;

    // Constructor
    public Vendedores() {
    }

    public Vendedores(String nombreVendedor, float comision) {
        Vendedores.contador++;
        this.codigoVendedor = Vendedores.contador;
        this.nombreVendedor = nombreVendedor;
        this.comision = comision;
    }
    public int getCodigo() {
        return codigoVendedor;
    }

    public void setCodigo(int codigo) {
        this.codigoVendedor = codigo;
    }

    public String getNombreVendedor() {
        return nombreVendedor;
    }

    public void setNombreVendedor(String nombreVendedor) {
        this.nombreVendedor = nombreVendedor;
    }

    public float getComision() {
        return comision;
    }

    public void setComision(float comision) {
        this.comision = comision;
    }

    /*System.out.println("----------");
                System.out.println("Codigo vendedor: " + vendedores.get(i).getCodigo());
                System.out.println("Nombre vendedor: " + vendedores.get(i).getNombreVendedor());
                System.out.println("Comision vendedor: $" + vendedores.get(i).getComision());
    
     */

    @Override
    public String toString() {
        return "----------"
                + "\nCódigo vendedor: " + codigoVendedor
                + "\nNombre del vendedor: " + nombreVendedor
                + "\nComisión actual: $" + comision;
    }
}
