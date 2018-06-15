package com.zombieproject.ZombieTown;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.zombieproject.ZombieTown.model.Results;

@Controller
public class HomeController {

	@Value("${zombietown.apikey}")
	private String key;

	@RequestMapping("/")
	public ModelAndView home() {
		System.out.println(key);
		return new ModelAndView("index");
	}

	@RequestMapping("/")
	public ModelAndView index(@RequestParam("lat") double lat, @RequestParam("lng") double lng) {
		ModelAndView mv = new ModelAndView("index");
		RestTemplate restTemplate = new RestTemplate();
		Results result = restTemplate.getForObject(
				"https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=" + lat + "," + lng + "&radius=50000&key="
						+ key,
				Results.class);

		mv.addObject("test", result);
		return mv;
	}

}
