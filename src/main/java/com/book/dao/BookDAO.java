package com.book.dao;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.book.entity.BookEntity;


@Repository
public interface BookDAO extends CrudRepository<BookEntity, Integer> {

	public BookEntity findByName(String name);
}
