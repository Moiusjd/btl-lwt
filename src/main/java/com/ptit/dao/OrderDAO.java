package com.ptit.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.ptit.entity.*;

public interface OrderDAO extends JpaRepository<Order, Integer> {
}
