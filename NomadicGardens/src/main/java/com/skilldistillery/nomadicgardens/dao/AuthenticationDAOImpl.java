package com.skilldistillery.nomadicgardens.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

import com.skilldistillery.nomadicgardens.entities.User;


@Repository
public class AuthenticationDAOImpl implements AuthenticationDAO {
	private UserDAOImpl userDAO = null;
	private Map<String, User> users = null;

	@Override
	public User create(User user) {
		if (isUsernameUnique(user.getUsername())) {
			users.put(user.getUsername(), user);
			return user;
		}
		return null;
	}

	@Override
	public boolean isUsernameUnique(String username) {
		userDAO = new UserDAOImpl();
		users = userDAO.populateMap();

		return !users.containsKey(username);
	}

	@Override
	public User getUserByUsername(String username) {
		userDAO = new UserDAOImpl();
		users = userDAO.populateMap();
		
		if (users.containsKey(username)) {
			return users.get(username);
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
