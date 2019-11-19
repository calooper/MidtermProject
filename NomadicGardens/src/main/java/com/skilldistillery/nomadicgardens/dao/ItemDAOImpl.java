package com.skilldistillery.nomadicgardens.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.nomadicgardens.entities.Item;

@Transactional
@Service
public class ItemDAOImpl implements ItemDAO {
	// FIELDS
	@PersistenceContext
	private EntityManager em;

	// METHODS
	@Override
	public Item findById(int id) {
		return em.find(Item.class, id);
	}

	@Override
	public List<Item> findAll() {
		String query = "SELECT it FROM Item it";
		List<Item> allItems = em.createQuery(query, Item.class).getResultList();
		return allItems;
	}

	@Override
	public List<Item> findByKeyword(String key){
		//SELECT * FROM item it JOIN produce pr WHERE pr.name LIKE '%corn%';
		
		String query = "SELECT it FROM Item it WHERE it.produce.name LIKE :keyword";
		List<Item> keywordItems = em.createQuery(query, Item.class).setParameter("keyword", "%" + key+ "%").getResultList();
		return keywordItems;
	}

	
	@Override
	public Item create(Item item) {
		em.persist(item);
		em.flush();
		return item;
	}

	@Override
	public Item update(int id, Item item) {
		Item it = em.find(Item.class, id);

		it.setQuantity(item.getQuantity());
		it.setUnit(item.getUnit());
		it.setHarvestDate(item.getHarvestDate());
		it.setUseByDate(item.getUseByDate());
		it.setAvailable(item.getAvailable());
		it.setImgURL(item.getImgURL());
		it.setUser(item.getUser());
		it.setProduce(item.getProduce());
		it.setCartItems(it.getCartItems());
		em.flush();
		return it;
	}

	@Override
	public boolean destroy(int id) {
		boolean successful = true;
		Item it = em.find(Item.class, id);

		em.getTransaction().begin();
		em.remove(it);
		em.flush();
		return successful;
	}

}
