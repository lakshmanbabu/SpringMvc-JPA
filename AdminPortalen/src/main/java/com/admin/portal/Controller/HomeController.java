package com.admin.portal.Controller;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.admin.portal.Common.CommonController;

@Controller
public class HomeController extends CommonController {

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String homePage(Model model,Locale locale) {
		
		System.out.println("Starting page");
		
		return "home";
		
	}
	
	@RequestMapping(value = "/aboutUs", method = RequestMethod.GET)
	public String aboutUs(Model model,Locale locale) {
		
		System.out.println("aboutUs page");
		
		return "aboutUs";
		
	}
	
	
	
}
