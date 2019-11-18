package com.skilldistillery.nomadicgardens.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.nomadicgardens.entities.Garden;

@Transactional
@Service
public class GardenDAOImpl implements GardenDAO {
	// FIELDS
	@PersistenceContext
	private EntityManager em;

	// METHODS
	@Override
	public Garden findById(int id) {
		return em.find(Garden.class, id);
	}
	
	public Garden findGardenByKeyword(String keyword){
		String query = "SELECT grd FROM Garden grd WHERE grd.name LIKE '%:keyword%'";
		Garden garden = em.createQuery(query, Garden.class).setParameter("keyword", keyword).getSingleResult();
		return garden;
	}

	@Override
	public List<Garden> findAll() {
		String query = "SELECT grd FROM Garden grd";
		List<Garden> allGardens = em.createQuery(query, Garden.class).getResultList();
		return allGardens;
	}

	@Override
	public Garden create(Garden garden) {
		em.persist(garden);
		em.flush();
		return garden;
	}

	@Override
	public Garden update(int id, Garden garden) {
		Garden grd = em.find(Garden.class, id);

		grd.setAddress(garden.getAddress());
		grd.setSizeSqft(garden.getSizeSqft());
		grd.setDescription(garden.getDescription());
		grd.setName(garden.getName());
		grd.setPlots(garden.getPlots());

		em.flush();
		return grd;
	}

	@Override
	public boolean destroy(int id) {
		boolean successful = true;
		Garden grd = em.find(Garden.class, id);

		em.getTransaction().begin();
		em.remove(grd);
		em.flush();
		return successful;
	}

}
