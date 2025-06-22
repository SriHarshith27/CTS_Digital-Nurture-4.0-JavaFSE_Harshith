import java.util.Arrays;
import java.util.Comparator;

public class ProductSearch {

    // Linear-Search
    public static Product linearSearch(Product[] products, String name) {
        for (Product p : products) {
            if (p.productName.equalsIgnoreCase(name)) {
                return p;
            }
        }
        return null;
    }

    // Binary-Search
    public static Product binarySearch(Product[] products, String name) {
        int left = 0, right = products.length - 1;
        while (left <= right) {
            int mid = (left + right) / 2;
            int cmp = products[mid].productName.compareToIgnoreCase(name);
            if (cmp == 0) return products[mid];
            else if (cmp < 0) left = mid + 1;
            else right = mid - 1;
        }
        return null;
    }

    public static void main(String[] args) {
        Product[] items = {
                new Product("P101", "Mouse", "Electronics"),
                new Product("P102", "Shirt", "Clothing"),
                new Product("P103", "Laptop", "Electronics"),
                new Product("P104", "Book", "Stationery")
        };

        // Sorting the Array
        Arrays.sort(items, Comparator.comparing(p -> p.productName.toLowerCase()));

        String searchTerm = "Laptop";
        Product result1 = linearSearch(items, searchTerm);
        Product result2 = binarySearch(items, searchTerm);

        System.out.println("Linear Search Result: " + result1);
        System.out.println("Binary Search Result: " + result2);
    }
}
