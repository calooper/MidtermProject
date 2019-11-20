package com.skilldistillery.nomadicgardens.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.nomadicgardens.dao.PlotDAO;
import com.skilldistillery.nomadicgardens.entities.Plot;

@Controller
public class PlotController {

	@Autowired
	private PlotDAO dao;

//	@RequestMapping(path = "home.do")
//	public ModelAndView index() {
//		ModelAndView mv = new ModelAndView();
//
//		mv.setViewName("home");
//		return mv;
//	}

	@RequestMapping(path = "findPlotById.do")
	public ModelAndView findPlotById(@RequestParam("plotId") int plotId) {
		ModelAndView mv = new ModelAndView();
		
		Plot plot = dao.findById(plotId);
		mv.addObject("plot", plot);
		mv.setViewName("userProfile");
		
		return mv;
	}

	@RequestMapping(path = "findAllPlots.do")
	public ModelAndView findAllPlots() {
		ModelAndView mv = new ModelAndView();

		List<Plot> allPlots = dao.findAll();
		mv.addObject("allPlots", allPlots);
		mv.setViewName("home");
		
		return mv;
	}

	@RequestMapping(path = "createPlot.do", method = RequestMethod.POST)
	public ModelAndView addPlot(Plot plot) {
		ModelAndView mv = new ModelAndView();

		plot = dao.create(plot);
		mv.addObject("plot", plot);
		mv.setViewName("userProfile");
		
		return mv;
	}

	@RequestMapping(path = "updatePlot.do", method = RequestMethod.POST)
	public ModelAndView updatePlot(@RequestParam("oldPlotId") int oldId, Plot plot) {
		ModelAndView mv = new ModelAndView();

		plot = dao.update(oldId, plot);
		mv.addObject("plot", plot);
		mv.setViewName("userProfile");
		
		return mv;
	}
	@RequestMapping(path = "claimPlot.do", method = RequestMethod.POST)
	public ModelAndView claimPlot(@RequestParam("oldPlotId") int oldId, @RequestParam("userId") int userId) {
		ModelAndView mv = new ModelAndView();
//		int userId = Integer.parseInt(userInput);
		
		Plot plot = dao.findById(oldId);
		plot = dao.claimPlot(oldId, userId);
		
//		mv.addObject("plot", plot);
		mv.setViewName("redirect:findGardenById.do?gardenId=" + plot.getGarden().getId());
		
		return mv;
	}
	@RequestMapping(path = "unclaimPlot.do", method = RequestMethod.POST)
	public ModelAndView unclaimPlot(@RequestParam("oldPlotId") int oldId) {
		ModelAndView mv = new ModelAndView();
		
		Plot plot = dao.findById(oldId);
		plot = dao.unclaimPlot(oldId);
		
		
//		mv.addObject("plot", plot);
		mv.setViewName("redirect:findGardenById.do?gardenId=" + plot.getGarden().getId());
		
		return mv;
	}

	@RequestMapping(path = "destroyPlot.do", method = RequestMethod.POST)
	public ModelAndView destroyPlot(@RequestParam("plotId") int id) {
		ModelAndView mv = new ModelAndView();
		dao.destroy(id);
		mv.setViewName("redirect:home.do");
		
		return mv;
	}
}
