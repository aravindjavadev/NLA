package com.library.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.GsonBuilder;
import com.library.dao.UserDao;
import com.library.model.Books;
import com.library.model.User;

/**
 * 
 * Controller to handle the request from the User interface and return the
 * requested resources Returns list of Persons and Books saved in the Database
 * 
 * @author Aravind Nadagouda
 *
 */
@Controller
@RequestMapping("/")
public class LibraryController {

	@Autowired
	UserDao userDao;

	@RequestMapping(method = RequestMethod.GET)
	public String libraryList(ModelMap model) {

		return "welcome";
	}

	/*
	 * Returns list of BooksLended by the Person Input: User Id Output: List of
	 * Books
	 */

	@RequestMapping(value = "/getBooksDetails", method = RequestMethod.GET)
	@ResponseBody
	public ResponseEntity<String> getBooksDetails(@RequestParam Integer userId, HttpServletRequest request,
			HttpServletResponse response, Model model) {

		model.addAttribute("booksDetails", userDao.findUserByID(userId));
		com.google.gson.Gson gson = new GsonBuilder().disableHtmlEscaping().create();
		String jsonString = gson.toJson(userDao.findUserByID(userId));
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		return new ResponseEntity<String>(jsonString, responseHeaders, HttpStatus.CREATED);

	}

	@RequestMapping("/books")
	public ModelAndView bookView(ModelMap model) {

		List<User> personList = userDao.findAllPersons();
		List<Books> booksList = userDao.findAllBooks();
		com.google.gson.Gson gson = new GsonBuilder().disableHtmlEscaping().create();
		model.addAttribute("personList", gson.toJson(personList));
		model.addAttribute("booksList", gson.toJson(booksList));

		return new ModelAndView("books");
	}

	@RequestMapping("/persons")
	public ModelAndView personView(ModelMap model) {

		List<User> personList = userDao.findAllPersons();
		List<Books> booksList = userDao.findAllBooks();
		com.google.gson.Gson gson = new GsonBuilder().disableHtmlEscaping().create();
		model.addAttribute("personList", gson.toJson(personList));
		model.addAttribute("booksList", gson.toJson(booksList));

		return new ModelAndView("persons");
	}
}