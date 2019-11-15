package com.skilldistillery.nomadicgardens.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skilldistillery.nomadicgardens.dao.UserDAO;

@Controller
public class UserController {
	
	@Autowired
	private UserDAO userDAO;
	
	@RequestMapping(path="/", method = RequestMethod.GET)
	public String index() {
	  
	  return "home";
	}

}
