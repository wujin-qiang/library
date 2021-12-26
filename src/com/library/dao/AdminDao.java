package com.library.dao;

import com.library.bean.Admin;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.Map;

@Repository
public class AdminDao {

    private final static String NAMESPACE = "com.library.dao.AdminDao.";
    @Resource
    private SqlSessionTemplate sqlSessionTemplate;

    public int getMatchCount(final String username, final String password) {
        Map<String, Object> paramMap = new HashMap<>();
        paramMap.put("username", username);
        paramMap.put("password", password);
        return sqlSessionTemplate.selectOne(NAMESPACE + "getMatchCount", paramMap);
    }

    public int resetPassword(final long admin_id, final String password) {
        Map<String, Object> paramMap = new HashMap<>();
        paramMap.put("admin_id", admin_id);
        paramMap.put("password", password);
        return sqlSessionTemplate.update(NAMESPACE + "resetPassword", paramMap);
    }

    public String getPassword(final long admin_id) {
        return sqlSessionTemplate.selectOne(NAMESPACE + "getPassword", admin_id);
    }

    public Long getUsername(final String username) {
        return sqlSessionTemplate.selectOne(NAMESPACE + "getUsername", username);
    }

    public final int addAdmin(final Admin admin) {

        return sqlSessionTemplate.insert(NAMESPACE + "addAdmin", admin);

    }

    public Admin getReaderInfoByName(String username) {
        return sqlSessionTemplate.selectOne(NAMESPACE + "findAdminInfoByName", username);
    }

}
