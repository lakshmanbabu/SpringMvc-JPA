package com.admin.portal.Admin;

import java.io.File;
import java.io.IOException;
import java.security.Principal;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.admin.portal.Common.CommonController;
import com.admin.portal.Common.Email;
import com.admin.portal.Common.GenericResponse;
import com.admin.portal.Model.MessageFolder;
import com.admin.portal.Model.Notifications;
import com.admin.portal.Model.Promotions;
import com.admin.portal.Model.User;

@Controller
@RequestMapping("/admin")
public class ManagePromotionController extends CommonController{

	private static final Logger logger = LoggerFactory.getLogger(ManagePromotionController.class);
	
	@Value("${EmailContactus}")
	private String contactus;
	
	@Autowired
	ServletContext context;
	 @RequestMapping(value="/createPromotion", method = RequestMethod.GET)
	    public String viewNotifications(Model model,Principal principal) {
	    	
		 	String loggedUser=principal.getName();
			User user=userService.getUserByName(loggedUser);
			model.addAttribute("user", user);
			
			List<Notifications> nlist=articleService.getNotificationById(user.getUserId());
			logger.info("Notification List::"+nlist.size());
		 	model.addAttribute("nlist", nlist);
		 	
			List<MessageFolder> folderssize=inboxService.getMessageFolderListSize(user.getUserId(),user.getEmail());
			model.addAttribute("folderssize", folderssize);
			logger.info("folders size::"+folderssize.size());
			
	        return "admin/createPromotion";
	    }	
	 
	 @RequestMapping(value="/saveNewPromotion", method = RequestMethod.POST)
	    public  @ResponseBody GenericResponse saveNewPromotion(@ModelAttribute Promotions promotions, Model model,Principal principal,HttpServletRequest request,HttpServletResponse response1) {
	    	
		 	GenericResponse response=new GenericResponse();
		 
		 	String loggedUser=principal.getName();
			User user=userService.getUserByName(loggedUser);
			
			promotions.setCreatedDate(new Date());
			promotions.setUser(user);
			promotionService.savePromotion(promotions);
			
			Email email=new Email();
			if(user.getEmail()!=null){
				email.setMailto(user.getEmail());
				email.setFrom(user.getEmail());
			}else{
				email.setMailto("");
				email.setFrom("");
			}
			emailSender.sendProtomotion(promotions,user,email,request,response1);
			
			response.setError(false);
			response.setMessage("Ad Posted Successfully");
			
	        return response;
	    }	 
	 
	 @RequestMapping(value="/viewPostedAd", method = RequestMethod.GET)
	    public String viewPostedAd(Model model,Principal principal,HttpServletRequest request) throws IOException {
	    	
		 	String loggedUser=principal.getName();
			User user=userService.getUserByName(loggedUser);
			model.addAttribute("user", user);
			
			List<Notifications> nlist=articleService.getNotificationById(user.getUserId());
			logger.info("Notification List::"+nlist.size());
		 	model.addAttribute("nlist", nlist);
		 	
		 	List<Promotions> promotions=promotionService.getPromotionsById(user.getUserId());
		 	
		 	for(Promotions promotions2:promotions){
		 		if(promotions2.getAdLogoPath()!=null){
		 		    FileUtils.writeByteArrayToFile(new File(context.getRealPath("resources/Images/"+File.separator+promotions2.getAdLogoPath())), promotions2.getProtomoteLogo());
		 		 
		 		}
		 	}
		 	model.addAttribute("promotions", promotions);
		 	
			List<MessageFolder> folderssize=inboxService.getMessageFolderListSize(user.getUserId(),user.getEmail());
			model.addAttribute("folderssize", folderssize);
			logger.info("folders size::"+folderssize.size());
			
	        return "admin/viewPostedAd";
	    }	
	 
	 @RequestMapping(value="/singlePromotion/{promotionId}", method = RequestMethod.GET)
	    public  String singlePromotion(@PathVariable Integer promotionId,Model model,Principal principal) {
	    	
		 	String loggedUser=principal.getName();
			User user=userService.getUserByName(loggedUser);
			model.addAttribute("user", user);
			
			List<Notifications> nlist=articleService.getNotificationById(user.getUserId());
			logger.info("Notification List::"+nlist.size());
		 	model.addAttribute("nlist", nlist);
		 	
		 	Promotions promotions=promotionService.getPromotion(promotionId);
		 	model.addAttribute("promotions", promotions);
		 	
			List<MessageFolder> folderssize=inboxService.getMessageFolderListSize(user.getUserId(),user.getEmail());
			model.addAttribute("folderssize", folderssize);
			logger.info("folders size::"+folderssize.size());
			
	        return "admin/singlePromotion";
	    }	
	 
	 @RequestMapping(value="/editPromoteDetails", method = RequestMethod.GET)
	    public @ResponseBody Promotions editPromoteDetails(@RequestParam Integer promotionId,Model model,Principal principal) {
	  
			logger.info("getting article by id");
			Promotions promotions=promotionService.getPromotion(promotionId);
			
	        return promotions;
	    }
	 
		@SuppressWarnings("unused")
		@RequestMapping(value="/updatePromotion",method = RequestMethod.POST)
		public  String  updatePromotion(Promotions promotions,Model model,@RequestParam("file") MultipartFile file,HttpServletRequest request,Principal principal) throws IOException {

			logger.info("update admin profile ");
			
			String loggedUser=principal.getName();
			User userdetail=userService.getUserByName(loggedUser);
			String path=null;
			Promotions promotions2=null;
			if(promotions.getPromotionId()!=null){
				
			  path=context.getRealPath("/")+"resources/userImage/PromoteLogo"+promotions.getPromotionId()+".jpg";
				System.out.println(path);
				File createdfile = new File(path);

				try {
					FileUtils.writeByteArrayToFile(createdfile,file.getBytes());
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}		
				
				promotions2=promotionService.getPromotion(promotions.getPromotionId());
				promotions.setCreatedDate(promotions2.getCreatedDate());
				if(path!=null){
					promotions.setAdLogoPath(path);
				}else{
					promotions.setAdLogoPath("");
				}
				promotions.setUser(userdetail);
				promotions.setProtomoteLogo(file.getBytes());
				promotions.setAdLogoPath(file.getOriginalFilename());
				
				promotionService.savePromotion(promotions);
				
			}
			
			return "redirect:/admin/singlePromotion/"+promotions.getPromotionId();
		}	
}
