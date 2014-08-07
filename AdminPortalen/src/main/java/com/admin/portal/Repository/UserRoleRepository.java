package com.admin.portal.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.admin.portal.Model.UserRoles;

public interface UserRoleRepository extends JpaRepository<UserRoles, Integer> {

	 @Query("SELECT p FROM UserRoles p  WHERE p.user.userId =:userId")
	    public UserRoles findByIdAndFetchRolesEagerly(@Param("userId") Integer userId);
}
