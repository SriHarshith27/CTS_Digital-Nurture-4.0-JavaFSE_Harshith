package main;

// DependencyInjectionExample.java
import repository.CustomerRepository;
import repository.CustomerRepositoryImpl;
import service.CustomerService;

import java.util.Scanner;

public class DependencyInjectionExample {
    public static void main(String[] args) {
        CustomerRepository repo = new CustomerRepositoryImpl(); // Create dependency
        CustomerService service = new CustomerService(repo);    // Inject dependency

        Scanner scanner = new Scanner(System.in);
        System.out.print("Enter Customer ID to search: ");
        int id = scanner.nextInt();

        service.getCustomerInfo(id);  // Use service to fetch model

        scanner.close();
    }
}
