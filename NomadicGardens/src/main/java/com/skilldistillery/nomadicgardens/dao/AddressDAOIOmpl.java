package com.skilldistillery.nomadicgardens.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.nomadicgardens.entities.Address;

@Transactional
@Service
public class AddressDAOIOmpl implements AddressDAO {
	// FIELDS
	@PersistenceContext
	private EntityManager em;

	// METHODS
	@Override
	public Address findById(int id) {
		return em.find(Address.class, id);
	}

	@Override
	public List<Address> findAll() {
		String query = "SELECT ad FROM Address ad";
		List<Address> allAddresses = em.createQuery(query, Address.class).getResultList();
		return allAddresses;
	}

	@Override
	public Address create(Address address) {
		em.persist(address);
		em.flush();
		return address;
	}

	@Override
	public Address update(int id, Address address) {
		Address ad = em.find(Address.class, id);

		ad.setStreet(address.getStreet());
		ad.setCity(address.getCity());
		ad.setState(address.getState());
		ad.setZip(address.getZip());
		ad.setGarden(address.getGarden());
		ad.setUser(address.getUser());

		return ad;
	}

	@Override
	public boolean destroy(int id) {
		boolean successful = true;
		Address ad = em.find(Address.class, id);

		em.getTransaction().begin();
		em.remove(ad);
		em.flush();
		return successful;
	}

}
