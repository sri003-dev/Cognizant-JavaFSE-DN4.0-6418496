public class Main {
    public static void main(String[] args) {
        Product[] products = {
                new Product(104, "Shoes", "Footwear"),
                new Product(101, "Phone", "Electronics"),
                new Product(103, "Book", "Education"),
                new Product(102, "Shirt", "Apparel")
        };

        System.out.println("Linear Search:");
        Product found1 = SearchFunctions.linearSearch(products, 103);
        System.out.println(found1 != null ? found1 : "Not Found");

        System.out.println("\nBinary Search:");
        SearchFunctions.sortProductsById(products);
        Product found2 = SearchFunctions.binarySearch(products, 103);
        System.out.println(found2 != null ? found2 : "Not Found");
    }
}
