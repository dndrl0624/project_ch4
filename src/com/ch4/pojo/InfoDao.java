package com.ch4.pojo;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.log4j.Logger;

import com.ch4.util.MyBatisCommonFactory;

public class InfoDao {
	Logger logger = Logger.getLogger(InfoDao.class);
	SqlSessionFactory sqlSessionFactory = null;
	SqlSession sqlSession = null;
	
	public InfoDao() {
		sqlSessionFactory = MyBatisCommonFactory.getSqlSessionFactory();
		sqlSession = sqlSessionFactory.openSession();
	}

	public int confirmQR(Map<String, Object> pMap) {
		int result = 0;
		result = sqlSession.selectOne("confirmQR",pMap);
		return result;
	}

}
