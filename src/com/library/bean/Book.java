package com.library.bean;

import java.math.BigDecimal;
import java.util.Date;
import org.springframework.web.multipart.MultipartFile;


public class Book  {

    private long book_id;
    private String name;
    private String author;
    private String publish;
    private String ISBN;
    private String introduction;
    private String language;
    private BigDecimal price;
    private String pub_date;
    private String class_id;
    private int number;
    private String overDate;
    private String url;//image
   
	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getOverDate() {
        return overDate;
    }

    public void setOverDate(String overDate) {
        this.overDate = overDate;
    }
    
    public long getBookId() {
        return book_id;
    }

    public void setBookId(long book_id) {
        this.book_id = book_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getPublish() {
        return publish;
    }

    public void setPublish(String publish) {
        this.publish = publish;
    }

    public String getIsbn() {
        return ISBN;
    }

    public void setIsbn(String isbn) {
        this.ISBN = isbn;
    }

    public String getIntroduction() {
        return introduction;
    }

    public void setIntroduction(String introduction) {
        this.introduction = introduction;
    }

    public String getLanguage() {
        return language;
    }

    public void setLanguage(String language) {
        this.language = language;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public String getPubdate() {
        return pub_date;
    }

    public void setPubdate(String pub_date) {
        this.pub_date = pub_date;
    }

    public String getClassId() {
        return class_id;
    }

    public void setClassId(String class_id) {
        this.class_id = class_id;
    }

    public int getNumber() {
        return number;
    }

    public void setNumber(int number) {
        this.number = number;
    }
}
