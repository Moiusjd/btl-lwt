package com.ptit.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ptit.dao.OrderDAO;
import com.ptit.dao.OrderDetailDAO;
import com.ptit.entity.Account;
import com.ptit.entity.Item;
import com.ptit.entity.Order;
import com.ptit.entity.OrderDetail;
import com.ptit.entity.Product;

@Service
public class OrderService {
	@Autowired
	CartService cart;
	@Autowired
	OrderDAO dao;
	@Autowired
	OrderDetailDAO detailDao;

	public Order order(Account user, String address) {
		Order order = new Order();
		order.setAccount(user);
		order.setAddress(address);
		order.setCreateDate(new Date());
		List<OrderDetail> listOrderDt = new ArrayList<>();
		for (Item item : cart.getItems()) {
			OrderDetail orderDetail = new OrderDetail();
			orderDetail.setOrder(order);
			orderDetail.setPrice(item.getPrice());
			orderDetail.setQuantity(item.getQty());
			listOrderDt.add(orderDetail);

			Product product = new Product();
			product.setId(item.getId());
			product.setName(item.getName());
			orderDetail.setProduct(product);
			detailDao.save(orderDetail);
		}
		dao.save(order);
		detailDao.saveAll(listOrderDt);
		cart.clear();
		return order;
	}
}
