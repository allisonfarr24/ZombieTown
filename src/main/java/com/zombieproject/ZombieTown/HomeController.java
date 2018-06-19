package com.zombieproject.ZombieTown;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.zombieproject.ZombieTown.model.JsonResponse;

@Controller
public class HomeController {

	@Value("${zombietown.apikey}")
	private String key;
	

	@RequestMapping("/")
	public ModelAndView home() {
		
		return new ModelAndView("index");
	}

	@RequestMapping("/location")
	public ModelAndView index(@RequestParam("lat") double lat, @RequestParam("lng") double lng) {
		ModelAndView mv = new ModelAndView("index");
		RestTemplate restTemplate = new RestTemplate();
		JsonResponse response = restTemplate.getForObject(
				"https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=" + lat + "," + lng + "&radius=50000&type=hospital&key="
						+ key,
				JsonResponse.class);

		mv.addObject("test", response);
		return mv;
	}
	
	@RequestMapping("/scorecard")
	public ModelAndView place () {
		ArrayList <String> place = new ArrayList<> ();
		place.add("test1");
		place.add("test2");
		place.add("test3");
		return new ModelAndView ("scorecard", "place", place);
		
	}
	
}
