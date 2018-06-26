package com.zombieproject.ZombieTown;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.zombieproject.ZombieTown.userdata.UserDataRepo;

@Controller
public class ViewDetailsController {

	@Autowired
	UserDataRepo u;

	@RequestMapping("/viewdetailsgood2")
	public ModelAndView getDetailsGood() {
		ModelAndView mv = new ModelAndView("viewdetailsgood");

		mv.addObject("pharm", u.findByType("pharmacy"));
		mv.addObject("prison", u.findByType("prison"));
		mv.addObject("police", u.findByType("police"));
		mv.addObject("gas", u.findByType("gas_station"));
		

		return mv;
	}

	@RequestMapping("/viewdetailsbad2")
	public ModelAndView getDetailsBad() {
		ModelAndView mv = new ModelAndView("viewdetailsbad");

		mv.addObject("hospital", u.findByType("hospital"));
		mv.addObject("casino", u.findByType("casino"));
		mv.addObject("stadium", u.findByType("stadium"));
		mv.addObject("mall", u.findByType("shopping_mall"));;

		return mv;
	}

}
