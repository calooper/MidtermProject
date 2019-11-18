package com.skilldistillery.nomadicgardens.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

import com.skilldistillery.nomadicgardens.entities.User;

@Repository
public class AuthenticationDAOImpl implements AuthenticationDAO {
	private UserDAOImpl userDAO = new UserDAOImpl();
	private Map<String, User> users = userDAO.populateMap();

	@Override
	public User create(User user) {
		if (isUsernameUnique(user.getUsername())) {
			users.put(user.getUsername(), user);
			return user;
		}
		return null;
	}

	@Override
	public boolean isUsernameUnique(String userName) {

		return !users.containsKey(userName);
	}

	@Override
	public User getUserByUsername(String userName) {
		if (users.containsKey(userName)) {
			return users.get(userName);
		}
		return null;
	}

	@Override
	public boolean isValidUser(User u) {
		if (getUserByUsername(u.getUsername()) == null) {
			return false;
		}
		if (users.get(u.getUsername()).getPassword().equals(u.getPassword())) {
			return true;
		}
		return false;
	}

}
