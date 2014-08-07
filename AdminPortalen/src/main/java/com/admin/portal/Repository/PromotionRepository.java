package com.admin.portal.Repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.admin.portal.Model.Promotions;
import com.admin.portal.Model.UserRoles;

public interface PromotionRepository extends JpaRepository<Promotions, Integer>{

	 @Query("SELECT p FROM Promotions p  WHERE p.user.userId =:userId")
	    public List<Promotions> findPromotionsById(@Param("userId") Integer userId);
}
