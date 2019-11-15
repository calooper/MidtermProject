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

class PlotTest {
	private static EntityManagerFactory emf;
	private EntityManager em;
	private Plot plot;
	
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
		plot = em.find(Plot.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		plot = null;
	}

	@Test
	@DisplayName("testing plot entity mappings")
	void test1() {
		assertNotNull(plot);
		assertEquals(100, plot.getSizeSqft());
	}
}
