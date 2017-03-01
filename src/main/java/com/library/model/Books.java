package com.library.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Book details Pojo class
 * 
 * @author Aravind Nadagouda
 *
 */
@Entity
@Table(name = "books")
public class Books implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue
	Integer id;
	String title;
	String author;
	String isbn;

	public Books(String title, String author, String isbn, User user) {
		super();
		this.title = title;
		this.author = author;
		this.isbn = isbn;
	}

	public Books() {
		super();
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getIsbn() {
		return isbn;
	}

	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}

	@Override
	public String toString() {
		return "Books [id=" + id + ", title=" + title + ", author=" + author + ", isbn=" + isbn + "]";
	}
}
