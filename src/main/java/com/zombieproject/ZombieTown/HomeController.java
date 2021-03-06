package com.zombieproject.ZombieTown;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
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
@SessionAttributes({"lati", "longi", "radi"})
public class HomeController {

	@Value("${zombietown.apikey}")
	private String key;
	
	@Value("${zombietown.apikey}")
	private String key2;

	@Autowired
	PrisonRepository p;

	@Autowired
	UserDataRepo u;

	private double lati;
	private double longi;
	private double radi;
	
	String[] goodStuff = { "gas_station", "pharmacy", "police", "prison" };
	String[] badStuff = { "hospital", "casino", "shopping_mall", "stadium" };

	@RequestMapping("/")
	public ModelAndView home() {

		return new ModelAndView("index");
	}
	// Button on the index page

	@RequestMapping("/location")
	public ModelAndView index(@RequestParam("lat") double lat, @RequestParam("lng") double lng,
			@RequestParam("radius") double radius, Model model) {
		System.out.println("location" + lat + " " + lng + " " + radius);
		
		lati = lat;
		longi = lng;
		radi = radius;
//		session.removeAttribute("lati");
//		session.removeAttribute("longi");
//		session.removeAttribute("radi");
		
		model.addAttribute("lati", lat);
		model.addAttribute("longi", lng);
		model.addAttribute("radi", radius);
		
//		ModelAndView mv = new ModelAndView("map");
		System.out.println(u.count());
		u.deleteAll();
		System.out.println(u.count());
		

//		ArrayList<GoogleMarks> locations = new ArrayList<>();

//		mv.addObject("lat", lat);
//		mv.addObject("lng", lng);
		// Items in this array are place that we are searching for
		String[] arr = { "hospital", "gas_station", "pharmacy", "police", "casino", "shopping_mall", "stadium" };
		// This array list holds count for each place
//		ArrayList<Integer> count = new ArrayList<>();
		// Adds results from the google api

		for (int i = 0; i < arr.length; i++) {
			RestTemplate restTemplate = new RestTemplate();
			JsonResponse response = restTemplate.getForObject(getTypeUrl(lat, lng, arr[i], radius), JsonResponse.class);
			int num = response.getResults().length;
			System.out.println(num);

			for (Results result : response.getResults()) {
				String gName = result.getName();
				double gLat = result.getGeometry().getLocation().getLat();
				double gLng = result.getGeometry().getLocation().getLng();
				double gDistance = prisonDistance(Double.toString(gLat), Double.toString(gLng), lat, lng);
				gDistance *= 0.621371;

				UserData userData = new UserData(arr[i], gName, Double.toString(gLat), Double.toString(gLng),
						String.format("%.2f", gDistance));
				u.save(userData);

			}
		}
		prisonData(lat, lng);
//			count.add(num);
		
		return new ModelAndView("redirect:viewmap");
		// Adds results from the prison data base
		// p is the autowire from the prison controller
//		int prison = prisonCount(lat, lng);
//		count.add(4, prison);
//		mv.addObject("place", count);

//		List<UserData> datas = u.findAll();
//		for (UserData data : datas) {
//			System.out.println(data);
//			locations.add(dataToMarks(data));
//		}
		
//		mv.addObject("locations", locations);

//		int percent = getPercent(count, radius);
//		mv.addObject("percent", percent);


	}

