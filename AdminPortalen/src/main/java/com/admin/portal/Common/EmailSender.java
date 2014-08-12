package com.admin.portal.Common;

import java.security.Principal;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.velocity.app.VelocityEngine;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Component;
import org.springframework.ui.velocity.VelocityEngineUtils;

import com.admin.portal.Model.Article;
import com.admin.portal.Model.Message;
import com.admin.portal.Model.MessageFolder;
import com.admin.portal.Model.Notifications;
import com.admin.portal.Model.Promotions;
import com.admin.portal.Model.User;
import com.admin.portal.Service.ArticleService;
import com.admin.portal.Service.InboxService;

@Component("emailSender")
public class EmailSender {

	@Value("${EmailContactus}")
	private String contactus;
	
	@Value("${adminContact}")
	private String adminContact;
	
	private Logger logger = Logger.getLogger(EmailSender.class);
	
	public static String host;
	@Autowired
	private JavaMailSender mailSender;
	
	@Autowired 
	public ArticleService articleService;
	
	@Autowired
	private VelocityEngine velocityEngine;

	@Autowired 
	public InboxService inboxService;
	
	static {
		// protocol=$"{mail.http.request.protocol}";
	}


	public void sendWelcomeEmail(final User user, final Email email,final HttpServletRequest request,final HttpServletResponse response1) {
		final Message localmessage = new Message();
		final Notifications notifications = new Notifications();
		MimeMessagePreparator preparator = new MimeMessagePreparator() {
			public void prepare(MimeMessage mimeMessage) throws Exception {
				Map<String, Object> model = new HashMap<String, Object>();
				MimeMessageHelper message = new MimeMessageHelper(mimeMessage,true);
				model.put("home", host);
				model.put("user",user);
				message.setTo(email.getMailto());
				message.setFrom(adminContact);
				message.setSubject("Admin Portal Account Created Successfully ! ");
				String body = VelocityEngineUtils.mergeTemplateIntoString(velocityEngine,"welcomeUser.vm", "UTF-8", model);
				message.setText(body, true);
				
				localmessage.setSubject("Your Account Created Successfully !");
				localmessage.setBody(body);
				email.setFrom(adminContact);
				
				// Set Notification
				notifications.setNotifactionMsg("Admin Portal Account Created Successfully");;
				notifications.setCheckMsg("new");
			}
		};
		mailSender.send(preparator);
		savelocalMessage(localmessage, email,user);
		saveNotificationMessage(notifications, email,user);
		System.out.println("welcome email sent successfully");
	}


	public void articleNotification(final Article article, final User user, final Email email,final HttpServletRequest request, final HttpServletResponse response1) {
		final Notifications notifications = new Notifications();
		MimeMessagePreparator preparator = new MimeMessagePreparator() {
			public void prepare(MimeMessage mimeMessage) throws Exception {
				Map<String, Object> model = new HashMap<String, Object>();
				MimeMessageHelper message = new MimeMessageHelper(mimeMessage,true);
				model.put("home", host);
				model.put("article",article);
				model.put("user",user);
				message.setTo(email.getMailto());
				message.setFrom(adminContact);
				//message.setSubject("Article Created Successfully");
				String subject = VelocityEngineUtils.mergeTemplateIntoString(velocityEngine,"createArticleSubject.vm", "UTF-8", model);
				message.setSubject(subject);
				
				String body = VelocityEngineUtils.mergeTemplateIntoString(velocityEngine,"createArticleBody.vm", "UTF-8", model);
				message.setText(body, true);
				
				notifications.setNotifactionMsg(subject);
				notifications.setCheckMsg("article");
				email.setFrom(adminContact);
			}
		};
		mailSender.send(preparator);
		saveNotificationMessage(notifications, email,user);
		
		System.out.println("Mail sent successfully");
	}
	
	public void sendProtomotion(final Promotions promotions, final User user, final Email email,final HttpServletRequest request, final HttpServletResponse response1) {
		final Notifications notifications = new Notifications();
		final Message localmessage = new Message();
		MimeMessagePreparator preparator = new MimeMessagePreparator() {
			public void prepare(MimeMessage mimeMessage) throws Exception {
				Map<String, Object> model = new HashMap<String, Object>();
				MimeMessageHelper message = new MimeMessageHelper(mimeMessage,true);
				model.put("home", host);
				model.put("promotions",promotions);
				model.put("user",user);
				message.setTo(email.getMailto());
				message.setFrom(adminContact);
				//message.setSubject("Article Created Successfully");
				String subject = VelocityEngineUtils.mergeTemplateIntoString(velocityEngine,"createPromotionSubject.vm", "UTF-8", model);
				message.setSubject(subject);
				
				String body = VelocityEngineUtils.mergeTemplateIntoString(velocityEngine,"createPromotionBody.vm", "UTF-8", model);
				message.setText(body, true);
				
				localmessage.setSubject(subject);
				localmessage.setBody(body);
				
				
				notifications.setNotifactionMsg(subject);
				notifications.setCheckMsg("promote");
				email.setFrom(adminContact);
				}
			};
		mailSender.send(preparator);
		saveNotificationMessage(notifications, email,user);
		savelocalMessage(localmessage, email,user);
		System.out.println("mail send successfully");
	}

	public void saveNotificationMessage(Notifications notifications,Email email, User user) {
		
		notifications.setNtDate(new Date());
		notifications.setUser(user);
		notifications.setSenderEmail(email.getFrom());
		notifications.setReceiverEmail(email.getMailto());
		
		articleService.saveNotification(notifications);
	}


	@SuppressWarnings("unchecked")	
	public void savelocalMessage(Message localMessage, Email email, User user) {
		logger.info("=====>All Email Saving In the local database<==========\n");
		
		
		
		Set<MessageFolder> messageFolders = new HashSet<MessageFolder>();
		
		localMessage.setSentDateTime(new Date());
		localMessage.setSenderEmail(email.getFrom());

		MessageFolder receivermessageFolder = new MessageFolder();
			receivermessageFolder.setMessage(localMessage);
			receivermessageFolder.setStatus(0);
			receivermessageFolder.setUser(user);
			receivermessageFolder.setReceiverEmail(email.getMailto());
			receivermessageFolder.setSenderEmail(email.getFrom());
			messageFolders.add(receivermessageFolder);
		
		if (messageFolders.size() >= 1) {
			localMessage.setMessageFolders(messageFolders);
			inboxService.saveMessage(localMessage);
		}
		
		logger.info("=====>All Emai saved successfully<==========");
	}


	

}
