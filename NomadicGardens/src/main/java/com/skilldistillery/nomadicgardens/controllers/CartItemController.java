package com.skilldistillery.nomadicgardens.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.nomadicgardens.dao.CartItemDAO;
import com.skilldistillery.nomadicgardens.entities.CartItem;

@Controller
public class CartItemController {

	@Autowired
	private CartItemDAO dao;

//	@RequestMapping(path = "home.do")
//	public ModelAndView index() {
//		ModelAndView mv = new ModelAndView();
//
//		mv.setViewName("home");
//		return mv;
//	}

	@RequestMapping(path = "findCartItemById.do")
	public ModelAndView findCartItemById(@RequestParam("itemId") int itemId) {
		ModelAndView mv = new ModelAndView();
		
		CartItem item = dao.findById(itemId);
		mv.addObject("item", item);
		mv.setViewName("userProfile");
		
		return mv;
	}

	@RequestMapping(path = "findAllCartItems.do")
	public ModelAndView findAllCartItems() {
		ModelAndView mv = new ModelAndView();

		List<CartItem> allItems = dao.findAll();
		mv.addObject("allItems", allItems);
		mv.setViewName("home");
		
		return mv;
	}

	@RequestMapping(path = "createCartItem.do", method = RequestMethod.POST)
	public ModelAndView addCartItem(CartItem cartItem) {
		ModelAndView mv = new ModelAndView();

		cartItem = dao.create(cartItem);
		mv.addObject("cartItem", cartItem);
		mv.setViewName("userProfile");
		
		return mv;
	}

	@RequestMapping(path = "updateCartItem.do", method = RequestMethod.POST)
	public ModelAndView updateCartItem(@RequestParam("oldItemId") int oldId, CartItem cartItem) {
		ModelAndView mv = new ModelAndView();

		cartItem = dao.update(oldId, cartItem);
		mv.addObject("cartItem", cartItem);
		mv.setViewName("userProfile");
		
		return mv;
	}

	@RequestMapping(path = "destroyCartItem.do", method = RequestMethod.POST)
	public ModelAndView destroyCartItem(@RequestParam("itemId") int id) {
		ModelAndView mv = new ModelAndView();
		dao.destroy(id);
		mv.setViewName("redirect:home.do");
		
		return mv;
	}
}
