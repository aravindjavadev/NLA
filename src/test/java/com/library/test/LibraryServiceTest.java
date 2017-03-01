package com.library.test;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import com.library.configuration.LibraryConfiguration;
import com.library.dao.UserDao;
import com.library.model.Books;
import com.library.model.User;

import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import java.util.List;

@ContextConfiguration(classes = { LibraryConfiguration.class })
@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
public class LibraryServiceTest {

	@Autowired
	@Qualifier("userDaoService")
	UserDao userDao;

	@Test
	public void booksLendByPersonTest() {

		List<Books> booksList = userDao.findUserByID(1);
		assertNotNull(booksList);
		assertTrue(booksList.size() > 0);
	}
}
