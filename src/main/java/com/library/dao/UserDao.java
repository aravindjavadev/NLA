package com.library.dao;

import java.util.List;

import com.library.model.Books;
import com.library.model.User;

/**
 * DAO interface
 * 
 * @author Aravind Nadagouda
 *
 */

public interface UserDao {

	List<User> findAllPersons();

	List<Books> findAllBooks();

	List<Books> findUserByID(Integer userId);

}