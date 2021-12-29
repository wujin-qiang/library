package com.library.service;

import com.library.bean.Lend;
import com.library.dao.LendDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
public class LendService {
    @Autowired
    private LendDao lendDao;

    public boolean returnBook(long bookId, long readerId){
        return lendDao.returnBookOne(bookId, readerId)>0 && lendDao.returnBookTwo(bookId)>0;
    }

    public boolean lendBook(long bookId,long readerId){
        return lendDao.lendBookOne(bookId,readerId)>0 && lendDao.lendBookTwo(bookId)>0;
    }

    public ArrayList<Lend> lendList(){
        return lendDao.lendList();
    }
    public ArrayList<Lend> myLendList(long readerId){
        return lendDao.myLendList(readerId);
    }

    public int deleteLend(long serNum) {
        return lendDao.deleteLend(serNum);
    }

    public boolean selectLend(long bookId) {
        return lendDao.selectLend(bookId) > 0;
    }

    public boolean selectReaderId(long readerId) {
        return lendDao.selectReaderId(readerId) > 0;
    }

    public boolean selectReaderIdForLend(long readerId) {
        return lendDao.selectReaderId(readerId) >= 10;
    }

    public boolean lendBookDateList(long bookId) {
        return lendDao.lendBookDateList(bookId) > 0 ;
    }
    
    //判断是否有图书逾期未归还
    public boolean lendBookDateList1(long readerId) {
        return lendDao.lendBookDateList1(readerId) >= 1;
    }

	
    

}
