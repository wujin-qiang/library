package com.library.bean;

import java.io.Serializable;
import java.util.Date;

public class Lend implements Serializable {

    private long ser_num;
    private long book_id;
    private long reader_id;
    private Date lend_date;
    private Date back_date;
    private Date Estimated_back_date;
    private String  name;
    private String ISBN;


    public String getISBN() {
        return ISBN;
    }

    public void setISBN(String ISBN) {
        this.ISBN = ISBN;
    }

    public long getReaderId() {
        return reader_id;
    }

    public void setReaderId(long reader_id) {
        this.reader_id = reader_id;
    }

    public long getBookId() {
        return book_id;
    }

    public void setBookId(long book_id) {
        this.book_id = book_id;
    }

    public void setSer_num(long ser_num) {
        this.ser_num = ser_num;
    }

    public Date getBackDate() {
        return back_date;
    }

    public void setBackDate(Date back_date) {
        this.back_date = back_date;
    }

    public Date getEstimated_back_date() {
        return Estimated_back_date;
    }

    public void setEstimated_back_date(Date Estimated_back_date) {
        this.Estimated_back_date = Estimated_back_date;
    }
    
    public Date getLendDate() {
        return lend_date;
    }

    public void setLendDate(Date lend_date) {
        this.lend_date = lend_date;
    }

    public long getSer_num() {
        return ser_num;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
