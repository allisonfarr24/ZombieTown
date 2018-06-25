package com.zombieproject.ZombieTown;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.zombieproject.ZombieTown.model.GoogleMarks;
import com.zombieproject.ZombieTown.model.JsonResponse;
import com.zombieproject.ZombieTown.model.Results;
import com.zombieproject.ZombieTown.repository.PrisonRepository;

@Controller
public class PrisonController {

	@Autowired
	PrisonRepository p;

	// This method only needs to be run once to populate database in MySQL
	@Autowired
	HomeController h;


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
		mv.addObject("lat", -33.8);
		mv.addObject("lng", 151.15);
		
		
		return mv;
	}
	
	@RequestMapping("test2")
	public ModelAndView test2() {
		ModelAndView mv = new ModelAndView("map");
//		ModelAndView mv = new ModelAndView("/WEB-INF/views/map.jsp", "locations", allOfTheData)
		double lat = 42.3359;
		double lng = -83.0497;
		// Items in this array are place that we are searching for
		String[] arr = { "hospital", "gas_station", "pharmacy", "police" };
		// This array list holds count for each place
		ArrayList<JsonResponse> allOfTheData = new ArrayList<>();
		// Adds results from the google api
		for (int i = 0; i < arr.length; i++) {
			RestTemplate restTemplate = new RestTemplate();
			JsonResponse response = restTemplate.getForObject(getTypeUrl(lat, lng, arr[i]), JsonResponse.class);
			int num = response.getResults().length;
			allOfTheData.add(response);			
		}

		mv.addObject("locations", setGoogleMarks(allOfTheData.get(0).getResults()));
		
		mv.addObject("percent", "???");
		
		mv.addObject("lat", lat);
		mv.addObject("lng", lng);

		return mv;
		
	}
	
	public List<GoogleMarks> setGoogleMarks(Results[] results) {
		ArrayList<GoogleMarks> goMar = new ArrayList<>();
		for (Results result : results) {
//			String gName = result.getName();
			String gName = "hospital";

			double gLat = result.getGeometry().getLocation().getLat();
			double gLng = result.getGeometry().getLocation().getLng();
			goMar.add(new GoogleMarks(gName, gLat, gLng));
		}
		return goMar;
	}

	private String getTypeUrl(double lat, double lng, String type) {
		return "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=" + lat + "," + lng
				+ "&radius=8000&type=" + type + "&key=" + h.key;
	}
	
}

