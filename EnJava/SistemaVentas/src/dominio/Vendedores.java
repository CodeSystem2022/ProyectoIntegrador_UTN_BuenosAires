package dominio;

public class Vendedores {

    // Atributos
    protected static int contador;
    protected String nombreVendedor;
    protected int codigoVendedor;
    protected float comision;

    // Constructor
    public Vendedores() {
    }

    public Vendedores(String nombreVendedor) {
        Vendedores.contador++;
        this.codigoVendedor = Vendedores.contador;
        this.nombreVendedor = nombreVendedor;
        this.comision = 0;
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
    
    
    @Override
    public String toString() {
        return "----------"
                + "\nCódigo vendedor: " + codigoVendedor
                + "\nNombre del vendedor: " + nombreVendedor
                + "\nComisión actual: $" + comision;
    }
}
