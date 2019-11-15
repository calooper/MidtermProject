package com.skilldistillery.nomadicgardens.entities;

import java.time.LocalDate;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Item {

	// FIELDS
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@Column(name = "user_id")
	private int userId;

	private Integer quantity;
	private String unit;

	@Column(name = "harvest_date")
	private LocalDate harvestDate;

	@Column(name = "use_by_date")
	private LocalDate useByDate;

	private boolean available;

	@Column(name = "img_url")
	private String imgURL;

	@Column(name = "produce_id")
	private int produceId;

	// CONSTRUCTORS

	public Item() {
		super();
	}

	public Item(int id, int userId, Integer quantity, String unit, LocalDate harvestDate, LocalDate useByDate, boolean available,
			String imgURL, int produceId) {
		super();
		this.id = id;
		this.userId = userId;
		this.quantity = quantity;
		this.unit = unit;
		this.harvestDate = harvestDate;
		this.useByDate = useByDate;
		this.available = available;
		this.imgURL = imgURL;
		this.produceId = produceId;
	}

	// GETTERS, SETTERS, TOSTRING, EQUALS

	public int getId() {
		return id;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	public String getUnit() {
		return unit;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}

	public LocalDate getHarvestDate() {
		return harvestDate;
	}

	public void setHarvestDate(LocalDate harvestDate) {
		this.harvestDate = harvestDate;
	}

	public LocalDate getUseByDate() {
		return useByDate;
	}

	public void setUseByDate(LocalDate useByDate) {
		this.useByDate = useByDate;
	}

	public boolean getAvailable() {
		return available;
	}

	public void setAvailable(boolean available) {
		this.available = available;
	}

	public String getImgURL() {
		return imgURL;
	}

	public void setImgURL(String imgURL) {
		this.imgURL = imgURL;
	}

	public int getProduceId() {
		return produceId;
	}

	public void setProduceId(int produceId) {
		this.produceId = produceId;
	}

	@Override
	public String toString() {
		return "Item [id=" + id + ", userId=" + userId + ", quantity=" + quantity + ", unit=" + unit + ", harvestDate="
				+ harvestDate + ", useByDate=" + useByDate + ", available=" + available + ", imgURL=" + imgURL
				+ ", produceId=" + produceId + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + (available ? 1231 : 1237);
		result = prime * result + ((harvestDate == null) ? 0 : harvestDate.hashCode());
		result = prime * result + id;
		result = prime * result + ((imgURL == null) ? 0 : imgURL.hashCode());
		result = prime * result + produceId;
		result = prime * result + ((quantity == null) ? 0 : quantity.hashCode());
		result = prime * result + ((unit == null) ? 0 : unit.hashCode());
		result = prime * result + ((useByDate == null) ? 0 : useByDate.hashCode());
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
		Item other = (Item) obj;
		if (available != other.available)
			return false;
		if (harvestDate == null) {
			if (other.harvestDate != null)
				return false;
		} else if (!harvestDate.equals(other.harvestDate))
			return false;
		if (id != other.id)
			return false;
		if (imgURL == null) {
			if (other.imgURL != null)
				return false;
		} else if (!imgURL.equals(other.imgURL))
			return false;
		if (produceId != other.produceId)
			return false;
		if (quantity == null) {
			if (other.quantity != null)
				return false;
		} else if (!quantity.equals(other.quantity))
			return false;
		if (unit == null) {
			if (other.unit != null)
				return false;
		} else if (!unit.equals(other.unit))
			return false;
		if (useByDate == null) {
			if (other.useByDate != null)
				return false;
		} else if (!useByDate.equals(other.useByDate))
			return false;
		if (userId != other.userId)
			return false;
		return true;
	}

	// METHODS

}
