public class EmployeeManager {
    private Employee[] employees;
    private int size;

    public EmployeeManager(int capacity) {
        employees = new Employee[capacity];
        size = 0;
    }

    // Add Employee
    public void addEmployee(Employee e) {
        if (size < employees.length) {
            employees[size++] = e;
            System.out.println("Employee added successfully.");
        } else {
            System.out.println("Employee array is full.");
        }
    }

    // Search Employee by ID
    public void searchEmployee(int empId) {
        for (int i = 0; i < size; i++) {
            if (employees[i].employeeId == empId) {
                System.out.println("Employee Found:");
                employees[i].display();
                return;
            }
        }
        System.out.println("Employee not found.");
    }

    // Traverse and display all employees
    public void displayAll() {
        if (size == 0) {
            System.out.println("No employees to display.");
            return;
        }
        System.out.println("Employee List:");
        for (int i = 0; i < size; i++) {
            employees[i].display();
        }
    }

    // Delete Employee by ID
    public void deleteEmployee(int empId) {
        for (int i = 0; i < size; i++) {
            if (employees[i].employeeId == empId) {
                // Shift remaining elements
                for (int j = i; j < size - 1; j++) {
                    employees[j] = employees[j + 1];
                }
                employees[--size] = null;
                System.out.println("Employee deleted successfully.");
                return;
            }
        }
        System.out.println("Employee not found.");
    }
}
