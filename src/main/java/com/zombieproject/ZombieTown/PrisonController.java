package com.zombieproject.ZombieTown;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.zombieproject.ZombieTown.model.prison.Prison;
import com.zombieproject.ZombieTown.repository.PrisonRepository;

@Controller
public class PrisonController {

	@Autowired
	static PrisonRepository p;

	// This method only needs to be run once to populate database in MySQL
	// @RequestMapping("/prisontest")
	// public ModelAndView prison() {
	// ModelAndView mv = new ModelAndView("index");
	// RestTemplate restTemplate = new RestTemplate();
	// JsonPrisonResponse response = restTemplate.getForObject(
	// "https://www.bop.gov/PublicInfo/execute/locations/?todo=query&output=json",
	// JsonPrisonResponse.class);
	//
	// Prison[] list = response.getLocations();
	// System.out.println(list.toString());
	// for (Prison prison : list) {
	// p.save(prison);
	// }
	//
	// return mv;
	// }

	public static double prisonDistance(String latitude, String longitude, double lat, double lng) {

		// lat1 and lon1 are Strings coming from database
		// lat2 and lon2 are doubles coming from Location POJO
		double lat1 = Double.parseDouble(latitude);
		double lon1 = Double.parseDouble(longitude);
		double lat2 = lat;
		double lon2 = lng;

		return Haversine.haversine(lat1, lon1, lat2, lon2);
	}

	public static int prisonCount(double lat, double lng) {
		int counter = 0;

		List<Prison> prisonList = p.findAll();

		for (Prison prison : prisonList) {
			
			if (prison.getLatitude() != null) {
				double distance = prisonDistance(prison.getLatitude(), prison.getLongitude(), lat, lng);
				if (distance < 8.0) {
					counter++;
				}

			}

		}

		return counter;
	}

}
