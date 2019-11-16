package com.skilldistillery.nomadicgardens.dao;

import com.skilldistillery.nomadicgardens.entities.User;

public interface AuthenticationDAO {
	public User create(User user);
	public boolean isUsernameUnique(String email);
	public User getUserByUsername(String email);
	public boolean isValidUser(User u);

}
