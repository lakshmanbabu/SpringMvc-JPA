package com.admin.portal.Repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.admin.portal.Model.User;

@Repository
public interface UserRepository extends JpaRepository<User,Integer>{

	User findByUsername(String username);
	
	@Query("SELECT  p FROM User p  WHERE p.userRole ='ROLE_ADMIN'")
	public List<User> countApplicationAdmins();
	
	@Query("SELECT  p FROM User p  WHERE p.userRole ='ROLE_USER'")
	public List<User> countRegistedUsers();
	

}