	@RequestMapping("/viewmap")
	public ModelAndView viewmap(Model model) {

		System.out.println("viewmap" + lati + " " + longi + " " + radi);
		ModelAndView mv = new ModelAndView("map");
		
		ArrayList<GoogleMarks> marks = new ArrayList<>();
		ArrayList<GoogleMarks> badmarks = new ArrayList<>();

		List<UserData> datas = u.findAll();
		for (UserData data : datas) {
			System.out.println(Arrays.asList(goodStuff).contains(data.getType()));
			if (Arrays.asList(goodStuff).contains(data.getType())) {
				marks.add(dataToMarks(data));			
			} else {
				badmarks.add(dataToMarks(data));
			}
		}
		
		mv.addObject("locations", marks);
		
		mv.addObject("badstuff", badmarks);
		
		
		ArrayList<Integer> count = getCount();
//		count.add(4, prisonCount(lati, longi));
		mv.addObject("place", count);

		int percent = getPercent(count, radi);
		mv.addObject("percent", percent);
				
		
		mv.addObject("lat", lati);
		mv.addObject("lng", longi);
		return mv;
	}
	
	public GoogleMarks dataToMarks(UserData userData) {
		String gName = userData.getName();
		double gLat = Double.parseDouble(userData.getLat());
		double gLng = Double.parseDouble(userData.getLng());

		return new GoogleMarks(gName, gLat, gLng);
	}


	// Helps us to keep from adding separate search methods
	private String getTypeUrl(double lat, double lng, String type, double radius) {
		return "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=" + lat + "," + lng + "&radius="
				+ radius + "&type=" + type + "&key=" + key2;
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

	public int prisonData(double lat, double lng) {
		int counter = 0;

		List<Prison> prisonList = p.findAll();
		for (Prison prison : prisonList) {

			if (!prison.getLatitude().isEmpty()) {
				double distance = prisonDistance(prison.getLatitude(), prison.getLongitude(), lat, lng);
				// if the distance is less than 8 kilometers
				if (distance < 8.0) {
					UserData userData = new UserData("Prison", prison.getCode(), prison.getLatitude(),
							prison.getLongitude(), String.format( "%.2f", (distance * 0.621371)));
					u.save(userData);

					counter++;
				}

			}

		}

		return counter;
	}

	public ArrayList<Integer> getCount() {
		ArrayList<Integer> count = new ArrayList<>();
		count.add(u.findByType("hospital").size());
		count.add(u.findByType("gas_station").size());
		count.add(u.findByType("pharmacy").size());
		count.add(u.findByType("police").size());
		count.add(u.findByType("prison").size());
		count.add(u.findByType("casino").size());
		count.add(u.findByType("shopping_mall").size());
		count.add(u.findByType("stadium").size());
		return count;
	}

	public int getPercent(ArrayList<Integer> count, double radius) {
		double percent = 0;
		percent = (count.get(1) * 1.5);
		percent += (count.get(2) * 2.2);
		percent += (count.get(3) * 1.5);
		percent += (count.get(4) * 2);

		if (radius == 4827) {
			
			percent = percent - ((count.get(0) * 0.02) * percent);

			percent = percent - ((count.get(5) * 0.01) * percent);

			percent = percent - ((count.get(6) * 0.02) * percent);

			percent = percent - ((count.get(7) * 0.01) * percent);
		}
		if (radius == 1609) {
			
			percent = percent - ((count.get(0) * 0.06) * percent);

			percent = percent - ((count.get(5) * 0.03) * percent);

			percent = percent - ((count.get(6) * 0.06) * percent);

			percent = percent - ((count.get(7) * 0.03) * percent);
			
			percent *= .2;
		}
		if (radius == 8045) {
			
			percent = percent - ((count.get(0) * 0.02) * percent);

			percent = percent - ((count.get(5) * 0.01) * percent);

			percent = percent - ((count.get(6) * 0.02) * percent);

			percent = percent - ((count.get(7) * 0.01) * percent);
			
			percent *= 2;
		}
		

		if (percent < 2) {
			percent = 2;		
		}
		
		if (percent > 99) {
			percent = 99;
		}

		return (int) percent;

	}

	@RequestMapping("/viewdetailsgood")
	public ModelAndView details1() {

		return new ModelAndView("viewdetailsgood");
	}

	@RequestMapping("/viewdetailsbad")
	public ModelAndView details2() {

		return new ModelAndView("viewdetailsbad");
	}

}


