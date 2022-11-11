package com.book.service;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.book.convertor.BookConverter;
import com.book.dao.AuthorDAO;
import com.book.dao.BookDAO;
import com.book.entity.BookEntity;
import com.book.model.Book;

@Service
public class BookServiceImpl implements BookService {

	@Autowired
	BookDAO bookDAO;
	
	@Autowired
	AuthorDAO authorDAO;
	
	@Autowired
	BookConverter converter;

	public BookServiceImpl() {

	}

	
	@Transactional
	public List<Book> getLibraryBooks() {

		Iterator<BookEntity> itr = bookDAO.findAll().iterator();
		List<Book> books = new ArrayList<>();

		while (itr.hasNext()) {
			BookEntity bookEntity=itr.next();
			//bookEntity.getAuthor();
			Book b=converter.convertEntityToModel(bookEntity);
			books.add(b);
		}

		return books;
	}
	

	@Transactional
	public Book getLibraryBook(String bookName) {
		return converter.convertEntityToModel(bookDAO.findByName(bookName));
	}

	@Transactional
	public Book addBook(Book book) {
		BookEntity bookEntity= converter.convertModelToEntity(book);
		//authorDAO.save(bookEntity.getAuthor());
		bookDAO.save(bookEntity);
		book.setId(bookEntity.getId());
		book.getAuthor().setId(bookEntity.getAuthor().getId());
		return book;
	}

	@Transactional
	public Book updateBook(Book book) {
		BookEntity bookEntity= converter.convertModelToEntity(book);
		authorDAO.save(bookEntity.getAuthor());
		
		bookDAO.save(bookEntity);
		return book;
	}

	@Transactional
	public Book deleteBook(String bookName) {
		BookEntity bookEntity = bookDAO.findByName(bookName);
		bookDAO.delete(bookEntity);
		return converter.convertEntityToModel(bookEntity);
	}

}
