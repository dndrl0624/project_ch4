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

	public Map<String, Object> confirmVQR(Map<String, Object> pMap) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		sqlSession.selectOne("confirmVQR",pMap); // confirmVQR vs confirmGQR
		resultMap.put("result", pMap.get("result"));
		resultMap.put("inout", pMap.get("inout"));
		resultMap.put("msg", pMap.get("msg"));
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

	public Map<String, Object> selectExit(Map<String, Object> pMap) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		sqlSession.update("selectExit", pMap);
		resultMap.put("result", pMap.get("result"));
		resultMap.put("inout", pMap.get("inout"));
		resultMap.put("msg", pMap.get("msg"));
		return resultMap;
	}

}
