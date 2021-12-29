package com.library.service;

import com.library.bean.Admin;
import com.library.dao.AdminDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
public class AdminInfoService {
	@Autowired
    private AdminDao adminDao;

    public ArrayList<Admin> adminInfos() {
        return adminDao.getAllAdminInfo();
    }

    public boolean deleteAdminInfo(long admin_id) {
        return adminDao.deleteAdminInfo(admin_id) > 0;
    }

//    public Admin getAdminInfo(long admin_id) {
//        return adminDao.findAdminInfoByAdminId(admin_id);
//    }
//
//    public long addAdminInfo(Admin adminInfo) {
//        return adminDao.addAdminInfo(adminInfo);
//    }
//
//    public String findName(String name) {
//        // TODO Auto-generated method stub
//        if(adminDao.getAdminInfoByName(name)!=null){
//            return "exist";
//        }
//        return "noexist";
//    }

	

	
}
