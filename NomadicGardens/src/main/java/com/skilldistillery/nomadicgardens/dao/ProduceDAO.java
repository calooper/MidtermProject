package com.skilldistillery.nomadicgardens.dao;

import java.util.List;

import com.skilldistillery.nomadicgardens.entities.Produce;

public interface ProduceDAO {
	public Produce findById(int id);
	public List<Produce> findAll();
	public Produce create(Produce produce);
	public Produce update(int id, Produce produce);
	public boolean destroy(int id);
}
