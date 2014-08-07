package com.admin.portal.Common;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;

import com.admin.portal.Service.ArticleService;
import com.admin.portal.Service.CategoryService;
import com.admin.portal.Service.InboxService;
import com.admin.portal.Service.PromotionService;
import com.admin.portal.Service.UserService;

public class CommonController {

	@Autowired
	protected ServletContext context;
	
	@Autowired
	protected EmailSender emailSender;
	
	@Autowired
	public UserService userService;
	
	@Autowired 
	public InboxService inboxService;
	
	@Autowired 
	public CategoryService categoryService;
	
	
	@Autowired 
	public ArticleService articleService;
	
	@Autowired 
	public PromotionService promotionService;
}
