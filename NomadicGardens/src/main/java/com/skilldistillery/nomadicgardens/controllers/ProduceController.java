package com.skilldistillery.nomadicgardens.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.nomadicgardens.dao.ProduceDAO;
import com.skilldistillery.nomadicgardens.entities.Produce;

@Controller
public class ProduceController {

	@Autowired
	private ProduceDAO dao;

//	@RequestMapping(path = "home.do")
//	public ModelAndView index() {
//		ModelAndView mv = new ModelAndView();
//
//		mv.setViewName("home");
//		return mv;
//	}

	@RequestMapping(path = "findProduceById.do")
	public ModelAndView findProduceById(@RequestParam("produceId") int produceId) {
		ModelAndView mv = new ModelAndView();
		
		Produce produce = dao.findById(produceId);
		mv.addObject("produce", produce);
		mv.setViewName("userProfile");
		
		return mv;
	}


	@RequestMapping(path = "findAllProduce.do")
	public ModelAndView findAllProduce() {
		ModelAndView mv = new ModelAndView();

		List<Produce> allProduce = dao.findAll();
		mv.addObject("allProduce", allProduce);
		mv.setViewName("home");
		
		return mv;
	}

	@RequestMapping(path = "createProduce.do", method = RequestMethod.POST)
	public ModelAndView addProduce(Produce produce) {
		ModelAndView mv = new ModelAndView();

		produce = dao.create(produce);
		mv.addObject("produce", produce);
		mv.setViewName("userProfile");
		
		return mv;
	}

	@RequestMapping(path = "updateProduce.do", method = RequestMethod.POST)
	public ModelAndView updateProduce(@RequestParam("oldProduceId") int oldId, Produce produce) {
		ModelAndView mv = new ModelAndView();

		produce = dao.update(oldId, produce);
		mv.addObject("produce", produce);
		mv.setViewName("userProfile");
		
		return mv;
	}

	@RequestMapping(path = "destroyProduce.do", method = RequestMethod.POST)
	public ModelAndView destroyProduce(@RequestParam("produceId") int id) {
		ModelAndView mv = new ModelAndView();
		dao.destroy(id);
		mv.setViewName("redirect:home.do");
		
		return mv;
	}
}
