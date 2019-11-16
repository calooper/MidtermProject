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
	
	@RequestMapping(path="register.do", method=RequestMethod.GET)
	public ModelAndView register() {
		ModelAndView mv = new ModelAndView();
		// TODO: Create a user command object for use with the registration form,
		// set it in the model with the key "user",
		// and return the view 'WEB-INF/register.jsp'
		User u = new User();
		mv.addObject("user", u);
		mv.setViewName("register");
		return mv;
	}
	
	// TODO: Add the @Valid annotation to the User object
	// TODO: Inject the Errors object
	@RequestMapping(path="register.do", method=RequestMethod.POST)
	public String create(@Valid User user, Errors errors) {
		// TODO: 1. If there are any errors, return the view 'WEB-INF/register.jsp'
	  if(errors.hasErrors()) {
	    return "register";
	  }
		// TODO: 2. Check the email's uniqueness with the DAO's isEmailUnique method
		//          if the email already exists, add an additional error (use 
	  //          errors.rejectValue()...) and return the view 'WEB-INF/register.jsp'.
	  if(!authDao.isUsernameUnique(user.getUsername())) {
	    errors.rejectValue("email", "error.email", "Email already in use");
	    return "WEB-INF/register.jsp";
	  }
	  
	  // TODO: 3. Add the user to the DAO
	  authDao.create(user);
	  
		return "userProfile";
	}
}

