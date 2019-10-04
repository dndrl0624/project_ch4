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
	}
	public int mngUpdate(Map<String, Object> pMap) {
		// TODO Auto-generated method stub
		return 0;
	}
	public Map<String,Object> mngVPermit(Map<String, Object> pMap) {
		logger.info("dao permit 호출");
		logger.info(pMap);
		sqlSession = sqlSessionFactory.openSession();
		sqlSession.update("vApplyPermit",pMap);
		return pMap;
	}
	public Map<String,Object> mngGPermit(Map<String, Object> pMap) {
		logger.info("dao permit 호출");
		logger.info(pMap);
		sqlSession = sqlSessionFactory.openSession();
		sqlSession.update("gApplyPermit",pMap);
		return pMap;
	}
	public int goodsQRAdd(Map<String, Object> pMap) {
		int result = 0;
		logger.info("dao goodsQRAdd 호출");
		logger.info(pMap);
		sqlSession = sqlSessionFactory.openSession();
		result = sqlSession.insert("goodsQRAdd",pMap);
		return result;
	}
	public String getQRcode(Map<String, Object> pMap) {
		// TODO Auto-generated method stub
		return null;
	}
	public int companyLogin(Map<String, Object> pMap) {
		// TODO Auto-generated method stub
		return 0;
	}
	public int companyJoin(Map<String, Object> pMap) {
		int result = 0;
		logger.info("dao companyJoin 호출");
		logger.info(pMap);
		sqlSession = sqlSessionFactory.openSession();
		result = sqlSession.insert("companyJoin",pMap);
		return 0;
	}
	public int isExistID(Map<String, Object> pMap) {
		// TODO Auto-generated method stub
		return 0;
	}
	public List<Map<String, Object>> applyGoodsList(Map<String, Object> pMap) {
		// TODO Auto-generated method stub
		return null;
	}
	public List<Map<String, Object>> applyVisitList(Map<String, Object> pMap) {
		// TODO Auto-generated method stub
		return null;
	}
	public List<Map<String, Object>> inOutList(Map<String, Object> pMap) {
		// TODO Auto-generated method stub
		return null;
	}
	
}
