package com.ch4.pojo;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.log4j.Logger;

import com.ch4.util.MyBatisCommonFactory;

public class AdminDao {
	Logger logger = Logger.getLogger(AdminDao.class);
	SqlSessionFactory sqlSessionFactory = null;
	SqlSession sqlSession = null;
	
	public AdminDao() {
		sqlSessionFactory = MyBatisCommonFactory.getSqlSessionFactory();
		sqlSession = sqlSessionFactory.openSession();
	}
	public int sendAnwser(Map<String, Object> pMap) {
		int result = 0;
		try {
			result = sqlSession.insert("sendAnwser",pMap);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

}
