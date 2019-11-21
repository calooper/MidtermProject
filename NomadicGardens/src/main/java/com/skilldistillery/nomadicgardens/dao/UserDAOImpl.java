package com.skilldistillery.nomadicgardens.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.nomadicgardens.entities.User;

@Transactional
@Service
public class UserDAOImpl implements UserDAO {
	// FIELDS
	@PersistenceContext
	private EntityManager em;

	// METHODS

	@Override
	public User findById(int id) {
		return em.find(User.class, id);
	}

	@Override
	public List<User> findAll() {
		String query = "SELECT us FROM User us";
		List<User> allUsers = em.createQuery(query, User.class).getResultList();
		return allUsers;
	}

	@Override
	public User create(User user) {
		if (isUsernameUnique(user.getUsername(), findAll())) {
			em.persist(user);
			em.flush();
		}
		return user;
	}

	@Override
	public User update(int id, User user) {
		User us = em.find(User.class, id);

		if (user.getUsername() != null) {
			us.setUsername(user.getUsername());

		}
		if (user.getPassword() != null) {
			us.setPassword(user.getPassword());

		}

		if (user.getAddress() != null) {
			us.setAddress(user.getAddress());

		}
		if (user.getImgURL() != null && user.getImgURL() != "") {
			us.setImgURL(user.getImgURL());

		}
		if (user.getEmail() != null) {
			us.setEmail(user.getEmail());

		}
		if (user.getPhoneNumber() != null) {
			us.setPhoneNumber(user.getPhoneNumber());

		}
		if (user.getFirstName() != null) {
			us.setFirstName(user.getFirstName());

		}
		if (user.getLastName() != null) {
			us.setLastName(user.getLastName());

		}
		if (user.getCreateDate() != null) {
			us.setCreateDate(user.getCreateDate());

		}
		if (user.getPlots() != null) {
			us.setPlots(user.getPlots());

		}
		if (user.getCartItems() != null) {
			us.setCartItems(user.getCartItems());

		}
		if (user.getItems() != null) {
			us.setItems(user.getItems());

		}
		
		us.setActive(true);
		em.flush();
		return us;
	}

	@Override
	public boolean destroy(int id) {
		boolean successful = true;
		User us = em.find(User.class, id);

		em.getTransaction().begin();
		em.remove(us);
		em.flush();
		return successful;
	}

	// ADDITIONS

	@Override
	public boolean isUsernameUnique(String username, List<User> users) {
		boolean isUnique = true;
		for (User user : users) {
			if (username.equals(user.getUsername())) {
				isUnique = false;
			}
		}
		return isUnique;
	}

	@Override
	public User getUserByUsername(String username) {
		String query = "SELECT us FROM User us WHERE us.username = :username";
		User user = em.createQuery(query, User.class).setParameter("username", username).getResultList().get(0);

		return user;
	}

	@Override
	public boolean isValidUser(User u) {
		if (getUserByUsername(u.getUsername()) == null) {
			return false;
		}

		if (getUserByUsername(u.getUsername()).getPassword().equals(u.getPassword())) {
			return true;
		}
		return false;
	}

}
