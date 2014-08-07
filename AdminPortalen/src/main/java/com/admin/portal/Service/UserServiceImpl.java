package com.admin.portal.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.admin.portal.Dao.UserDao;
import com.admin.portal.Model.User;
import com.admin.portal.Model.UserRoles;
import com.admin.portal.Repository.UserRepository;
import com.admin.portal.Repository.UserRoleRepository;

@Service
@Transactional
public class UserServiceImpl implements UserService{

	@Autowired
	UserDao userDao;
	
	@Autowired
	UserRepository userRepository;
	
	@Autowired
	UserRoleRepository userRoleRepository;
	
	@Override
	public int saveUserDetails(User user) {
		
		User savedUser = userRepository.save(user);
		return savedUser.getUserId();
	}
	
	@Override
	public void saveUserRole(UserRoles userRoles) {
		userRoleRepository.save(userRoles);
	}
	
	@Override
	public List<User> getUsersList() {
		
		return userRepository.findAll();
	}

	@Override
	public User getUserById(Integer userId) {
		
		return userRepository.findOne(userId);
	}

	@Override
	public User updateUserDetails(User user) {
		User user1=userRepository.save(user);
		return user1;
	}

	@Override
	public void deleteUserById(Integer userId) {
		userRepository.delete(userId);
	}

	@Override
	public User getUserByName(String username) {
	
		return userRepository.findByUsername(username);
	}

	@Override
	public void updateUserRole(UserRoles userRoles) {
		userRoleRepository.save(userRoles);
		
	}

	@Override
	public UserRoles getUserRoleById(Integer userId) {
		
		return userRoleRepository.findByIdAndFetchRolesEagerly(userId);
	}

	

	

}
