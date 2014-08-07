package com.admin.portal.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.admin.portal.Model.User;

@Repository
public interface UserRepository extends JpaRepository<User,Integer>{

	User findByUsername(String username);

}
