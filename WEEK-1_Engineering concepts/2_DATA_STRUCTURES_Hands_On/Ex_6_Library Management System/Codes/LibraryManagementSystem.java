import java.util.Arrays;
import java.util.Comparator;

public class LibraryManagementSystem {

    public static void main(String[] args) {
        Book[] books = {
                new Book(1, "Java Basics", "James Gosling"),
                new Book(2, "Effective Java", "Joshua Bloch"),
                new Book(3, "Clean Code", "Robert Martin"),
                new Book(4, "Design Patterns", "Erich Gamma"),
                new Book(5, "Algorithms", "Robert Sedgewick")
        };

        // 🔍 Linear Search
        System.out.println("Linear Search for 'Clean Code':");
        Book result1 = linearSearchByTitle(books, "Clean Code");
        System.out.println(result1 != null ? result1 : "Book not found");

        // 🔄 Sort for binary search
        Arrays.sort(books, Comparator.comparing(book -> book.title));

        // 🔍 Binary Search
        System.out.println("\nBinary Search for 'Design Patterns':");
        Book result2 = binarySearchByTitle(books, "Design Patterns");
        System.out.println(result2 != null ? result2 : "Book not found");
    }

    // Linear Search Method
    public static Book linearSearchByTitle(Book[] books, String title) {
        title = title.toLowerCase();
        for (Book book : books) {
            if (book.title.equals(title)) {
                return book;
            }
        }
        return null;
    }

    // Binary Search Method
    public static Book binarySearchByTitle(Book[] books, String title) {
        title = title.toLowerCase();
        int left = 0;
        int right = books.length - 1;

        while (left <= right) {
            int mid = left + (right - left) / 2;
            int cmp = books[mid].title.compareTo(title);

            if (cmp == 0) return books[mid];
            else if (cmp < 0) left = mid + 1;
            else right = mid - 1;
        }
        return null;
    }
}
