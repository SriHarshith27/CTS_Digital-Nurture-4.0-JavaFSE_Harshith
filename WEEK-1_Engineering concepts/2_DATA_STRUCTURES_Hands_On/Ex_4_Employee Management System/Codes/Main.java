public class Main {
    public static void main(String[] args) {
        EmployeeManager manager = new EmployeeManager(5);

        // Adding Employees
        manager.addEmployee(new Employee(1, "Alice", "Manager", 75000));
        manager.addEmployee(new Employee(2, "Bob", "Developer", 50000));
        manager.addEmployee(new Employee(3, "Charlie", "Designer", 45000));

        // Display All
        manager.displayAll();

        // Search
        manager.searchEmployee(2);

        // Delete
        manager.deleteEmployee(2);

        // Display Again
        manager.displayAll();
    }
}
