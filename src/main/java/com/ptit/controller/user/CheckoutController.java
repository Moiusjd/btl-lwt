package com.ptit.controller.user;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ptit.dao.OrderDAO;
import com.ptit.dao.OrderDetailDAO;
import com.ptit.dao.ProductDAO;
import com.ptit.entity.Account;
import com.ptit.entity.Item;
import com.ptit.entity.Order;
import com.ptit.entity.OrderDetail;
import com.ptit.entity.Product;
import com.ptit.service.SessionService;
import com.ptit.service.CartService;

@Controller
public class CheckoutController {

	@Autowired
	OrderDAO dao;

	@Autowired
	ProductDAO pdao;

	@Autowired
	OrderDetailDAO ddao;

	@Autowired
	CartService cart;

	@Autowired
	SessionService session;

	@RequestMapping("/checkout")
	public String index(Model model) {
		model.addAttribute("cart", cart.getItems());
		model.addAttribute("countcart", cart.getCount());
		return "user/checkout";
	}

	@PostMapping("/checkout")
	public String success(Model model, @RequestParam("phone") String phone, @RequestParam("address") String address) {
		Order order = new Order();
		Account user = (Account) session.get("user");
		order.setCreateDate(new Date());
		order.setAddress(address);
		order.setPhone(phone);
		order.setAccount(user);
		dao.save(order);

		for (Item item : cart.getItems()) {
			Order orderid = dao.getReferenceById(order.getId());
			Product productid = pdao.getReferenceById(item.getId());
			ddao.save(new OrderDetail(item.getPrice(), item.getQty(), productid, orderid));
		}
		cart.getItems().clear();
		return "user/success";
	}
}
