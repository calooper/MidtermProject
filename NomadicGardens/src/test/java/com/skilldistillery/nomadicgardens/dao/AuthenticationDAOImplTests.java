package com.skilldistillery.nomadicgardens.dao;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

import com.skilldistillery.nomadicgardens.entities.User;

class AuthenticationDAOImplTests {
	private static EntityManagerFactory emf;
	private EntityManager em;
	AuthenticationDAOImpl dao;
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
	@DisplayName("Test create adds User to DAO")
	public void testCreate() {
		User newUser = new User("JollyGreenGiant", "Jolly", "Green", "password", "jollygreengiant@yahoo.com");
		User created = dao.create(newUser);
		assertNotNull(created);
		assertEquals("JollyGreenGiant", created.getUsername());
	}

	@Test
	@DisplayName("Test create returns null trying to add already existing User to DAO")
	public void testCreateNegative() {
		User newUser = new User("JollyGreenGiant", "Jolly", "Green", "password", "jollygreengiant@yahoo.com");
		User created = dao.create(newUser);
		assertNull(created);
	}

	@Test
	@DisplayName("Test getUserByEmail returns null for non-existent user")
	public void testGetByUsernameNegative() {
		User u = dao.getUserByUsername("XXX");
		assertNull(u);
	}

	@Test
	@DisplayName("Test getUserByUsername returns User for valid user")
	public void testGetByUsernameReturns() {
		User u = dao.getUserByUsername("larry");
		assertNotNull(u);
	    assertEquals(1, u.getId());
		assertEquals("larry", u.getUsername());
		assertEquals("larry", u.getFirstName());
	}

	@Test
	@DisplayName("Test isEmailUnique returns false for email already in the DAO")
	public void testEmailUniqueNegative() {
		assertFalse(dao.isUsernameUnique("larry@yahoo.com"));
	}

	@Test
	@DisplayName("Test isEmailUnique returns true for email not in the DAO")
	public void testEmailUniquePositive() {
		assertTrue(dao.isUsernameUnique("XXX@YYY.com"));
	}

	@Test
	@DisplayName("Test isValidUser returns true for User with valid username and password")
	public void testIsValidUserPositive() {
		User u = new User( "admin", "password", "admin@admin.com");
		boolean result = dao.isValidUser(u);
		assertTrue(result);
	}

//	@Test
//	@DisplayName("Test isValidUser returns false for User with valid email and invalid password")
//	public void testIsValidUserNegative() {
//		User u = new User("admin@admin.com", "admin", "admin", "passwordXXX");
//		boolean result = dao.isValidUser(u);
//		assertFalse(result);
//	}
//
//	@Test
//	@DisplayName("Test isValidUser returns false for User with invalid email and password")
//	public void testIsValidUserNegative2() {
//		User u = new User("XXX", "admin", "admin", "password", 22);
//		boolean result = dao.isValidUser(u);
//		assertFalse(result);
//	}

}
