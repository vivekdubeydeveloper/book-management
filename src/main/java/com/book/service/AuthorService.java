package com.book.service;

import java.util.List;

import com.book.model.Author;

public interface AuthorService {
	public List<Author> getAuthors();
	public Author addAuthor(Author author);
}
