public class Main {
    public static void main(String[] args) {
        Order[] orders = {
                new Order(1, "Alice", 1200.50),
                new Order(2, "Bob", 450.75),
                new Order(3, "Charlie", 3000.00),
                new Order(4, "Dave", 980.20)
        };

        System.out.println("Before sorting:");
        for (Order o : orders) System.out.println(o);

        OrderSorter.quickSort(orders, 0, orders.length - 1);

        System.out.println("\nAfter quick sort:");
        for (Order o : orders) System.out.println(o);
    }
}
