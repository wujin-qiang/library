package com.library.dao;

import com.library.bean.Admin;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@Repository
public class AdminInfoDao {
	private final static String NAMESPACE = "com.library.dao.AdminInfoDao.";
    @Resource
    private SqlSessionTemplate sqlSessionTemplate;

    public ArrayList<Admin> getAllAdminInfo() {
        List<Admin> result = sqlSessionTemplate.selectList(NAMESPACE + "getAllAdminInfo");
        return (ArrayList<Admin>) result;
    }

    public Admin findAdminInfoByAdminId(final long admin_id) {
        return sqlSessionTemplate.selectOne(NAMESPACE + "findAdminInfoByAdminId", admin_id);
    }

    public int deleteAdminInfo(final long admin_id) {
        return sqlSessionTemplate.delete(NAMESPACE + "deleteAdminInfo", admin_id);
    }

    public final long addAdminInfo(final Admin adminInfo) {
        if (sqlSessionTemplate.insert(NAMESPACE + "addAdminInfo", adminInfo) > 0) {
            return sqlSessionTemplate.selectOne(NAMESPACE + "getAdminId", adminInfo);
        } else {
            return -1;
        }
    }

    public Admin getAdminInfoByName(String name) {
        return sqlSessionTemplate.selectOne(NAMESPACE + "getAdminInfoByName", name);
    }

	
}
