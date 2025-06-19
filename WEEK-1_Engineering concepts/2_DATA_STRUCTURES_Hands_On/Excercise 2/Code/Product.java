class Product {
    String productId;
    String productName;
    String category;

    public Product(String id, String name, String cat) {
        this.productId = id;
        this.productName = name;
        this.category = cat;
    }

    @Override
    public String toString() {
        return "[" + productId + "] " + productName + " - " + category;
    }
}
