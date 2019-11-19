package com.skilldistillery.nomadicgardens.controllers;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.nomadicgardens.dao.UserDAO;
import com.skilldistillery.nomadicgardens.entities.Garden;
import com.skilldistillery.nomadicgardens.entities.Item;
import com.skilldistillery.nomadicgardens.entities.Plot;
import com.skilldistillery.nomadicgardens.entities.User;

@Controller
public class UserController {

	@Autowired
	private UserDAO dao;
	
	@RequestMapping(path = {"resources.do"})
	public ModelAndView resrouces() {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("resources");
		return mv;
	}

	@RequestMapping(path = "findUserById.do")
	public ModelAndView findUserById(@RequestParam("userId") int id) {
		ModelAndView mv = new ModelAndView();
		System.out.println("***************** in user controller");
		User us = dao.findById(id);
		List<Item> itemsList = us.getItems();
		
		List<Plot> plots = us.getPlots();
		List<Garden> gardens = new ArrayList<>();
		for (Plot plot : plots) {
			if(!gardens.contains(plot.getGarden())) {
				gardens.add(plot.getGarden());
				
			}
			
		}
		
		
		System.out.println("***** items size" + itemsList.size());
		
		mv.addObject("gardens", gardens);
		mv.addObject("itemsList", itemsList);
		mv.addObject("user", us);
		mv.setViewName("userProfile");
		
		return mv;
	}

	@RequestMapping(path = "findAllUsers.do")
	public ModelAndView findUserById() {
		ModelAndView mv = new ModelAndView();

		List<User> allUsers = dao.findAll();
		mv.addObject("allUsers", allUsers);
		mv.setViewName("home");
		
		return mv;
	}

	@RequestMapping(path = "createUser.do", method = RequestMethod.POST)
	public ModelAndView addUser(User user) {
		ModelAndView mv = new ModelAndView();

		user = dao.create(user);
		mv.addObject("user", user);
		mv.setViewName("userProfile");
		
		return mv;
	}

	@RequestMapping(path = "updateUser.do", method = RequestMethod.POST)
	public ModelAndView updateUser(@RequestParam("oldUserId") int oldId, User user) {
		ModelAndView mv = new ModelAndView();

		user = dao.update(oldId, user);
		mv.addObject("user", user);
		mv.setViewName("userProfile");
		
		return mv;
	}

	@RequestMapping(path = "destroyUser.do", method = RequestMethod.POST)
	public ModelAndView destroyUser(@RequestParam("userId") int id) {
		ModelAndView mv = new ModelAndView();
		dao.destroy(id);
		mv.setViewName("redirect:home.do");
		
		return mv;
	}
}
