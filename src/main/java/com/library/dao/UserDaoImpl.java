package com.library.dao;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.library.model.Books;
import com.library.model.User;

/**
 * 
 * DAO layer which interacts with the database
 * 
 * @author Aravind Nadagouda
 *
 */
@Repository
@Service("userDaoService")
public class UserDaoImpl implements UserDao {

	// Entity Manager for DB connection
	@PersistenceContext
	private EntityManager em;

	public void persist(User user) {
		em.persist(user);
	}

	// Returns list of Persons
	@Override
	public List<User> findAllPersons() {
		List<User> personList = em.createQuery("from User u", User.class).getResultList();
		return personList;
	}

	// Returns list of Books
	@Override
	public List<Books> findAllBooks() {
		List<Books> booksList = em.createQuery("from Books b", Books.class).getResultList();
		return booksList;
	}

	// Returns list of of Books lended by the Person
	@Override
	public List<Books> findUserByID(Integer userId) {
		TypedQuery<User> query = em.createQuery("FROM User u WHERE u.id = :user", User.class);
		query.setParameter("user", userId);
		User booksList = query.getSingleResult();
		return booksList.getBooks();
	}
}