package com.skilldistillery.nomadicgardens.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.nomadicgardens.dao.GardenDAO;
import com.skilldistillery.nomadicgardens.entities.Garden;

public class GardenController {
	
	@Autowired
	private GardenDAO dao;

//	@RequestMapping(path = "home.do")
//	public ModelAndView index() {
//		ModelAndView mv = new ModelAndView();
//
//		mv.setViewName("home");
//		return mv;
//	}

	@RequestMapping(path = "findGardenById.do")
	public ModelAndView findGardenById(@RequestParam("gardenId") int gardenId) {
		ModelAndView mv = new ModelAndView();
		
		Garden garden = dao.findById(gardenId);
		mv.addObject("garden", garden);
		mv.setViewName("gardenProfile");
		
		return mv;
	}

	@RequestMapping(path = "findAllGardens.do")
	public ModelAndView findAllGardens() {
		ModelAndView mv = new ModelAndView();

		List<Garden> allGardens = dao.findAll();
		mv.addObject("allGardens", allGardens);
		mv.setViewName("home");
		
		return mv;
	}

	@RequestMapping(path = "createGarden.do", method = RequestMethod.POST)
	public ModelAndView addGarden(Garden garden) {
		ModelAndView mv = new ModelAndView();

		garden = dao.create(garden);
		mv.addObject("garden", garden);
		mv.setViewName("userProfile");
		
		return mv;
	}

	@RequestMapping(path = "updateGarden.do", method = RequestMethod.POST)
	public ModelAndView updateGarden(@RequestParam("oldItemId") int oldId, Garden garden) {
		ModelAndView mv = new ModelAndView();

		garden = dao.update(oldId, garden);
		mv.addObject("garden", garden);
		mv.setViewName("userProfile");
		
		return mv;
	}

	@RequestMapping(path = "destroyGarden.do", method = RequestMethod.POST)
	public ModelAndView destroyGarden(@RequestParam("itemId") int id) {
		ModelAndView mv = new ModelAndView();
		dao.destroy(id);
		mv.setViewName("redirect:home.do");
		
		return mv;
	}

}
