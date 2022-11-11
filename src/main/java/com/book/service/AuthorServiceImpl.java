package com.book.service;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.book.convertor.AuthorConvertor;
import com.book.dao.AuthorDAO;
import com.book.entity.AuthorEntity;
import com.book.entity.BookEntity;
import com.book.model.Author;

@Service
public class AuthorServiceImpl implements AuthorService {
	
	@Autowired
	AuthorDAO authorDAO;
	
	@Autowired
	AuthorConvertor authorConvertor;

	@Override
	@Transactional
	public List<Author> getAuthors() {
		Iterator<AuthorEntity> itr = authorDAO.findAll().iterator();
		List<Author> authors=new ArrayList<>();
		while(itr.hasNext()) {
			AuthorEntity authorEntity=itr.next();
			Author author = authorConvertor.convertEntityToModelWithBooks(authorEntity);
			authors.add(author);
		}
		return authors;
	}

	@Override
	@Transactional
	public Author addAuthor(Author author) {
		// TODO Auto-generated method stub
		AuthorEntity authorEntity = authorConvertor.convertModelToEntityWithBooks(author);
		authorDAO.save(authorEntity);
		author.setId(authorEntity.getId());
		int i=0;
		for(BookEntity bookEntity:authorEntity.getBooks()) {
			author.getBooks().get(i).setId(bookEntity.getId());
			i++;
			
		}
		return author;
	}

}
