package com.skilldistillery.nomadicgardens.dao;

import java.util.List;

import com.skilldistillery.nomadicgardens.entities.CartItem;
import com.skilldistillery.nomadicgardens.entities.Item;
import com.skilldistillery.nomadicgardens.entities.User;

public interface CartItemDAO {
	public CartItem findById(int id);
	public List<CartItem> findAll();
	public CartItem create(CartItem cartItem);
	public CartItem makeCartItem(CartItem cartItem, User user, Item item);
	public CartItem update(int id, CartItem cartItem);
	public boolean destroy(int id);
	List<CartItem> findAllCartItemsById(int userId);
}
