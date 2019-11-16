package com.skilldistillery.nomadicgardens.controllers;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.nomadicgardens.dao.AuthenticationDAO;
import com.skilldistillery.nomadicgardens.entities.User;

@Controller
public class RegistrationController {

	@Autowired
	private AuthenticationDAO authDao;

	@RequestMapping(path = "register.do", method = RequestMethod.GET)
	public ModelAndView register() {
		ModelAndView mv = new ModelAndView();
		User u = new User();
		mv.addObject("user", u);
		mv.setViewName("home");
		return mv;
	}

	@RequestMapping(path = "register.do", method = RequestMethod.POST)
	public String create(@Valid User user, Errors errors) {
		// If there are any errors, return the view 'home'
		if (errors.hasErrors()) {
			return "home";
		}
		if (!authDao.isUsernameUnique(user.getUsername())) {
			errors.rejectValue("username", "error.username", "Username already in use");
			return "home";
		}

		authDao.create(user);

		return "userProfile";
	}
}
