package com.skilldistillery.nomadicgardens.dao;

import java.util.List;

import com.skilldistillery.nomadicgardens.entities.Item;

public interface ItemDAO {
	public Item findById(int id);
	public List<Item> findAll();
	public Item create(Item item);
	public Item update(int id, Item item);
	public boolean destroy(int id);
}
