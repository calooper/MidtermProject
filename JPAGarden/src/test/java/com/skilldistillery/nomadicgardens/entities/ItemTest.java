package com.skilldistillery.nomadicgardens.entities;

import static org.junit.jupiter.api.Assertions.*;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

class ItemTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private Item item;

	@BeforeAll
	static void setUpBeforeClass() throws Exception {
		emf = Persistence.createEntityManagerFactory("GardenPU");
	}

	@AfterAll
	static void tearDownAfterClass() throws Exception {
		emf.close();
	}

	@BeforeEach
	void setUp() throws Exception {
		em = emf.createEntityManager();
		item = em.find(Item.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		item = null;
	}

	@Test
	@DisplayName("testing item entity mappings")
	void test1() {
		assertNotNull(item);
		assertEquals("10lb bag(s)", item.getUnit());
	}

	@Test
	@DisplayName("testing item mapping to cart returns correct user (index 0)")
	void test2() {
		// select u.username from user u join cart_item c on u.id = c.user_id join item
		// t on t.id = c.item_id;
		assertEquals("gardner", item.getCartItems().get(0).getUser().getUsername());
	}

	@Test
	@DisplayName("testing item mapping to produce returns correct produce item from the list (item 1)")
	void test3() {
		// select p.name from produce p join item i on p.id = i.produce_id;
		assertEquals("potato", item.getProduce().getName());
	}

}
