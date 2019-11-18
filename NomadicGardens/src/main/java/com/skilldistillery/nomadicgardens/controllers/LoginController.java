package com.skilldistillery.nomadicgardens.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.nomadicgardens.dao.UserDAO;
import com.skilldistillery.nomadicgardens.entities.User;

@Controller
public class LoginController {
	
	@Autowired
	private UserDAO authDao;
	
	@RequestMapping(path = "/")
	public ModelAndView index() {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("home");
		return mv;
	}
	
	@RequestMapping(path="login", method=RequestMethod.GET)
	public ModelAndView login() {
		User u = new User();
		ModelAndView mv = new ModelAndView("home", "user", u);
		return mv;
	}
	
	@RequestMapping(path="login.do", method=RequestMethod.POST)
	public ModelAndView doLogin(@Valid User user, Errors errors, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		
		User loggedInUser = authDao.getUserByUsername(user.getUsername());
		// If the Username was not found, use the Errors object to reject the email, 
		// with the message "Username not found"
		if(loggedInUser == null) {
		  errors.rejectValue("username", "error.username", "Username not found");
		}
		else {
    	   // Else if the user is not valid (isValidUser), use the Errors object to reject 
  		  // the password with the message "Incorrect password"
		  boolean isValidUser = authDao.isValidUser(user);
		  if(!isValidUser) {
		    errors.rejectValue("password", "error.password", "Incorrect password");
		  }
		}
		if (errors.getErrorCount() != 0) {
			mv.setViewName("home");
			return mv;
		}
		session.setAttribute("sessionUser", loggedInUser);
//		mv.addObject("user", loggedInUser);
		mv.setViewName("home");
		return mv;
	}
	@RequestMapping(path="logout.do", method=RequestMethod.POST)
	public ModelAndView doLogout(@Valid User user, Errors errors, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		
		User loggedInUser = null;
		session.setAttribute("sessionUser", loggedInUser);
		
		mv.addObject("user", loggedInUser);
		mv.setViewName("home");
		return mv;

	}
}