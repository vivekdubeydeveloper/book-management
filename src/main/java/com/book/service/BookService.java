package com.book.service;

import java.util.List;

import com.book.model.Book;

public interface BookService {
	
	public List<Book> getLibraryBooks();
	
	public Book getLibraryBook(String bookName);
	
	public Book addBook(Book book);
	
	public Book updateBook(Book book);
	
	public Book deleteBook(String bookName);

}
