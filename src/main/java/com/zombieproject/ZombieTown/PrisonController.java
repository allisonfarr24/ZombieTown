package com.zombieproject.ZombieTown;

import java.util.Arrays;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.zombieproject.ZombieTown.model.GoogleMarks;
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

	@RequestMapping("test")
	public ModelAndView test() {
		ModelAndView mv = new ModelAndView("map");
		
		GoogleMarks g1 = new GoogleMarks("Bondi Beach", -33.890542, 151.274856);
		GoogleMarks g2 = new GoogleMarks("Coogee Beach", -33.923036, 151.259052);
		GoogleMarks g3 = new GoogleMarks("Cronulla Beach", -34.028249, 151.157507);
		GoogleMarks g4 = new GoogleMarks("Manly Beach", -33.80010128657071, 151.28747820854187);
		GoogleMarks g5 = new GoogleMarks("Maroubra Beach", -33.950198, 151.259302);
		
		GoogleMarks[] goMar = {g1, g2, g3, g4, g5};
		
		mv.addObject("locations", Arrays.asList(goMar));
		mv.addObject("lat", 33.8);
		mv.addObject("lng", 151.15);
		
		
		return mv;
	}
	



	
}

