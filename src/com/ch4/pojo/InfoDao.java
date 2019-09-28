package com.ch4.pojo;

import java.util.HashMap;
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

	public Map<String, Object> confirmQR(Map<String, Object> pMap) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		int result = 0;
		result = sqlSession.selectOne("confirmQR",pMap);
		/*
		 * 여기서 프로시져의 결과값 받는법 ..? 
		 */
		resultMap.put("result", result);
		return resultMap;
	}

	public int kioskLogin(Map<String, Object> pMap) {
		int result = 0;
		result = sqlSession.selectOne("kioskLogin",pMap);
		return result;
	}

	public int kioskJoin(Map<String, Object> pMap) {
		int result = 0;
		result = sqlSession.selectOne("kioskJoin",pMap);
		return result;
	}

}
