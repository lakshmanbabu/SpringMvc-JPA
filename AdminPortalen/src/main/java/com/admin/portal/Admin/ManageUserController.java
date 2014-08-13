package com.admin.portal.Admin;

import java.io.File;
import java.io.IOException;
import java.security.Principal;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
import com.admin.portal.Model.User;
import com.admin.portal.Model.UserRoles;

@Controller
@RequestMapping("/admin")
public class ManageUserController extends CommonController{

	private static final Logger logger = LoggerFactory.getLogger(ManageUserController.class);
	
	
	
	 @RequestMapping(value="/createUser", method = RequestMethod.GET)
    public String createUser(Model model,Principal principal) {
    	
	 	String loggedUser=principal.getName();
		User user=userService.getUserByName(loggedUser);
		List<Notifications> nlist=articleService.getNotificationById(user.getUserId());
		
		logger.info("Notification List::"+nlist.size());
	 	model.addAttribute("nlist", nlist);
		model.addAttribute("user", user);
		
		List<MessageFolder> folderssize=inboxService.getMessageFolderListSize(user.getUserId(),user.getEmail());
		model.addAttribute("folderssize", folderssize);
		logger.info("folders size::"+folderssize.size());
		
        return "admin/createNewUser";
    }	  

	
	 @RequestMapping(value="/viewUserDetail", method = RequestMethod.GET)
	    public String viewUserDetail(Model model,Principal principal) {
	    	
		 	List<User> userslist=userService.getUsersList();
	        System.err.println(userslist.size());
		 	model.addAttribute("userslist", userslist);
		 	
		 	String loggedUser=principal.getName();
			User user=userService.getUserByName(loggedUser);
			List<Notifications> nlist=articleService.getNotificationById(user.getUserId());
			
			logger.info("Notification List::"+nlist.size());
		 	model.addAttribute("nlist", nlist);
			model.addAttribute("user", user);
			
			List<MessageFolder> folderssize=inboxService.getMessageFolderListSize(user.getUserId(),user.getEmail());
			model.addAttribute("folderssize", folderssize);
			logger.info("folders size::"+folderssize.size());
			
	        return "admin/viewUserDetail";
	    }	  
	
	 @RequestMapping(value="/saveUserDetails", method = RequestMethod.POST)
		public @ResponseBody GenericResponse signupProcess(@ModelAttribute User user,Model model, Locale locale,HttpServletRequest request,HttpServletResponse response1,Principal principal) {

			System.out.println("signup Process");
			String loggedUser=principal.getName();
			User userdetail=userService.getUserByName(loggedUser);
			
			GenericResponse response = new GenericResponse();
			try {
				if(userdetail.getUserRole().equalsIgnoreCase("ROLE_ADMIN")){
					user.setUserRole(user.getUserRole());
				}else{
					user.setUserRole("ROLE_USER");
				}
			user.setCreatedDate(new Date());
			user.setEnabled(false);
			
			int id=userService.saveUserDetails(user);
			
			UserRoles userRoles=new UserRoles();
			if(userdetail.getUserRole().equalsIgnoreCase("ROLE_ADMIN")){
				
				userRoles.setAuthority(user.getUserRole());
				
			}else{
				userRoles.setAuthority("ROLE_USER");
			}
			user.setUserId(id);
			userRoles.setUser(user);		
			userService.saveUserRole(userRoles);
			
			Email email=new Email();
			
			if(user.getEmail()!=null)
				email.setMailto(user.getEmail());
			else
				email.setMailto("");
			
			emailSender.sendWelcomeEmail(user,email,request,response1);
			
			response.setError(false);
			response.setMessage("User Registration Successfully");
			
			return response;
			
			}catch (Exception e) {	
				
				response.setError(true);
				response.setMessage(e.getMessage());				
				logger.info("SignUp Exceptipon:"+e.getMessage());
				
				return response;
			}
		}
	 
		@RequestMapping(value="/editUserDetails",method = RequestMethod.GET)
		public @ResponseBody User editUserDetails(@RequestParam("userId") Integer userId,Model model) {

			logger.info("manageUsers ");
			User user=userService.getUserById(userId);
			
			return user;
		}
		
