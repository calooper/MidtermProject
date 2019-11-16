package com.skilldistillery.nomadicgardens.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.nomadicgardens.entities.Produce;

@Transactional
@Service
public class ProduceDAOImpl implements ProduceDAO {
	// FIELDS
	@PersistenceContext
	private EntityManager em;

	// METHODS
	@Override
	public Produce findById(int id) {
		return em.find(Produce.class, id);
	}

	@Override
	public List<Produce> findAll() {
		String query = "SELECT pr FROM Produce pr";
		List<Produce> allProduce = em.createQuery(query, Produce.class).getResultList();
		return allProduce;
	}

	@Override
	public Produce create(Produce produce) {
		em.persist(produce);
		em.flush();
		return produce;
	}

	@Override
	public Produce update(int id, Produce produce) {
		Produce pr = em.find(Produce.class, id);

		pr.setName(produce.getName());
		pr.setImgURL(produce.getImgURL());
		pr.setItems(produce.getItems());

		em.flush();
		return pr;
	}

	@Override
	public boolean destroy(int id) {
		boolean successful = true;
		Produce pr = em.find(Produce.class, id);

		em.getTransaction().begin();
		em.remove(pr);
		em.flush();
		return successful;
	}

}
