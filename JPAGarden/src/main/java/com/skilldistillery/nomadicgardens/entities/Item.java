package com.skilldistillery.nomadicgardens.entities;

import java.time.LocalDate;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity
public class Item {

	// FIELDS
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	private Integer quantity;
	private String unit;

	@Column(name = "harvest_date")
	private LocalDate harvestDate;

	@Column(name = "use_by_date")
	private LocalDate useByDate;

	private boolean available;

	@Column(name = "img_url")
	private String imgURL;

	@ManyToOne
	@JoinColumn(name = "user_id")
	private User user;

	@ManyToOne
	@JoinColumn(name = "produce_id")
	private Produce produce;

	@OneToMany(mappedBy = "item")
	private List<CartItem> cartItems;

	// CONSTRUCTORS

	public Item() {
		super();
	}

	public Item(int id, Integer quantity, String unit, LocalDate harvestDate, LocalDate useByDate, boolean available,
			String imgURL, User user, Produce produce, List<CartItem> cartItems) {
		super();
		this.id = id;
		this.quantity = quantity;
		this.unit = unit;
		this.harvestDate = harvestDate;
		this.useByDate = useByDate;
		this.available = available;
		this.imgURL = imgURL;
		this.user = user;
		this.produce = produce;
		this.cartItems = cartItems;
	}

	// GETTERS, SETTERS, TOSTRING, EQUALS

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
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

	public boolean isAvailable() {
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

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Produce getProduce() {
		return produce;
	}

	public void setProduce(Produce produce) {
		this.produce = produce;
	}

	public List<CartItem> getCartItems() {
		return cartItems;
	}

	public void setCartItems(List<CartItem> cartItems) {
		this.cartItems = cartItems;
	}

	@Override
	public String toString() {
		return "Item [id=" + id + ", quantity=" + quantity + ", unit=" + unit + ", harvestDate=" + harvestDate
				+ ", useByDate=" + useByDate + ", available=" + available + ", imgURL=" + imgURL 
				+ ", produce=" + produce + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + (available ? 1231 : 1237);
		result = prime * result + ((cartItems == null) ? 0 : cartItems.hashCode());
		result = prime * result + ((harvestDate == null) ? 0 : harvestDate.hashCode());
		result = prime * result + id;
		result = prime * result + ((imgURL == null) ? 0 : imgURL.hashCode());
		result = prime * result + ((produce == null) ? 0 : produce.hashCode());
		result = prime * result + ((quantity == null) ? 0 : quantity.hashCode());
		result = prime * result + ((unit == null) ? 0 : unit.hashCode());
		result = prime * result + ((useByDate == null) ? 0 : useByDate.hashCode());
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
		Item other = (Item) obj;
		if (available != other.available)
			return false;
		if (cartItems == null) {
			if (other.cartItems != null)
				return false;
		} else if (!cartItems.equals(other.cartItems))
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
		if (produce == null) {
			if (other.produce != null)
				return false;
		} else if (!produce.equals(other.produce))
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
		if (user == null) {
			if (other.user != null)
				return false;
		} else if (!user.equals(other.user))
			return false;
		return true;
	}

	// METHODS

}
