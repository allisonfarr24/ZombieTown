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
		ModelAndView mv = new ModelAndView("scorecard");
		String[] arr = {"hospital", "gas_station", "pharmacy", "police"};
		ArrayList<Integer> count = new ArrayList<>();
		for (int i = 0; i < arr.length; i++) {	
		RestTemplate restTemplate = new RestTemplate();
		JsonResponse response = restTemplate.getForObject(getType(lat, lng, arr[i]), JsonResponse.class);
		int num = response.getResults().length;
		count.add(num);
		}
		PrisonController p = new PrisonController();
		int prison = p.prisonCount(lat, lng);
		count.add(prison);
		mv.addObject("place", count);
		return mv;
	}
	
	private String getType(double lat, double lng, String type) {
		return "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=" + lat + "," + lng + "&radius=8000&type=" + type + "&key="
				+ key;
	}

}
