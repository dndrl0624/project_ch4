package com.ch4.pojo;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.log4j.Logger;

import com.ch4.util.MyBatisCommonFactory;

public class CompanyDao {
	Logger logger = Logger.getLogger(CompanyDao.class);
	SqlSessionFactory sqlSessionFactory = null;
	SqlSession sqlSession = null;
	
	public CompanyDao() {
		sqlSessionFactory = MyBatisCommonFactory.getSqlSessionFactory();
		sqlSession = sqlSessionFactory.openSession();
	}

	public int mngPermit(Map<String, Object> pMap) {
		int result = 0;
		/*
		 * 이부분에 visit // goods 승인테이블에 insert후 신청테이블 상태 update해줘야함 
		 */
		return result;
	}
	public int mngUpdate(Map<String, Object> pMap) {
		int result = 0;
		result = sqlSession.update("mngUpdate",pMap);
		return result;
	}

	public List<Map<String, Object>> applyList(Map<String, Object> pMap) {
		List<Map<String, Object>> applyList = sqlSession.selectList("applyList", pMap);
		return applyList;
	}

	public List<Map<String, Object>> inOutList(Map<String, Object> pMap) {
		List<Map<String, Object>> inOutList = sqlSession.selectList("inOutList", pMap);
		return inOutList;
	}


}
