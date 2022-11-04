package dominio;

public class Vendedores {

    // Atributos
    private int Codigo;
    private String NombreVendedor;
    private float Comision;

    // Constructor
    public Vendedores() {
    }

    public Vendedores(int Codigo, String NombreVendedor, float Comision) {
        this.Codigo = Codigo;
        this.NombreVendedor = NombreVendedor;
        this.Comision = Comision;
    }

    public int getCodigo() {
        return Codigo;
    }

    public void setCodigo(int Codigo) {
        this.Codigo = Codigo;
    }

    public String getNombreVendedor() {
        return NombreVendedor;
    }

    public void setNombreVendedor(String NombreVendedor) {
        this.NombreVendedor = NombreVendedor;
    }

    public float getComision() {
        return Comision;
    }

    public void setComision(float Comision) {
        this.Comision = Comision;
    }

}
