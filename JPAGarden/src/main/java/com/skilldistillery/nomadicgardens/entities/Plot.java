package com.skilldistillery.nomadicgardens.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class Plot {

	// FIELDS
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@ManyToOne
	@JoinColumn(name = "user_id")
	private User user;

	@Column(name = "plot_number")
	private int plotNumber;

	@Column(name = "size_sqft")
	private Integer sizeSqft;

	@ManyToOne
	@JoinColumn(name = "garden_id")
	private Garden garden;

	// CONSTRUCTORS

	public Plot() {
		super();
	}

	public Plot(User user, int plotNumber, int sizeSqft, Garden garden) {
		super();
		this.user = user;
		this.plotNumber = plotNumber;
		this.sizeSqft = sizeSqft;
		this.garden = garden;
	}

	// GETTERS, SETTERS, TOSTRING, EQUALS

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public int getPlotNumber() {
		return plotNumber;
	}

	public void setPlotNumber(int plotNumber) {
		this.plotNumber = plotNumber;
	}

	public int getSizeSqft() {
		return sizeSqft;
	}

	public void setSizeSqft(int sizeSqft) {
		this.sizeSqft = sizeSqft;
	}

	public Garden getGarden() {
		return garden;
	}

	public void setGarden(Garden garden) {
		this.garden = garden;
	}

	@Override
	public String toString() {
		return "Plot [id=" + id + ", plotNumber=" + plotNumber + ", sizeSqft=" + sizeSqft
				+ ", garden=" + garden + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((garden == null) ? 0 : garden.hashCode());
		result = prime * result + id;
		result = prime * result + plotNumber;
		result = prime * result + sizeSqft;
		result = prime * result + ((user == null) ? 0 : user.hashCode());
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
		Plot other = (Plot) obj;
		if (garden == null) {
			if (other.garden != null)
				return false;
		} else if (!garden.equals(other.garden))
			return false;
		if (id != other.id)
			return false;
		if (plotNumber != other.plotNumber)
			return false;
		if (sizeSqft != other.sizeSqft)
			return false;
		if (user == null) {
			if (other.user != null)
				return false;
		} else if (!user.equals(other.user))
			return false;
		return true;
	}

}
