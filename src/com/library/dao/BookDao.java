package com.library.dao;

import com.library.bean.Book;

import org.apache.ibatis.annotations.Param;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Repository
public class BookDao {
	 private final static String NAMESPACE = "com.library.dao.BookDao.";
	 
	 @Resource
	 private SqlSessionTemplate sqlSessionTemplate;
	 
	 //获取书籍list
	 public List<Book> getlist(int index) {
		 List<Book> result = sqlSessionTemplate.selectList(NAMESPACE + "getlist",index);
		 return (List<Book>) result;
	 }

	 //获取书籍总数
	 public Integer getTotal() {
		 return sqlSessionTemplate.selectOne(NAMESPACE + "getTotal");
	 }

    // 模糊查询 
	 public int selectPacketCountName(final String searchWord) {
		 return sqlSessionTemplate.selectOne(NAMESPACE + "selectPacketCountName", searchWord);
	 }
			
		public ArrayList<Book> selectPacketName(HashMap<String,Object> map) {
			List<Book> result = sqlSessionTemplate.selectList(NAMESPACE + "selectPacketName", map);
			return (ArrayList<Book>) result;
		}
	 
    public int matchBook(final String searchWord) {
        String search = "%" + searchWord + "%";
        return sqlSessionTemplate.selectOne(NAMESPACE + "matchBook", search);
    }

    
    public ArrayList<Book> queryBook(final String searchWord) {
        String search = "%" + searchWord + "%";
        List<Book> result = sqlSessionTemplate.selectList(NAMESPACE + "queryBook", search);
        return (ArrayList<Book>) result;
    }

    public ArrayList<Book> getAllBooks() {
        List<Book> result = sqlSessionTemplate.selectList(NAMESPACE + "getAllBooks");
        return (ArrayList<Book>) result;
    }
    

    public int addBook(final Book book) {
        return sqlSessionTemplate.insert(NAMESPACE + "addBook", book);
    }

    public Book getBook(final long bookId) {
        return sqlSessionTemplate.selectOne(NAMESPACE + "getBook", bookId);
    }

    public int editBook(final Book book) {
        return sqlSessionTemplate.update(NAMESPACE + "editBook", book);
    }

    public int deleteBook(final long bookId) {
        return sqlSessionTemplate.delete(NAMESPACE + "deleteBook", bookId);
    }

    public int selectBookByIsbn(String ISBN) {
        return sqlSessionTemplate.selectOne(NAMESPACE + "selectBookByIsbn", ISBN);
    }
    
    public int selectBookByclass_id(String class_id) {
        return sqlSessionTemplate.selectOne(NAMESPACE + "selectBookByclass_id", class_id);
    }
}
