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
public class ManageMailBoxController extends CommonController {

	private static final Logger logger = LoggerFactory.getLogger(ManageMailBoxController.class);
	
	@RequestMapping(value="/mailBox", method = RequestMethod.GET)
    public String createUser(Model model,Principal principal) {
		logger.info("mail box page");
	 	String loggedUser=principal.getName();
		User user=userService.getUserByName(loggedUser);
		List<Notifications> nlist=articleService.getNotificationById(user.getUserId());
		
		logger.info("Notification List::"+nlist.size());
	 	model.addAttribute("nlist", nlist);
		model.addAttribute("user", user);
		
		//List<MessageFolder> folders=inboxService.getMessageFolderList();
		
        return "admin/mailBox";
    }	  
	
}
