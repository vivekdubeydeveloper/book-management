package com.book.convertor;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Component;

import com.book.entity.AuthorEntity;
import com.book.entity.BookEntity;
import com.book.model.Author;
import com.book.model.Book;

@Component
public class AuthorConvertor {
	
	public Author convertEntityToModel(AuthorEntity authorEntity) {
		Author author=new Author();
		author.setId(authorEntity.getId());
		author.setName(authorEntity.getName());
		return author;

	}

	public AuthorEntity convertModelToEntity(Author author) {
		AuthorEntity authorEntity=new AuthorEntity();
		authorEntity.setId(author.getId());
		authorEntity.setName(author.getName());
		return authorEntity;
	}
	
	
	public Author convertEntityToModelWithBooks(AuthorEntity authorEntity) {
		Author author=new Author();
		author.setId(authorEntity.getId());
		author.setName(authorEntity.getName());
		List<Book> books=new ArrayList<>();
		for(BookEntity bookEntity:authorEntity.getBooks()) {
			Book book=new Book();
			book.setId(bookEntity.getId());
			book.setName(bookEntity.getName());
			books.add(book);
		}
		
	    author.setBooks(books);
		return author;

	}
	
	
	public AuthorEntity convertModelToEntityWithBooks(Author author) {
		AuthorEntity authorEntity=new AuthorEntity();
		authorEntity.setName(author.getName());
		List<BookEntity> booksEntiy=new ArrayList<>();
		for(Book book:author.getBooks()) {
			BookEntity bookEntity=new BookEntity();
			bookEntity.setName(book.getName());
			bookEntity.setCreatedOn(LocalDateTime.now());
			bookEntity.setAuthor(authorEntity);
			booksEntiy.add(bookEntity);
		}
		authorEntity.setBooks(booksEntiy);
		return authorEntity;
	}


}
