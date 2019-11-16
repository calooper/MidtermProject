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
		em.persist(user);
		em.flush();
		return user;
	}

	@Override
	public User update(int id, User user) {
		User us = em.find(User.class, id);

		us.setUsername(user.getUsername());
		us.setPassword(user.getPassword());
		us.setActive(user.getActive());
		us.setAddress(user.getAddress());
		us.setImgURL(user.getImgURL());
		us.setEmail(user.getEmail());
		us.setPhoneNumber(user.getPhoneNumber());
		us.setFirstName(user.getFirstName());
		us.setLastName(user.getLastName());
		us.setCreateDate(user.getCreateDate());
		us.setPlots(user.getPlots());
		us.setCartItems(user.getCartItems());
		us.setItems(user.getItems());

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

}