		@RequestMapping(value="/updateUserDetails",method = RequestMethod.POST)
		public @ResponseBody String  updateUserDetails(@ModelAttribute("user") User user,Model model,Principal principal) {

			logger.info("manageUsers ");
			String loggedUser=principal.getName();
			User userdetail=userService.getUserByName(loggedUser);
			
			User user1=null;
			if(user.getUserId()!=null){
				
				if(userdetail.getUserRole().equalsIgnoreCase("ROLE_ADMIN")){
					user.setUserRole(user.getUserRole());
				}else{
					user.setUserRole("ROLE_USER");
				}
				user1=userService.getUserById(user.getUserId());
				user.setCreatedDate(user1.getCreatedDate());
				User user2=userService.updateUserDetails(user);
				
				UserRoles userRoles=userService.getUserRoleById(user2.getUserId());
				if(userdetail.getUserRole().equalsIgnoreCase("ROLE_ADMIN")){
					
					userRoles.setAuthority(user.getUserRole());
					
				}else{
					userRoles.setAuthority("ROLE_USER");
				}
				user.setUserId(userRoles.getUser().getUserId());
				userRoles.setUser(user);		
				userService.updateUserRole(userRoles);
			}
			
			List<MessageFolder> folderssize=inboxService.getMessageFolderListSize(user.getUserId(),user.getEmail());
			model.addAttribute("folderssize", folderssize);
			logger.info("folders size::"+folderssize.size());
			
			
			return "admin/viewUserDetail";
		}
		
		@RequestMapping(value="/deleteUser/{userId}",method=RequestMethod.GET)
		public @ResponseBody String deleteSelectedEducations(@PathVariable("userId") Integer userId, Model model,HttpServletRequest request){
			
			userService.deleteUserById(userId);
			
			return "admin/viewUserDetail";
		}
		
		@RequestMapping(value="/adminProfile",method=RequestMethod.GET)
		public String adminProfile(Model model,HttpServletRequest request,Principal principal){
			
			String loggedUser=principal.getName();
			User user=userService.getUserByName(loggedUser);
			model.addAttribute("user", user);
			
			List<Notifications> nlist=articleService.getNotificationById(user.getUserId());
			logger.info("Notification List::"+nlist.size());
		 	model.addAttribute("nlist", nlist);
			
			List<MessageFolder> folderssize=inboxService.getMessageFolderListSize(user.getUserId(),user.getEmail());
			model.addAttribute("folderssize", folderssize);
			logger.info("folders size::"+folderssize.size());
			
			return "admin/adminProfile";
		}
		
		@SuppressWarnings("unused")
		@RequestMapping(value="/updateadminProfile",method = RequestMethod.POST)
		public  String  updateadminProfile(User user,Model model,@RequestParam("file") MultipartFile file,HttpServletRequest request,Principal principal) {

			logger.info("update admin profile ");
			
			String loggedUser=principal.getName();
			User userdetail=userService.getUserByName(loggedUser);
			String path=null;
			User user1=null;
			if(user.getUserId()!=null){
				
			  path=context.getRealPath("/")+"resources/userImage/user"+user.getUserId()+".jpg";
				System.out.println(path);
				File createdfile = new File(path);

				try {
					FileUtils.writeByteArrayToFile(createdfile,file.getBytes());
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}		
				
				user1=userService.getUserById(user.getUserId());
				user.setCreatedDate(user1.getCreatedDate());
				if(path!=null){
					user.setImagePath(path);
				}else{
					user.setImagePath("");
				}
				userService.updateUserDetails(user);
				
				UserRoles userRoles=userService.getUserRoleById(user1.getUserId());
				if(userdetail.getUserRole().equalsIgnoreCase("ROLE_ADMIN")){
					
					userRoles.setAuthority(user.getUserRole());
					
				}else{
					userRoles.setAuthority("ROLE_USER");
				}
				user.setUserId(userRoles.getUser().getUserId());
				userRoles.setUser(user);		
				userService.updateUserRole(userRoles);
				
				model.addAttribute("update", "Admin Profile Updated Sucessfully");
			}
			
			List<Notifications> nlist=articleService.getNotificationById(user.getUserId());
			logger.info("Notification List::"+nlist.size());
		 	model.addAttribute("nlist", nlist);
		 	
			List<MessageFolder> folderssize=inboxService.getMessageFolderListSize(user.getUserId(),user.getEmail());
			model.addAttribute("folderssize", folderssize);
			logger.info("folders size::"+folderssize.size());
			
			return "admin/adminProfile";
		}	
		
}
