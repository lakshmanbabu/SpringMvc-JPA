package com.admin.portal.Admin;

import java.security.Principal;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

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
import com.admin.portal.Common.GenericResponse;
import com.admin.portal.Model.Category;
import com.admin.portal.Model.Notifications;
import com.admin.portal.Model.User;

@Controller
@RequestMapping("/admin")
public class ManageCategoryController extends CommonController {

	private static final Logger logger = LoggerFactory.getLogger(ManageCategoryController.class);

	 @RequestMapping(value = "/manageCategory", method = RequestMethod.GET)
		public String manageCategory(Model model,Locale locale,Principal principal) {
			
			System.out.println("manageCategory page");
			
			String loggedUser=principal.getName();
			User user=userService.getUserByName(loggedUser);
			model.addAttribute("user", user);
			
			List<Notifications> nlist=articleService.getNotificationById(user.getUserId());
			logger.info("Notification List::"+nlist.size());
		 	model.addAttribute("nlist", nlist);
		 	
			List<Category> clist=categoryService.getCategoryList();
			model.addAttribute("clist", clist);
			
			return "admin/manageCategory";
		}
	
	 @RequestMapping(value="/saveCategory", method = RequestMethod.POST)
	    public @ResponseBody GenericResponse saveCategory(@ModelAttribute Category category,Model model,Principal principal) {
		 	
		 GenericResponse response=new GenericResponse();
			logger.info("save Category");
			
				category.setCreatedDate(new Date());
				categoryService.saveCategory(category);
				response.setError(false);
				response.setMessage("Category Saved Successfully");
			
			
	        return response;
	    }	
	 
	 @RequestMapping(value="/editCategory",method = RequestMethod.GET)
		public @ResponseBody Category editUserDetails(@RequestParam("cId") Integer cId,Model model) {

			logger.info("manageUsers ");
			Category category=categoryService.getCategoryById(cId);
			
			return category;
		}
	 
	 @RequestMapping(value="/updateCategories", method = RequestMethod.POST)
	    public @ResponseBody GenericResponse updateArticle(@ModelAttribute Category category,Model model,Principal principal) {
		 	
		 GenericResponse response=new GenericResponse();
			logger.info("getting article by id");
			
			if(category.getcId()!=null){
				Category  category2=categoryService.getCategoryById(category.getcId());
				category.setCreatedDate(category2.getCreatedDate());
				categoryService.saveCategory(category);
				response.setError(false);
				response.setMessage("Category Updated Successfully");
			}else{
				
				response.setError(true);
				response.setMessage("Category Id Not Available. Please check !!!");
				
			}
			
	        return response;
	    }	
	 
	 @RequestMapping(value="/deleteCategory",method=RequestMethod.GET)
		public @ResponseBody GenericResponse deleteSelectedEducations(@RequestParam Integer cId, Model model,HttpServletRequest request){
		 GenericResponse response=new GenericResponse();
		 if(cId!=null){
			 categoryService.deleteCategoryById(cId);
		 	response.setError(false);
			response.setMessage("Category Deleted Successfully");
		 }else{
			 response.setError(true);
				response.setMessage("Category Not Available. Please check !!!");
		 }
			return response;
		}
}
