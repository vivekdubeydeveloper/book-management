package com.book.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.book.model.Book;
import com.book.service.BookService;


@RestController
public class BookController {

	@Autowired
	BookService bookService;
	
	

	@GetMapping("/books")
	public List<Book> getLibraryBooks(){
		List<Book> libraryBooks = bookService.getLibraryBooks();
		return libraryBooks;
	}
	
	@GetMapping("/books/{bookName}")
	public Book getLibraryBook(@PathVariable("bookName") String bookName){
		Book libraryBook = bookService.getLibraryBook(bookName);
		return libraryBook;
	}
	
	@PostMapping("/books")
	public Book addBook(@RequestBody Book book) {
	
		bookService.addBook(book);
		return book;
	}
	
	@PutMapping("/books")
	public Book updateBook(@RequestBody Book book) {
		bookService.updateBook(book);
		return book;
	}
	
	@DeleteMapping("/books/{bookName}")
	public Book deleteBook(@PathVariable String bookName) {
		Book deleteBook = bookService.deleteBook(bookName);
		return deleteBook;
	}
	
	
}
