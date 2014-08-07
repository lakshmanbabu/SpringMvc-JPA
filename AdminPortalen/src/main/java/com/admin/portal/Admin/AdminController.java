package com.admin.portal.Admin;

import java.security.Principal;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.admin.portal.Common.CommonController;
import com.admin.portal.Model.Notifications;
import com.admin.portal.Model.Promotions;
import com.admin.portal.Model.User;

@Controller
@RequestMapping("/admin")
public class AdminController extends CommonController {

	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	  @RequestMapping(value="/login")
	    public String showLogin(Model model) {
	        
	        return "admin/adminLogin";
	    }	  
	
	@RequestMapping("/adminHome")
	public String signup(Locale locale,Model model,Principal principal,HttpSession session) {

		System.out.println("main home page");
		String loggedUser=principal.getName();
		
		session.setAttribute("loggedUser", loggedUser);
		
		User user=userService.getUserByName(loggedUser);
		model.addAttribute("user", user);
		
		List<User> userslist=userService.getUsersList();
		
        System.err.println(userslist.size());
	 	model.addAttribute("userslist", userslist);
		List<Notifications> nlist=articleService.getNotificationById(user.getUserId());
		logger.info("Notification List::"+nlist.size());
	 	model.addAttribute("nlist", nlist);
	 	
	 	List<Promotions> promotions=promotionService.getPromotionsById(user.getUserId());
	 	model.addAttribute("promotions", promotions);
	 	
		model.addAttribute("page", "adminHome");
		return "admin/adminHome";
	}
	
	@RequestMapping("/profile")
	public String profile(Locale locale,Model model,Principal principal) {

		String username=principal.getName();
		User user=userService.getUserByName(username);
		System.out.println("main home page");
		model.addAttribute("page", "adminHome");
		
		return "admin/profile";
	}
	
	
	 
	 @RequestMapping(value="/loginfailed", method = RequestMethod.GET)
	    public String loginerror(Model model) {
	    	model.addAttribute("error", "true");
	        
	        return "admin/adminLogin";
	    }	 
	 
	 @RequestMapping(value="/logout" )
		public String logOutd(Model model,HttpServletRequest request){
			
			logger.info("logout"); 
			request.getSession().invalidate();
			
			return "redirect:/admin/lockscreen";
		}
	 
	 @RequestMapping(value = "/lockscreen", method = RequestMethod.GET)
		public String lockscreen(Model model,Locale locale) {
			
			System.out.println("lockscreen page");
			
			return "admin/lockscreen";
		}
}
