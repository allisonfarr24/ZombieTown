package com.zombieproject.ZombieTown;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.zombieproject.ZombieTown.repository.PrisonRepository;

@Controller
public class PrisonController {

	@Autowired
	PrisonRepository p;

	// This method only needs to be run once to populate database in MySQL





//	 @RequestMapping("/prisontest")
//	 public ModelAndView prison() {
//	 ModelAndView mv = new ModelAndView("index");
//	 RestTemplate restTemplate = new RestTemplate();
//	 JsonPrisonResponse response = restTemplate.getForObject(
//	 "https://www.bop.gov/PublicInfo/execute/locations/?todo=query&output=json",
//	 JsonPrisonResponse.class);
//	
//	 Prison[] list = response.getLocations();
//	 System.out.println(list.toString());
//	 for (Prison prison : list) {
//	 p.save(prison);
//	 }
//	
//	 return mv;
//	 }





	
}

