package com.admin.portal.Admin;

import java.security.Principal;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.admin.portal.Common.CommonController;
import com.admin.portal.Common.Email;
import com.admin.portal.Common.GenericResponse;
import com.admin.portal.Model.Message;
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
		
		List<MessageFolder> folders=inboxService.getMessageFolderList(user.getUserId(),user.getEmail());
		List<MessageFolder> folderssize=inboxService.getMessageFolderListSize(user.getUserId(),user.getEmail());
		model.addAttribute("folders", folders);
		model.addAttribute("folderssize", folderssize);
		logger.info("folders size::"+folders.size());
		
		model.addAttribute("page", "mailBox");
		
        return "admin/mailBox";
    }	  
	
	
	 @RequestMapping(value="/updateMessageFolder", method = RequestMethod.POST)
    public  @ResponseBody GenericResponse updateMessageFolder(@RequestParam Integer messageId, Model model,Principal principal,HttpServletRequest request,HttpServletResponse response1) {
	
		 GenericResponse response=new GenericResponse();
		 
		 String loggedUser=principal.getName();
		 User user=userService.getUserByName(loggedUser);
		 
		 MessageFolder folders=inboxService.getMessageFolderDetail(messageId);
		 if(folders!=null){
			
			Set<MessageFolder> messageFolders = new HashSet<MessageFolder>();
			folders.setStatus(1);
			messageFolders.add(folders);
			folders.getMessage().setMessageFolders(messageFolders);
			inboxService.saveMessage(folders.getMessage());
			System.err.println("******Updated ******");
		 response.setError(false);
		 response.setMessage("Message Updated Successfully");
		 }else{
			 response.setError(true);
			 response.setMessage("Message some problem ! please check.. ");
		 }
		 
		 return response;
	
	}
	 
	 @RequestMapping(value="/sendComposeMail", method = RequestMethod.POST)
	    public  @ResponseBody GenericResponse sendComposeMail(@ModelAttribute Message message, Model model,Principal principal,HttpServletRequest request,HttpServletResponse response1) {
	    	
		 	GenericResponse response=new GenericResponse();
		 
		 	String loggedUser=principal.getName();
			User user=userService.getUserByName(loggedUser);
			
			
			Email email=new Email();
			if(user.getEmail()!=null){
				email.setFrom(user.getEmail());
				email.setMailto(message.getReceiverEmail());
				email.setTo(message.getCcEmail());
				email.setbCC(message.getBccEmail());
			}else{
				email.setMailto("");
				email.setFrom("");
				
			}
			emailSender.sendComposeEmail(message,user,email,request,response1);
			
			response.setError(false);
			response.setMessage("Article Created Successfully");
			
	        return response;
	    }	
	 
	 
	 
	 @RequestMapping(value="/sentItems", method = RequestMethod.GET)
	    public String sentItems(Model model,Principal principal) {
			logger.info("mail box page");
		 	String loggedUser=principal.getName();
			User user=userService.getUserByName(loggedUser);
			List<Notifications> nlist=articleService.getNotificationById(user.getUserId());
			
			logger.info("Notification List::"+nlist.size());
		 	model.addAttribute("nlist", nlist);
			model.addAttribute("user", user);
			
			List<MessageFolder> folders=inboxService.getSendItems(user.getUserId(),user.getEmail());
			List<MessageFolder> folderssize=inboxService.getMessageFolderListSize(user.getUserId(),user.getEmail());
			model.addAttribute("folders", folders);
			model.addAttribute("folderssize", folderssize);
			logger.info("folders size::"+folders.size());
			
			model.addAttribute("page", "sentItems");
	        return "admin/sentItems";
	    }	  
}
