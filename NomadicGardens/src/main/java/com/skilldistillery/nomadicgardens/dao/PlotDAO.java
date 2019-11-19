package com.skilldistillery.nomadicgardens.dao;

import java.util.List;

import com.skilldistillery.nomadicgardens.entities.Plot;

public interface PlotDAO {
	public Plot findById(int id);
	public List<Plot> findAll();
	public Plot create(Plot plot);
	public Plot update(int id, Plot plot);
	public Plot claimPlot(int plotId, int userId);
	public Plot unclaimPlot(int id);
	public boolean destroy(int id);
}
