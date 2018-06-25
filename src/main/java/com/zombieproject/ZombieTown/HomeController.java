package com.zombieproject.ZombieTown;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.zombieproject.ZombieTown.model.GoogleMarks;
import com.zombieproject.ZombieTown.model.JsonResponse;
import com.zombieproject.ZombieTown.model.Results;
import com.zombieproject.ZombieTown.model.prison.Prison;
import com.zombieproject.ZombieTown.repository.PrisonRepository;
import com.zombieproject.ZombieTown.userdata.UserData;
import com.zombieproject.ZombieTown.userdata.UserDataRepo;

@Controller
public class HomeController {

	@Value("${zombietown.apikey}")
	private String key;

	@Autowired
	PrisonRepository p;

	@Autowired
	UserDataRepo u;

	@RequestMapping("/")
	public ModelAndView home() {

		return new ModelAndView("index");
	}
	// Button on the index page

	@RequestMapping("/location")
	public ModelAndView index(@RequestParam("lat") double lat, @RequestParam("lng") double lng,
			@RequestParam("radius") double radius) {
		ModelAndView mv = new ModelAndView("map");
		System.out.println(u.count());
		if (u.count() > 0) {
			u.deleteAll();
		}

		ArrayList<GoogleMarks> locations = new ArrayList<GoogleMarks>();

		mv.addObject("lat", lat);
		mv.addObject("lng", lng);
		// Items in this array are place that we are searching for
		String[] arr = { "hospital", "gas_station", "pharmacy", "police", "casino", "shopping_mall", "stadium" };
		// This array list holds count for each place
		ArrayList<Integer> count = new ArrayList<>();
		// Adds results from the google api

		for (int i = 0; i < arr.length; i++) {
			RestTemplate restTemplate = new RestTemplate();
			JsonResponse response = restTemplate.getForObject(getTypeUrl(lat, lng, arr[i], radius), JsonResponse.class);
			int num = response.getResults().length;

			for (Results result : response.getResults()) {
				String gName = result.getName();
				double gLat = result.getGeometry().getLocation().getLat();
				double gLng = result.getGeometry().getLocation().getLng();
				double gDistance = prisonDistance(Double.toString(gLat), Double.toString(gLng), lat, lng);
				gDistance *= 0.621371;

				UserData userData = new UserData(arr[i], gName, Double.toString(gLat), Double.toString(gLng),
						Double.toString(gDistance));
				u.save(userData);

				GoogleMarks gMar = new GoogleMarks(gName, gLat, gLng);
				locations.add(gMar);

				System.out.println(userData);
			}

			count.add(num);
		}

		mv.addObject("locations", locations);

		// Adds results from the prison data base
		// p is the autowire from the prison controller
		int prison = prisonCount(lat, lng);
		count.add(prison);
		mv.addObject("place", count);

		int percent = getPercent(count);
		mv.addObject("percent", percent);

		mv.addObject("lat", lat);
		mv.addObject("lng", lng);

		return mv;
	}

	// Helps us to keep from adding separate search methods
	private String getTypeUrl(double lat, double lng, String type, double radius) {
		return "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=" + lat + "," + lng + "&radius="
				+ radius + "&type=" + type + "&key=" + key;
	}

	// Helper method to build the next page token url request call
	public String getNextPageUrl(JsonResponse response3) {
		return "https://maps.googleapis.com/maps/api/place/nearbysearch/json?pagetoken=" + response3.getNextPageToken()
				+ "&key=" + key;
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
				// if the distance is less than 8 kilometers
				if (distance < 8.0) {
					UserData userData = new UserData("Prison", prison.getCode(), prison.getLatitude(),
							prison.getLongitude(), Double.toString(distance * 0.621371));
					u.save(userData);

					counter++;
				}

			}

		}

		return counter;
	}

	public int getPercent(ArrayList<Integer> count) {
		double percent = 0;
		percent -= count.get(0);
		percent += count.get(1);
		percent += count.get(2);
		percent += count.get(3);
		percent += count.get(4);

		percent = (percent / 80) * 100;

		return (int) percent;

	}
}

// @RequestMapping("/viewdetails")
// public ModelAndView detials(@RequestParam("lat") double lat,
// @RequestParam("lng") double lng) {
// ModelAndView mv = new ModelAndView("viewdetails");
//
// String[] arr = { "hospital", "gas_station", "pharmacy", "police" };
//
//
// mv.addObject("lat", lat);
// mv.addObject("lng", lng);
// for (int i = 0; i < arr.length; i++) {
// RestTemplate restTemplate = new RestTemplate();
// Results result = restTemplate.getForObject(getTypeUrl(lat, lng, arr[i]),
// Results.class);
// String[] details = result.getTypes();
//
// System.out.println(details);
//
// mv.addObject("details", details);
//
// }
// return mv;
// }
//
// }
