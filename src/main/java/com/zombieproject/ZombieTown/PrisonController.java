package com.zombieproject.ZombieTown;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.zombieproject.ZombieTown.model.Prison;
import com.zombieproject.ZombieTown.repository.PrisonRepository;

@Controller
public class PrisonController {
	
	@Autowired
	PrisonRepository p;
	
	@RequestMapping("/prison")
	public ModelAndView prison() {
		ModelAndView mv = new ModelAndView("index");
		RestTemplate restTemplate = new RestTemplate();
		Prison prison = restTemplate.getForObject(
				"https://www.bop.gov/PublicInfo/execute/locations/?todo=query&output=json",
				Prison.class);
		mv.addObject("test", prison);

		return mv;
	}

}