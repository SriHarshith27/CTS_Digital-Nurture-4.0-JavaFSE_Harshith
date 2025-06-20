public class Main {
    public static void main(String[] args) {
        Order[] orders = {
                new Order(101, "Alice", 2500.0),
                new Order(102, "Bob", 900.0),
                new Order(103, "Charlie", 5000.0),
                new Order(104, "David", 1200.0)
        };

        // Bubble Sort
        System.out.println("=== Bubble Sort ===");
        BubbleSortOrders.bubbleSort(orders);
        for (Order order : orders) {
            order.displayOrder();
        }

        // Resetting the array
        orders = new Order[] {
                new Order(101, "Alice", 2500.0),
                new Order(102, "Bob", 900.0),
                new Order(103, "Charlie", 5000.0),
                new Order(104, "David", 1200.0)
        };

        // Quick Sort
        System.out.println("\n=== Quick Sort ===");
        QuickSortOrders.quickSort(orders, 0, orders.length - 1);
        for (Order order : orders) {
            order.displayOrder();
        }
    }
}
