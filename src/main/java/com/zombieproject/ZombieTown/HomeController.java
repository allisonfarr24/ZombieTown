package com.zombieproject.ZombieTown;

import java.util.ArrayList;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.zombieproject.ZombieTown.model.JsonResponse;
import com.zombieproject.ZombieTown.repository.PrisonRepository;

@Controller
public class HomeController {

	@Value("${zombietown.apikey}")
	private String key;
	
	@Autowired
	PrisonController p;
	

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

		int prison = p.prisonCount(lat, lng);
		count.add(prison);
		mv.addObject("place", count);
		
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
	

	private String getType(double lat, double lng, String type) {
		return "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=" + lat + "," + lng + "&radius=8000&type=" + type + "&key="
				+ key;
	}


}
