package com.admin.portal.Repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.admin.portal.Model.Article;

public interface ArticleRepository  extends JpaRepository<Article, Integer>{

	 @Query("SELECT p FROM Article p  WHERE p.user.userId =:userId")
	    public List<Article> findByIdAndFetchRolesEagerly(@Param("userId") Integer userId);
}
