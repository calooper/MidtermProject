package com.skilldistillery.nomadicgardens.dao;

import java.util.List;
import java.util.Map;

import com.skilldistillery.nomadicgardens.entities.User;

public interface UserDAO {
	public User findById(int id);
	public List<User> findAll();
	public Map<String, User> populateMap();
	public User create(User user);
	public User update(int id, User user);
	public boolean destroy(int id);
}
