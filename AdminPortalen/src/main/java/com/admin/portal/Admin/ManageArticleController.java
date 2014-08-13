package com.admin.portal.Admin;

import java.security.Principal;
import java.util.Date;
import java.util.List;

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
import com.admin.portal.Model.Article;
import com.admin.portal.Model.MessageFolder;
import com.admin.portal.Model.Notifications;
import com.admin.portal.Model.User;

@Controller
@RequestMapping("/admin")
public class ManageArticleController extends CommonController {

	private static final Logger logger = LoggerFactory.getLogger(ManageArticleController.class);

	 @RequestMapping(value="/createArticle", method = RequestMethod.GET)
	    public String createUser(Model model,Principal principal) {
	    	
		 	String loggedUser=principal.getName();
			User user=userService.getUserByName(loggedUser);
			model.addAttribute("user", user);
			
			List<Notifications> nlist=articleService.getNotificationById(user.getUserId());
			logger.info("Notification List::"+nlist.size());
		 	model.addAttribute("nlist", nlist);
		 	
			List<MessageFolder> folderssize=inboxService.getMessageFolderListSize(user.getUserId(),user.getEmail());
			model.addAttribute("folderssize", folderssize);
			logger.info("folders size::"+folderssize.size());
			
	        return "admin/createArticle";
	    }	 
	 
	 @RequestMapping(value="/saveUserArticles", method = RequestMethod.POST)
	    public  @ResponseBody GenericResponse saveUserArticles(@ModelAttribute Article article, Model model,Principal principal,HttpServletRequest request,HttpServletResponse response1) {
	    	
		 	GenericResponse response=new GenericResponse();
		 
		 	String loggedUser=principal.getName();
			User user=userService.getUserByName(loggedUser);
			
			article.setArticleCreatedDate(new Date());
			article.setUser(user);
			articleService.saveArticles(article);
			
			Email email=new Email();
			if(user.getEmail()!=null){
				email.setMailto(user.getEmail());
				email.setFrom(user.getEmail());
			}else{
				email.setMailto("");
				email.setFrom("");
			}
			emailSender.articleNotification(article,user,email,request,response1);
			
			response.setError(false);
			response.setMessage("Article Created Successfully");
			
	        return response;
	    }	 
	 
	 @RequestMapping(value="/viewArticle", method = RequestMethod.GET)
	    public String viewArticle(Model model,Principal principal) {
	    	
		 	String loggedUser=principal.getName();
			User user=userService.getUserByName(loggedUser);
			
			List<Article> articles=articleService.getAllArticleById(user.getUserId());
			List<Notifications> nlist=articleService.getNotificationById(user.getUserId());
			
			logger.info("Notification List::"+nlist.size());
		 	model.addAttribute("nlist", nlist);	
			model.addAttribute("user", user);
			model.addAttribute("articles", articles);
			
			List<MessageFolder> folderssize=inboxService.getMessageFolderListSize(user.getUserId(),user.getEmail());
			model.addAttribute("folderssize", folderssize);
			logger.info("folders size::"+folderssize.size());
			
	        return "admin/viewArticle";
	    }	 
	 
	 @RequestMapping(value="/editArticleDetails", method = RequestMethod.GET)
	    public @ResponseBody Article editArticleDetails(@RequestParam Integer articleId,Model model,Principal principal) {
	  
			logger.info("getting article by id");
			Article articles=articleService.getArticleById(articleId);
			
	        return articles;
	    }	
	 @RequestMapping(value="/updateArticle", method = RequestMethod.POST)
	    public @ResponseBody GenericResponse updateArticle(@ModelAttribute Article article,Model model,Principal principal) {
		 	
		 GenericResponse response=new GenericResponse();
			logger.info("getting article by id");
			
			if(article.getArticleId()!=null){
				Article articles=articleService.getArticleById(article.getArticleId());
				article.setUser(articles.getUser());
				article.setArticleCreatedDate(articles.getArticleCreatedDate());
				articleService.saveArticles(article);
				response.setError(false);
				response.setMessage("Article Updated Successfully");
			}else{
				response.setError(true);
				response.setMessage("Article Not Updated. Please check !!!");
				
			}
			
	        return response;
	    }	
	 
	 @RequestMapping(value="/deleteArticleDetails",method=RequestMethod.GET)
		public @ResponseBody GenericResponse deleteSelectedEducations(@RequestParam Integer articleId, Model model,HttpServletRequest request){
		 GenericResponse response=new GenericResponse();
		 if(articleId!=null){
		 	articleService.deleteArticleById(articleId);
		 	response.setError(false);
			response.setMessage("Article Deleted Successfully");
		 }else{
			 response.setError(true);
				response.setMessage("ArticleId Not Available. Please check !!!");
		 }
			return response;
		}
		
	 @RequestMapping(value="/viewNotifications", method = RequestMethod.GET)
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
			
	        return "admin/viewNotifications";
	    }	
	 
	 @RequestMapping(value="/deleteNotification",method=RequestMethod.GET)
		public @ResponseBody GenericResponse deleteNotification(@RequestParam Integer nId, Model model,HttpServletRequest request){
		 GenericResponse response=new GenericResponse();
		 
		 if(nId!=null){
		 	articleService.deleteNotificationById(nId);
		 	response.setError(false);
			response.setMessage("Notification Deleted Successfully");
		 }else{
			 response.setError(true);
				response.setMessage("NotificationId Not Available. Please check !!!");
		 }
			return response;
		}
	 
}
