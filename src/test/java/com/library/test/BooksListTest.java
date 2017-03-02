package com.library.test;

import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;
import java.util.List;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import com.library.configuration.LibraryConfiguration;
import com.library.dao.UserDao;
import com.library.model.Books;

@ContextConfiguration(classes = { LibraryConfiguration.class })
@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
public class BooksListTest {

	@Autowired
	@Qualifier("userDaoService")
	UserDao userDao;

	@Test
	public void booksListTest() {

		List<Books> bookList = userDao.findAllBooks();
		assertNotNull(bookList);
		assertTrue(bookList.size() > 0);
	}
	
	
	
	
}
