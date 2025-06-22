package service;

import model.Customer;
import repository.CustomerRepository;

// CustomerService.java
public class CustomerService {
    private CustomerRepository customerRepository;

    public CustomerService(CustomerRepository customerRepository) {
        this.customerRepository = customerRepository;
    }

    public void getCustomerInfo(int id) {
        Customer customer = customerRepository.findCustomerById(id);
        if (customer != null) {
            System.out.println("✅ " + customer);
        } else {
            System.out.println("❌ Customer not found.");
        }
    }
}
