package com.ptit.service;

import java.util.Collection;

import com.ptit.entity.*;

public interface CartService {

	Item add(Integer id);

	void remove(Integer id);

	Item update(Integer id, int qty);

	void clear();

	Collection<Item> getItems();

//	List<Item> getItems();

	int getCount();

	double getAmount();
}