package com.ptit.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.ptit.entity.*;

public interface CategoryDAO extends JpaRepository<Category, Integer> {

	@Query(value = "SELECT count(c.id) FROM Categories c", nativeQuery = true)
	Integer countAllCategory();
}
