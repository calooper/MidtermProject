package com.skilldistillery.nomadicgardens.entities;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

@Entity
public class Garden {

	// FIELDS
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@OneToOne
	@JoinColumn(name = "address_id")
	private Address address;

	@Column(name = "size_sqft")
	private int sizeSqft;

	private String description;

	private String name;

	@OneToMany(mappedBy = "garden")
	private List<Plot> plots;

	// CONSTRUCTORS

	public Garden() {
		super();
	}

	public Garden(int id, Address address, int sizeSqft, String description, String name, List<Plot> plots) {
		super();
		this.id = id;
		this.address = address;
		this.sizeSqft = sizeSqft;
		this.description = description;
		this.name = name;
		this.plots = plots;
	}

	// GETTERS, SETTERS, TOSTRING, EQUALS

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Address getAddress() {
		return address;
	}

	public void setAddress(Address address) {
		this.address = address;
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

	public List<Plot> getPlots() {
		return plots;
	}

	public void setPlots(List<Plot> plots) {
		this.plots = plots;
	}

	@Override
	public String toString() {
		return "Garden [id=" + id + ", address=" + address + ", sizeSqft=" + sizeSqft + ", description=" + description
				+ ", name=" + name + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((address == null) ? 0 : address.hashCode());
		result = prime * result + ((description == null) ? 0 : description.hashCode());
		result = prime * result + id;
		result = prime * result + ((name == null) ? 0 : name.hashCode());
		result = prime * result + ((plots == null) ? 0 : plots.hashCode());
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
		if (address == null) {
			if (other.address != null)
				return false;
		} else if (!address.equals(other.address))
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
		if (plots == null) {
			if (other.plots != null)
				return false;
		} else if (!plots.equals(other.plots))
			return false;
		if (sizeSqft != other.sizeSqft)
			return false;
		return true;
	}

}
