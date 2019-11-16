package com.skilldistillery.nomadicgardens.controllers;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.nomadicgardens.dao.AuthenticationDAOImpl;
import com.skilldistillery.nomadicgardens.entities.User;

@Controller
public class LoginController {
	
	@Autowired
	private AuthenticationDAOImpl authDao;
	
	@RequestMapping(path="login", method=RequestMethod.GET)
	public ModelAndView login() {
		User u = new User();
		ModelAndView mv = new ModelAndView("WEB-INF/login.jsp", "user", u);
		return mv;
	}
	
	@RequestMapping(path="login.do", method=RequestMethod.POST)
	public ModelAndView doLogin(@Valid User user, Errors errors) {
		ModelAndView mv = new ModelAndView();
		
		User loggedInUser = authDao.getUserByUsername(user.getUsername());
		// If the Username was not found, use the Errors object to reject the email, 
		// with the message "Email not found"
		if(loggedInUser == null) {
		  errors.rejectValue("userName", "error.userName", "Username not found");
		}
		else {
    		// TODO: Else if the user is not valid (isValidUser), use the Errors object to reject 
  		  // the password with the message "Incorrect password"
		  boolean isValidUser = authDao.isValidUser(user);
		  if(!isValidUser) {
		    errors.rejectValue("password", "error.password", "Incorrect password");
		  }
		}
		if (errors.getErrorCount() != 0) {
			mv.setViewName("WEB-INF/login.jsp");
			return mv;
		}
		mv.addObject("user", loggedInUser);
		mv.setViewName("WEB-INF/profile.jsp");
		return mv;
	}
}