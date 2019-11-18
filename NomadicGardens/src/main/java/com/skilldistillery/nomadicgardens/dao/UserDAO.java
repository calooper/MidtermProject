package com.skilldistillery.nomadicgardens.dao;

import java.util.List;

import com.skilldistillery.nomadicgardens.entities.User;

public interface UserDAO {
	public User findById(int id);
	public List<User> findAll();
	public User create(User user);
	public User update(int id, User user);
	public boolean destroy(int id);
	//ADDITIONS
	public boolean isUsernameUnique(String username, List<User> users);
	public User getUserByUsername(String username);
	public boolean isValidUser(User u);
	
	
	
}
