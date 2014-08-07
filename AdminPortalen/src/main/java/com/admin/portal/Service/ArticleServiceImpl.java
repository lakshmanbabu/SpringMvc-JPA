package com.admin.portal.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.admin.portal.Model.Article;
import com.admin.portal.Model.Notifications;
import com.admin.portal.Repository.ArticleRepository;
import com.admin.portal.Repository.NotificationRepository;

@Service
@Transactional
public class ArticleServiceImpl implements ArticleService {

	@Autowired
	ArticleRepository articleRepository;

	@Autowired
	NotificationRepository notificationRepository;
	
	@Override
	public void saveArticles(Article article) {
		articleRepository.save(article);
	}

	@Override
	public void saveNotification(Notifications notifications) {
		notificationRepository.save(notifications);
	}

	@Override
	public List<Article> getAllArticleById(Integer userId) {
		
		return articleRepository.findByIdAndFetchRolesEagerly(userId);
	}

	@Override
	public Article getArticleById(Integer articleId) {
		
		return articleRepository.findOne(articleId);
	}

	@Override
	public void deleteArticleById(Integer articleId) {
		articleRepository.delete(articleId);
		
	}

	@Override
	public List<Notifications> getNotificationById(Integer userId) {
		
		return notificationRepository.findByIdAndFetchRolesEagerly(userId);
	}

	@Override
	public void deleteNotificationById(Integer nId) {
		notificationRepository.delete(nId);
	}
}
