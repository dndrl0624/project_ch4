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
	public int applyAdd(List<Map<String,Object>> vtAddList
			          , List<Map<String,Object>> tnAddList
			          , List<Map<String,Object>> pkAddList
			          , Map<String,Object> applyAdd) {
		int result = 0;
		for(int i=0;i<vtAddList.size();i++) {
			Map<String, Object> addMap = vtAddList.get(i);
			result = sqlSession.insert("visitorAdd", addMap);
			if(result==0) {
				return result;
			}
		}
		for(int i=0;i<tnAddList.size();i++) {
			Map<String, Object> addMap = tnAddList.get(i);
			result = sqlSession.insert("equipAdd", addMap);
			if(result==0) {
				return result;
			}
		}
		for(int i=0;i<vtAddList.size();i++) {
			Map<String, Object> addMap = pkAddList.get(i);
			result = sqlSession.insert("carAdd", addMap);
			if(result==0) {
				return result;
			}
		}
		
		result = sqlSession.insert("applyAdd", applyAdd);
		if(result==0) {
			return result;
		}
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
