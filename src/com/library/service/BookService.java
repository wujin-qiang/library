package com.library.service;

import com.library.bean.Book;
import com.library.bean.LimitPageList;
import com.library.dao.BookDao;

import tools.MyUtil;
import tools.Page;
import tools.Pagetwo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

@Service
public class BookService {
    @Autowired
    private BookDao bookDao;

    //获取书籍list
    public  List<Book> getlist(int index){  
    	return bookDao.getlist(index);
    }

    //获取书籍总数
    public int getTotal() {
    	return bookDao.getTotal();
    }  
    
    // 模糊查询 
   
	public int selectPacketCountName(String searchWord) {
		return bookDao.selectPacketCountName(searchWord);
	}
	
	public List<Book> selectPacketName(HashMap<String,Object> map) {
		return bookDao.selectPacketName(map);
	}

    
    
    public ArrayList<Book> queryBook(String searchWord) {
        return bookDao.queryBook(searchWord);
    }

    public ArrayList<Book> getAllBooks() {
        return bookDao.getAllBooks();
    }
    
    public boolean matchBook(String searchWord) {
        return bookDao.matchBook(searchWord) > 0;
    }

//    public boolean addBook(Book book) {
//        return bookDao.addBook(book) > 0;
//    }
    //添加带有图片的图书
    public String addBook(Book book,MultipartFile file,ModelMap map) throws IOException{
    	String filePath = "D:\\study\\upload";
    	String originalFilename = file.getOriginalFilename();
    	String newFileName = UUID.randomUUID() + originalFilename;
    	File targetFile = new File(filePath, newFileName);
    	file.transferTo(targetFile);	
    	
    	book.setUrl(newFileName);
    	bookDao.addBook(book); 
    	return "redirect:/admin_books.html";
    }
			

    public Book getBook(Long bookId) {
        return bookDao.getBook(bookId);
    }

    public boolean editBook(Book book) {
        return bookDao.editBook(book) > 0;
    }
    
    

    public boolean deleteBook(Long bookId) {
        return bookDao.deleteBook(bookId) > 0;
    }

    public boolean selectBookByIsbn(String ISBN) {
        return bookDao.selectBookByIsbn(ISBN) > 0 ;
    }

}
