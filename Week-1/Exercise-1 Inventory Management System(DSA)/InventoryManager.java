import java.util.HashMap;

public class InventoryManager {
    private HashMap<Integer, Product> inventory = new HashMap<>();

    public void addProduct(Product product) {
        inventory.put(product.productId, product);
        System.out.println("Added: " + product);
    }

    public void updateProduct(int id, int newQty, double newPrice) {
        Product product = inventory.get(id);
        if (product != null) {
            product.quantity = newQty;
            product.price = newPrice;
            System.out.println("Updated: " + product);
        } else {
            System.out.println("Product not found.");
        }
    }

    public void deleteProduct(int id) {
        Product removed = inventory.remove(id);
        if (removed != null) {
            System.out.println("Deleted: " + removed);
        } else {
            System.out.println("Product not found.");
        }
    }

    public void showInventory() {
        System.out.println("Inventory:");
        for (Product p : inventory.values()) {
            System.out.println(p);
        }
    }
}
