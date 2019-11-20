package com.skilldistillery.nomadicgardens.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.nomadicgardens.dao.CartItemDAO;
import com.skilldistillery.nomadicgardens.dao.ItemDAO;
import com.skilldistillery.nomadicgardens.dao.UserDAO;
import com.skilldistillery.nomadicgardens.entities.CartItem;
import com.skilldistillery.nomadicgardens.entities.Item;
import com.skilldistillery.nomadicgardens.entities.User;

@Controller
public class CartItemController {

	@Autowired
	private CartItemDAO cartItemDAO;
	@Autowired
	private ItemDAO itemDAO;
	@Autowired
	private UserDAO userDAO;

	@RequestMapping(path = "cart.do")
	public ModelAndView goToCart() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("cart");
		return mv;
	}

	@RequestMapping(path = "findCartItemById.do")
	public ModelAndView findCartItemById(@RequestParam("itemId") int itemId) {
		ModelAndView mv = new ModelAndView();
		
		CartItem item = cartItemDAO.findById(itemId);
		mv.addObject("item", item);
		mv.setViewName("userProfile");
		
		return mv;
	}

	@RequestMapping(path = "findAllCartItems.do")
	public ModelAndView findAllCartItems() {
		ModelAndView mv = new ModelAndView();

		List<CartItem> allItems = cartItemDAO.findAll();
		mv.addObject("allItems", allItems);
		mv.setViewName("home");
		
		return mv;
	}
	
	@RequestMapping(path = "findAllCartItemsById.do")
	public ModelAndView findAllCartItemsById(@RequestParam("userId") int id) {
		ModelAndView mv = new ModelAndView();
		
		List<CartItem> allItems = cartItemDAO.findAllCartItemsById(id);
		mv.addObject("allCartItems", allItems);
		mv.setViewName("cart");
		
		return mv;
	}

	@RequestMapping(path = "createCartItem.do", method = RequestMethod.POST)
	public ModelAndView createCartItem(CartItem cartItem, @RequestParam("userId")int userId, @RequestParam("itemId") int itemId) {
		ModelAndView mv = new ModelAndView();
		User user = userDAO.findById(userId);
		Item item = itemDAO.findById(itemId);
		
		cartItem = cartItemDAO.makeCartItem(cartItem, user, item);
		
		mv.addObject("cartItem", cartItem);
		mv.setViewName("cart");
		
		return mv;
	}

	@RequestMapping(path = "updateCartItem.do", method = RequestMethod.POST)
	public ModelAndView updateCartItem(@RequestParam("oldItemId") int oldId, CartItem cartItem) {
		ModelAndView mv = new ModelAndView();

		cartItem = cartItemDAO.update(oldId, cartItem);
		mv.addObject("cartItem", cartItem);
		mv.setViewName("userProfile");
		
		return mv;
	}

	@RequestMapping(path = "destroyCartItem.do", method = RequestMethod.POST)
	public ModelAndView destroyCartItem(@RequestParam("itemId") int id) {
		ModelAndView mv = new ModelAndView();
		cartItemDAO.destroy(id);
		mv.setViewName("redirect:home.do");
		
		return mv;
	}
}
