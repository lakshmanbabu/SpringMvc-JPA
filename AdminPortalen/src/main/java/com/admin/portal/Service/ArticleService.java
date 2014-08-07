package com.admin.portal.Service;

import java.util.List;

import com.admin.portal.Model.Article;
import com.admin.portal.Model.Notifications;

public interface ArticleService {

	public void saveArticles(Article article);

	public void saveNotification(Notifications notifications);

	public List<Article> getAllArticleById(Integer userId);

	public Article getArticleById(Integer articleId);

	public void deleteArticleById(Integer articleId);

	public List<Notifications> getNotificationById(Integer userId);

	public void deleteNotificationById(Integer nId);

}
