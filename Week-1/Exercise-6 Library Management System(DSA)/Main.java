public class Main {
    public static void main(String[] args) {
        Book[] books = {
                new Book(1, "Java Programming", "James"),
                new Book(2, "Data Structures", "Tanenbaum"),
                new Book(3, "Algorithms", "Cormen")
        };

        System.out.println("Linear Search:");
        Book found1 = Library.linearSearch(books, "Algorithms");
        System.out.println(found1);

        Library.sortBooks(books);
        System.out.println("Binary Search:");
        Book found2 = Library.binarySearch(books, "Algorithms");
        System.out.println(found2);
    }
}
