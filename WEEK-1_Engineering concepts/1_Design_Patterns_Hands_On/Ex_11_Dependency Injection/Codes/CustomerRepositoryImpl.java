package repository;

// CustomerRepositoryImpl.java
import model.Customer;

import java.util.HashMap;
import java.util.Map;

public class CustomerRepositoryImpl implements CustomerRepository {
    private Map<Integer, Customer> customerDB = new HashMap<>();

    public CustomerRepositoryImpl() {
        // Add some dummy data
        customerDB.put(1, new Customer(1, "Alice"));
        customerDB.put(2, new Customer(2, "Bob"));
    }

    @Override
    public Customer findCustomerById(int id) {
        return customerDB.getOrDefault(id, null);
    }
}
