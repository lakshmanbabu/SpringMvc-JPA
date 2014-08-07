package com.admin.portal.Service;

import java.util.List;

import com.admin.portal.Model.User;
import com.admin.portal.Model.UserRoles;

public interface UserService {

	public List<User> getUsersList();

	public User getUserById(Integer userId);

	public User updateUserDetails(User user);

	public void deleteUserById(Integer userId);

	public int saveUserDetails(User user);

	public void saveUserRole(UserRoles userRoles);

	public User getUserByName(String username);

	public void updateUserRole(UserRoles userRoles);

	public UserRoles getUserRoleById(Integer userId);

}
