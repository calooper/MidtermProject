package com.skilldistillery.nomadicgardens.entities;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import java.time.LocalDate;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

class CartItemTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private CartItem ci;
	
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
		ci = em.find(CartItem.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		ci = null;
	}

	@Test
	@DisplayName("testing cart item entity mappings")
	void test1() {
		assertNotNull(ci);
		assertEquals(LocalDate.of(2019, 11, 15), ci.getDateAdded());
	}
	
	@Test
	@DisplayName("testing cart item mapping to User MTO")
	void test2() {
//		select i.user_id, u.first_name FROM cart_item i
	//		JOIN user u ON
	//	    u.id = i.user_id
	//	    WHERE i.user_id = 1;
		
		assertEquals("test", ci.getUser().getFirstName());
	}
	
	@Test
	@DisplayName("testing cart item mapping to User & Item MTO")
	void test3() {
//		select i.item_id, item.id, item.use_by_date FROM cart_item i
//		JOIN item item ON
//	    i.item_id = item.id;
		
		assertEquals(LocalDate.of(2019, 11, 15), ci.getItem().getHarvestDate());
	}

}
