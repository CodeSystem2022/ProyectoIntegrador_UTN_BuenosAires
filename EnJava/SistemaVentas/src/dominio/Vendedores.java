package dominio;

public class Vendedores {

    // Atributos
    private int codigo;
    private String nombreVendedor;
    private float comision;

    // Constructor
    public Vendedores() {
    }

    public Vendedores(int codigo, String nombreVendedor, float comision) {
        this.codigo = codigo;
        this.nombreVendedor = nombreVendedor;
        this.comision = comision;
    }
    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
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
                + "\nCódigo vendedor: " + codigo
                + "\nNombre del vendedor: " + nombreVendedor
                + "\nComisión actual: $" + comision;
    }
}
