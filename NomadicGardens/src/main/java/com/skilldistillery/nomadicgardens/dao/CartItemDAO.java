package com.skilldistillery.nomadicgardens.dao;

import java.util.List;

import com.skilldistillery.nomadicgardens.entities.CartItem;

public interface CartItemDAO {
	public CartItem findById(int id);
	public List<CartItem> findAll();
	public CartItem create(CartItem cartItem);
	public CartItem update(int id, CartItem cartItem);
	public boolean destroy(int id);
}
