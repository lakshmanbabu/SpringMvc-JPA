package com.admin.portal.Repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.admin.portal.Model.Notifications;

public interface NotificationRepository extends JpaRepository<Notifications, Integer>{

	@Query("SELECT p FROM Notifications p  WHERE p.user.userId =:userId")
	public List<Notifications> findByIdAndFetchRolesEagerly(@Param("userId")Integer userId);

}
