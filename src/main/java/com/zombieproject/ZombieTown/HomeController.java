package com.zombieproject.ZombieTown;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.zombieproject.ZombieTown.model.JsonResponse;
import com.zombieproject.ZombieTown.model.prison.Prison;
import com.zombieproject.ZombieTown.repository.PrisonRepository;

@Controller
public class HomeController {

	@Value("${zombietown.apikey}")
	private String key;
	
	@Autowired
	PrisonRepository p;
	

	@RequestMapping("/")
	public ModelAndView home() {
		
		return new ModelAndView("index");
	}
	//Button on the index page
	
	@RequestMapping("/location")
	public ModelAndView index(@RequestParam("lat") double lat, @RequestParam("lng") double lng) {
		ModelAndView mv = new ModelAndView("scorecard");
		//Items in this array are place that we are searching for
		String[] arr = {"hospital", "gas_station", "pharmacy", "police"};
		//This array list holds count for each place
		ArrayList<Integer> count = new ArrayList<>();
		//Adds results from the google api
		for (int i = 0; i < arr.length; i++) {	
		RestTemplate restTemplate = new RestTemplate();
		JsonResponse response = restTemplate.getForObject(getType(lat, lng, arr[i]), JsonResponse.class);
		int num = response.getResults().length;
		count.add(num);
		}
		//Adds results from the prison data base
		//p is the autowire from the prison controller
		int prison = prisonCount(lat, lng);
		count.add(prison);
		mv.addObject("place", count);
		
		return mv;
	}
	
	
	//Helps us to keep from adding separate search methods
	private String getType(double lat, double lng, String type) {
		return "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=" + lat + "," + lng + "&radius=8000&type=" + type + "&key="
				+ key;
	}
	public double prisonDistance(String latitude, String longitude, double lat, double lng) {


		// lat1 and lon1 are Strings coming from database
		// lat2 and lon2 are doubles coming from Location POJO
		double lat1 = Double.parseDouble(latitude);
		double lon1 = Double.parseDouble(longitude);
		double lat2 = lat;
		double lon2 = lng;

		return Haversine.haversine(lat1, lon1, lat2, lon2);
	}
	public int prisonCount(double lat, double lng) {
		int counter = 0;

		List<Prison> prisonList = p.findAll();
		for (Prison prison : prisonList) {
			
			if (!prison.getLatitude().isEmpty()) {
				double distance = prisonDistance(prison.getLatitude(), prison.getLongitude(), lat, lng);
				//if the distance is less than 8 kilometers
				if (distance < 8.0) {
					counter++;
				}

			}

		}

		return counter;
	}
}
