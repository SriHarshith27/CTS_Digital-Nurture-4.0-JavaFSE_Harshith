package model;

// Customer.java
public class Customer {
    private int id;
    private String name;

    public Customer(int id, String name) {
        this.id = id;
        this.name = name;
    }

    // Getters
    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    // toString for printing
    @Override
    public String toString() {
        return "Customer ID: " + id + ", Name: " + name;
    }
}
