package com.book.convertor;

import java.time.LocalDateTime;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.book.entity.AuthorEntity;
import com.book.entity.BookEntity;
import com.book.model.Author;
import com.book.model.Book;

@Component
public class BookConverter {
	
	@Autowired
	AuthorConvertor authorConvertor;

	public Book convertEntityToModel(BookEntity bookEntity) {
		Author author = authorConvertor.convertEntityToModel(bookEntity.getAuthor());
		Book book=new Book(bookEntity.getId(), bookEntity.getName(), author);
		return book;

	}

	public BookEntity convertModelToEntity(Book book) {
		AuthorEntity author = authorConvertor.convertModelToEntity(book.getAuthor());
		BookEntity bookEntity=new BookEntity(book.getId(), book.getName(), author);
		bookEntity.setCreatedOn(LocalDateTime.now());
		return bookEntity;
	}

}
