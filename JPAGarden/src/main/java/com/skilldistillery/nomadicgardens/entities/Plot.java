package com.skilldistillery.nomadicgardens.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Plot {

	// FIELDS
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@Column(name = "user_id")
	private int userId;

	@Column(name = "plot_number")
	private int plotNumber;

	@Column(name = "size_sqft")
	private int sizeSqft;

	@Column(name = "garden_id")
	private int gardenId;

	// CONSTRUCTORS

	public Plot() {
		super();
	}

	public Plot(int id, int userId, int plotNumber, int sizeSqft, int gardenId) {
		super();
		this.id = id;
		this.userId = userId;
		this.plotNumber = plotNumber;
		this.sizeSqft = sizeSqft;
		this.gardenId = gardenId;
	}

	public int getId() {
		return id;
	}

	// GETTERS, SETTERS, TOSTRING, EQUALS

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
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

	public int getGardenId() {
		return gardenId;
	}

	public void setGardenId(int gardenId) {
		this.gardenId = gardenId;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + gardenId;
		result = prime * result + id;
		result = prime * result + plotNumber;
		result = prime * result + sizeSqft;
		result = prime * result + userId;
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
		if (gardenId != other.gardenId)
			return false;
		if (id != other.id)
			return false;
		if (plotNumber != other.plotNumber)
			return false;
		if (sizeSqft != other.sizeSqft)
			return false;
		if (userId != other.userId)
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "Plot [id=" + id + ", userId=" + userId + ", plotNumber=" + plotNumber + ", sizeSqft=" + sizeSqft
				+ ", gardenId=" + gardenId + "]";
	}

}
