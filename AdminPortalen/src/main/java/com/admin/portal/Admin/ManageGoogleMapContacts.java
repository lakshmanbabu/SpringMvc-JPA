package com.admin.portal.Admin;

import java.security.Principal;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.admin.portal.Common.CommonController;
import com.admin.portal.Model.MessageFolder;
import com.admin.portal.Model.Notifications;
import com.admin.portal.Model.User;

@Controller
@RequestMapping("/admin")
public class ManageGoogleMapContacts extends CommonController {

	private static final Logger logger = LoggerFactory.getLogger(ManageGoogleMapContacts.class);
	
	 @RequestMapping(value="/manageMap", method = RequestMethod.GET)
	 public String manageMap(Model model,Principal principal) {
   	
	 	String loggedUser=principal.getName();
		User user=userService.getUserByName(loggedUser);
		List<Notifications> nlist=articleService.getNotificationById(user.getUserId());
		
		logger.info("Notification List::"+nlist.size());
	 	model.addAttribute("nlist", nlist);
		model.addAttribute("user", user);
		
		List<MessageFolder> folderssize=inboxService.getMessageFolderListSize(user.getUserId(),user.getEmail());
		model.addAttribute("folderssize", folderssize);
		logger.info("folders size::"+folderssize.size());
		
       return "admin/manageMap";
   }	  

}
