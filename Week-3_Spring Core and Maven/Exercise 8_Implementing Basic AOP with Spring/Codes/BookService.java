package com.library.service;

import org.springframework.stereotype.Service;

@Service
public class BookService {
    public void displayBooks() {
        System.out.println(" BookService: Displaying book list...");
    }
}
