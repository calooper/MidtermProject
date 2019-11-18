package com.skilldistillery.nomadicgardens.dao;

import java.util.List;

import com.skilldistillery.nomadicgardens.entities.Garden;

public interface GardenDAO {
	public Garden findById(int id);
	public List<Garden> findAll();
	public Garden create(Garden garden);
	public Garden update(int id, Garden garden);
	public boolean destroy(int id);
	public List<Garden> findGardenByKeyword(String keyword);
	
}
