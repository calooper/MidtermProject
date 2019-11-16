package com.skilldistillery.nomadicgardens.dao;

import java.util.List;

import com.skilldistillery.nomadicgardens.entities.Address;

public interface AddressDAO {
	public Address findById(int id);
	public List<Address> findAll();
	public Address create(Address address);
	public Address update(int id, Address address);
	public boolean destroy(int id);
}
