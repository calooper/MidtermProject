package com.skilldistillery.nomadicgardens.controllers;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.nomadicgardens.dao.ItemDAO;
import com.skilldistillery.nomadicgardens.entities.Item;
import com.skilldistillery.nomadicgardens.entities.User;

@Controller
public class ItemController {

	@Autowired
	private ItemDAO dao;

//	@RequestMapping(path = "home.do")
//	public ModelAndView index() {
//		ModelAndView mv = new ModelAndView();
//
//		mv.setViewName("home");
//		return mv;
//	}

	@RequestMapping(path = "findItemById.do")
	public ModelAndView findItemById(@RequestParam("itemId") int itemId) {
		ModelAndView mv = new ModelAndView();
		
		Item item = dao.findById(itemId);
		mv.addObject("item", item);
		mv.setViewName("userProfile");
		
		return mv;
	}
	
	@RequestMapping(path = "findItemByKeyword.do")
	public ModelAndView findProduceByKeyword(@RequestParam("keyword") String key) {
		ModelAndView mv = new ModelAndView();
		
		List<Item> keywordItems = dao.findByKeyword(key);
		mv.addObject("itemList", keywordItems);
		mv.setViewName("itemSearch");
		
		return mv;
	}

	@RequestMapping(path = "findAllItems.do")
	public ModelAndView findAllItems() {
		ModelAndView mv = new ModelAndView();

		List<Item> allItems = dao.findAll();
		mv.addObject("allItems", allItems);
		mv.setViewName("home");
		
		return mv;
	}

	@RequestMapping(path = "createItem.do", method = RequestMethod.POST)
	public ModelAndView addUser(Item item, String harvestDateString, String useByDateString) {
		ModelAndView mv = new ModelAndView();
		
		LocalDate harvestDateFormatted = LocalDate.parse(harvestDateString);
		LocalDate usedByDateFormatted = LocalDate.parse(useByDateString);
		
		
		
		
		item.setHarvestDate(harvestDateFormatted);
		item.setUseByDate(usedByDateFormatted);
		
		item = dao.create(item);

		User user = item.getUser();
		int userId = item.getUser().getId();
		List<Item> itemsList = user.getItems();
		
		mv.addObject("user", user);
		mv.addObject("itemsList", itemsList);
		mv.addObject("item", item);
		mv.addObject("userId", userId);
		mv.setViewName("redirect:findUserById.do");
		
		return mv;
	}

	@RequestMapping(path = "updateItem.do", method = RequestMethod.POST)
	public ModelAndView updateUser(@RequestParam("oldItemId") int oldId, Item item, String harvestDateString, String useByDateString) {
		ModelAndView mv = new ModelAndView();
		

		

		LocalDate harvestDateFormatted = LocalDate.parse(harvestDateString);
		LocalDate usedByDateFormatted = LocalDate.parse(useByDateString);
		
		item.setHarvestDate(harvestDateFormatted);
		item.setUseByDate(usedByDateFormatted);
		
		item = dao.update(oldId, item);
		
		
		User user = item.getUser();
		int userId = item.getUser().getId();
		List<Item> itemsList = user.getItems();
		
		mv.addObject("user", user);
		mv.addObject("userId", userId);
		mv.addObject("itemsList", itemsList);
		mv.setViewName("redirect:findUserById.do");
		
		return mv;
	}

	@RequestMapping(path = "destroyItem.do", method = RequestMethod.POST)
	public ModelAndView destroyUser(@RequestParam("itemId") int id) {
		ModelAndView mv = new ModelAndView();
		
		
		Item item = dao.findById(id);
		User user = item.getUser();
		int userId = item.getUser().getId();
		
		dao.destroy(id);
		
		List<Item> itemsList = user.getItems();
		
		mv.addObject("user", user);
		mv.addObject("userId", userId);
		mv.addObject("itemsList", itemsList);
		mv.setViewName("redirect:findUserById.do");
		
		return mv;
	}
}
