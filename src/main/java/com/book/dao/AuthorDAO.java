package com.book.dao;

import org.springframework.data.repository.CrudRepository;

import com.book.entity.AuthorEntity;

public interface AuthorDAO extends CrudRepository<AuthorEntity, Integer> {
	

}
