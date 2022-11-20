package dominio;

public class Productos {

    // Atributos
    private int codigo;
    private String descripcion;
    private float precio;
    private int stock;

    // Constructor
    public Productos() {
    }

    public Productos(int codigo, String descripcion, float precio, int stock) {
        this.codigo = codigo;
        this.descripcion = descripcion;
        this.precio = precio;
        this.stock = stock;
        System.out.println("Producto agregado con éxito!\n" + toString());
    }

    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public float getPrecio() {
        return precio;
    }

    public void setPrecio(float precio) {
        this.precio = precio;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }
    
    public String mostrarDetalle(){
         return "----------"
                + "\nCódigo producto: " + codigo
                + "\nDescripción del producto: " + descripcion
                + "\nPrecio unitario: $" + precio;
    }

    @Override
    public String toString() {
        return "----------"
                + "\nCódigo producto: " + codigo
                + "\nDescripción del producto: " + descripcion
                + "\nPrecio unitario: $" + precio
                + "\nStock disponible: " + stock;
    }
}
