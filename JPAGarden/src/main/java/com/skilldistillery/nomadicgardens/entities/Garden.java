package com.skilldistillery.nomadicgardens.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Garden {

	// FIELDS
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@Column(name = "address_id")
	private int addressId;

	@Column(name = "size_sqft")
	private int sizeSqft;

	private String description;

	private String name;

	// CONSTRUCTORS

	public Garden(int id, int addressId, int sizeSqft, String description, String name) {
		super();
		this.id = id;
		this.addressId = addressId;
		this.sizeSqft = sizeSqft;
		this.description = description;
		this.name = name;
	}

	public Garden() {
		super();
	}

	public int getId() {
		return id;
	}

	public int getAddressId() {
		return addressId;
	}

	public void setAddressId(int addressId) {
		this.addressId = addressId;
	}

	public int getSizeSqft() {
		return sizeSqft;
	}

	public void setSizeSqft(int sizeSqft) {
		this.sizeSqft = sizeSqft;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + addressId;
		result = prime * result + ((description == null) ? 0 : description.hashCode());
		result = prime * result + id;
		result = prime * result + ((name == null) ? 0 : name.hashCode());
		result = prime * result + sizeSqft;
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Garden other = (Garden) obj;
		if (addressId != other.addressId)
			return false;
		if (description == null) {
			if (other.description != null)
				return false;
		} else if (!description.equals(other.description))
			return false;
		if (id != other.id)
			return false;
		if (name == null) {
			if (other.name != null)
				return false;
		} else if (!name.equals(other.name))
			return false;
		if (sizeSqft != other.sizeSqft)
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "Garden [id=" + id + ", addressId=" + addressId + ", sizeSqft=" + sizeSqft + ", description="
				+ description + ", name=" + name + "]";
	}

}
