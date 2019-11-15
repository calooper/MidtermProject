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

class UserTest {
	private static EntityManagerFactory emf;
	private EntityManager em;
	private User user;

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
		user = em.find(User.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		user = null;
	}

	@Test
	@DisplayName("testing user entity mappings")
	void test1() {
		assertNotNull(user);
		assertEquals("gardner", user.getUsername());
	}

	@Test
	@DisplayName("testing user-address relationship mappings")
	void test2() {
		// SELECT adr.street FROM address adr JOIN user usr ON usr.address_id = adr.id
		// WHERE usr.id = 1;
		assertNotNull(user);
		assertEquals("123 Curvy Lane", user.getAddress().getStreet());
	}

	@Test
	@DisplayName("testing user-plot relationship mappings")
	void test3() {
		// SELECT plt.plot_number FROM plot plt JOIN user usr ON plt.user_id = usr.id
		// WHERE usr.id = 1;
		assertNotNull(user);
		assertEquals(2, user.getPlots().get(1).getPlotNumber());
	}

	@Test
	@DisplayName("testing user-cart item relationship mappings")
	void test4() {
		//SELECT ci.date_added FROM cart_item ci JOIN user usr ON ci.user_id = usr.id WHERE usr.id = 1;
		assertNotNull(user);
		assertEquals("2019-11-15", user.getCartItems().get(0).getDateAdded().toString());
	}
	
	@Test
	@DisplayName("testing user-item relationship mappings")
	void test5() {
		//SELECT itm.use_by_date FROM item itm JOIN user usr ON itm.user_id = usr.id WHERE usr.id = 1;
		assertNotNull(user);
		assertEquals("2020-01-15", user.getItems().get(0).getUseByDate().toString());
	}

}
