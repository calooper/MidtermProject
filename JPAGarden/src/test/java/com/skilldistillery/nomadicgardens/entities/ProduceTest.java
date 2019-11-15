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

class ProduceTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private Produce produce;

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
		produce = em.find(Produce.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		produce = null;
	}

	@Test
	@DisplayName("testing produce entity mappings")
	void test1() {
		assertNotNull(produce);
		assertEquals("potato", produce.getName());
	}

	// SQL Statement
	// SELECT item.user_id FROM item JOIN produce ON produce_id = produce.id 
	// WHERE produce.id = 1;
	@Test
	@DisplayName("testing produce entity mapping with item")
	void test2() {
		assertNotNull(produce);
		assertEquals(1, produce.getItems().get(0).getUser().getId());
	}
	
	@Test
	@DisplayName("testing produce entity mapping with cart_item")
	void test3() {
		assertNotNull(produce);
		assertEquals(1, produce.getItems().get(0).getUser().getCartItems().get(0).getId());
	}
	
	
}
