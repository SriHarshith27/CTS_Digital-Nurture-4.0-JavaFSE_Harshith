package com.library.service;

import com.library.repository.BookRepository;

public class BookService {

    private String libraryName;               // Constructor
    private BookRepository bookRepository;    // Setter

    //  (constructor injection)
    public BookService(String libraryName) {
        this.libraryName = libraryName;
        System.out.println(" Constructor Injection: libraryName injected as '" + libraryName + "'");

    }

    // (setter injection)
    public void setBookRepository(BookRepository bookRepository) {
        this.bookRepository = bookRepository;
        System.out.println("Setter Injection: BookRepository injected");

    }

    public void displayBooks() {
        System.out.println("Library: " + libraryName);
        bookRepository.getAllBooks();
    }
}
