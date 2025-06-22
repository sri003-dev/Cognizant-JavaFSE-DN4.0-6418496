public class Main {
    public static void main(String[] args) {
        InventoryManager manager = new InventoryManager();

        Product p1 = new Product(101, "Keyboard", 50, 799.99);
        Product p2 = new Product(102, "Mouse", 80, 499.50);
        Product p3 = new Product(103, "Monitor", 20, 8499.00);

        manager.addProduct(p1);
        manager.addProduct(p2);
        manager.addProduct(p3);

        manager.showInventory();

        manager.updateProduct(102, 100, 475.00);
        manager.deleteProduct(101);

        manager.showInventory();
    }
}
