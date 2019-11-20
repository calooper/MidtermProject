package com.skilldistillery.nomadicgardens.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.nomadicgardens.entities.Plot;
import com.skilldistillery.nomadicgardens.entities.User;

@Transactional
@Service
public class PlotDAOImpl implements PlotDAO {
	// FIELDS
	@PersistenceContext
	private EntityManager em;

	// METHODS
	@Override
	public Plot findById(int id) {
		return em.find(Plot.class, id);
	}

	@Override
	public List<Plot> findAll() {
		String query = "SELECT pl FROM Plot pl";
		List<Plot> allPlots = em.createQuery(query, Plot.class).getResultList();
		return allPlots;
	}

	@Override
	public Plot create(Plot plot) {
		em.persist(plot);
		em.flush();
		return plot;
	}

	@Override
	public Plot update(int id, Plot plot) {
		Plot pl = em.find(Plot.class, id);

		pl.setUser(plot.getUser());
		pl.setPlotNumber(plot.getPlotNumber());
		pl.setSizeSqft(plot.getSizeSqft());
		pl.setGarden(plot.getGarden());

		em.flush();
		return pl;
	}
	
	@Override
	public Plot claimPlot(int plotId, int userId) {
		Plot pl = em.find(Plot.class, plotId);
		User user = em.find(User.class, userId);
		pl.setUser(user);
		
		em.flush();
		return pl;
	}
	@Override
	public Plot unclaimPlot(int id) {
		Plot pl = em.find(Plot.class, id);
		
		pl.setUser(null);
		
		em.flush();
		return pl;
	}

	@Override
	public boolean destroy(int id) {
		boolean successful = true;
		Plot pl = em.find(Plot.class, id);

		em.getTransaction().begin();
		em.remove(pl);
		em.flush();
		return successful;
	}

}
