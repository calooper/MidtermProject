package com.skilldistillery.nomadicgardens.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skilldistillery.nomadicgardens.dao.UserDAO;
import com.skilldistillery.nomadicgardens.entities.User;

@Controller
public class RegistrationController {

	@Autowired
	private UserDAO authDao;

	@RequestMapping(path = "register.do", method = RequestMethod.POST)
	public String create(@Valid User user, Errors errors, HttpSession session) {
		// If there are any errors, return the view 'home'
		if (errors.hasErrors()) {
			return "home";
		}
		if (!authDao.isUsernameUnique(user.getUsername(), authDao.findAll())) {
			errors.rejectValue("username", "error.username", "Username already in use");
			return "home";
		}

		authDao.create(user);
		session.setAttribute("sessionUser", user);
		return "userProfile";
	}
}
