package com.zombieproject.ZombieTown;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController {

	@Value("${zombietown.apikey}")
	private String key;
	
	
		@RequestMapping("/")
		public ModelAndView home() {
			System.out.println(key);
			return new ModelAndView("index");
		}
}
