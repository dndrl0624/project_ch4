package com.ch4.pojo;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.log4j.Logger;

import com.ch4.util.MyBatisCommonFactory;

public class VisitorDao {
	Logger logger = Logger.getLogger(VisitorDao.class);
	SqlSessionFactory sqlSessionFactory = null;
	SqlSession sqlSession = null;
	
	public VisitorDao() {
		sqlSessionFactory = MyBatisCommonFactory.getSqlSessionFactory();
		sqlSession = sqlSessionFactory.openSession();
	}
	
	/********************
	 * 
	 * 
	 * 
	 *******************/
	public int visitrorAdd(Map<String, Object> pMap) {
		int result = 0;
		result = sqlSession.insert("visitorAdd", pMap);
		return result;
	}

	public int visitorUpdate(Map<String, Object> pMap) {
		int result = 0;
		result = sqlSession.update("visitorUpdate", pMap);
		return result;
	}

	public int visitorCancle(Map<String, Object> pMap) {
		int result = 0;
		result = sqlSession.update("visitorCancle", pMap);
		return result;
	}


	public List<Map<String, Object>> companyList() {
		List<Map<String, Object>> companyList = sqlSession.selectList("companyList");
		return companyList;
	}
	public List<Map<String, Object>> deptList(Map<String, Object> pMap) {
		List<Map<String, Object>> deptList = sqlSession.selectList("deptList", pMap);
		return deptList;
	}

	public Map<String, Object> applyDetail(Map<String, Object> pMap) {
		Map<String, Object> applyDetail = sqlSession.selectOne("applyDetail", pMap);
		return applyDetail;
	}
	public List<Map<String, Object>> applyList(Map<String, Object> pMap) {
		List<Map<String, Object>> applyList = sqlSession.selectList("applyList", pMap);
		return applyList;
	}


}
