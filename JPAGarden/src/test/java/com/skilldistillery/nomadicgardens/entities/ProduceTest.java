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
}
