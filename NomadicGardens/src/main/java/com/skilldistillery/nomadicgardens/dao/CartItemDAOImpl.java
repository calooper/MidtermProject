package com.skilldistillery.nomadicgardens.dao;

import java.time.LocalDate;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.nomadicgardens.entities.CartItem;
import com.skilldistillery.nomadicgardens.entities.Item;
import com.skilldistillery.nomadicgardens.entities.User;

@Transactional
@Service
public class CartItemDAOImpl implements CartItemDAO {
	// FIELDS
	@PersistenceContext
	private EntityManager em;

	// METHODS
	@Override
	public CartItem findById(int id) {
		return em.find(CartItem.class, id);
	}

	@Override
	public List<CartItem> findAll() {
		String query = "SELECT ci FROM CartItem ci";
		List<CartItem> allCartItems = em.createQuery(query, CartItem.class).getResultList();
		return allCartItems;
	}
	
	@Override
	public List<CartItem> findAllCartItemsById(int userId) {
		String query = "SELECT ci FROM CartItem ci WHERE ci.user.id = :userId";
		List<CartItem> allCartItemsById = em.createQuery(query, CartItem.class).setParameter("userId", userId).getResultList();
		return allCartItemsById;
	}
	

	@Override
	public CartItem create(CartItem cartItem) {
		em.persist(cartItem);
		em.flush();
		return cartItem;
	}
	@Override
	public CartItem makeCartItem(CartItem cartItem, User user, Item item) {
		cartItem.setUser(user);
		cartItem.setItem(item);
		cartItem.setApproved(true);
		cartItem.setDateAdded(LocalDate.now());
		em.persist(cartItem);
		
		em.flush();
		return cartItem;
	}

	@Override
	public CartItem update(int id, CartItem cartItem) {
		CartItem ci = em.find(CartItem.class, id);

		ci.setDateAdded(cartItem.getDateAdded());
		ci.setUser(cartItem.getUser());
		ci.setItem(cartItem.getItem());
		ci.setApproved(cartItem.getApproved());
		em.flush();
		return ci;
	}
	@Override
	public CartItem removeFromCart(int id) {
		CartItem ci = em.find(CartItem.class, id);
		
		ci.setApproved(false);
		em.flush();
		return ci;
	}
	
	@Override
	public boolean destroy(int id) {
		boolean successful = true;
		CartItem ci = em.find(CartItem.class, id);
		em.remove(ci);
//		em.flush();
		return successful;
	}

}
