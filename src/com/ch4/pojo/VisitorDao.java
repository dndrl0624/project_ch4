package com.ch4.pojo;

import java.util.ArrayList;
import java.util.HashMap;
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
	public String visitApplyAdd(Map<String,Object> applyAdd) {
		String visit_no = null;
		
		visit_no = "VA" + RuleOfGeneratingPK.getPK(100);

		int result = 0;
		applyAdd.put("visit_no", visit_no);
		result = sqlSession.insert("visitApplyAdd", applyAdd);
		
		if(result==0) {
			return null;
		}
		else if(result==1) {			
			sqlSession.commit();
		}
		return visit_no;
	}
	
	public int visitSubAdd(List<Map<String,Object>> vtAddList
			               , List<Map<String,Object>> tnAddList
			               , List<Map<String,Object>> pkAddList
			               , String visit_no) {
		int result = 0;
		for(int i=0;i<vtAddList.size();i++) {
			Map<String, Object> addMap = vtAddList.get(i);
			addMap.put("visit_no", visit_no);
			result = sqlSession.insert("visitorAdd", addMap);
			if(result==0) {
				return result;
			}
		}
		for(int i=0;i<tnAddList.size();i++) {
			Map<String, Object> addMap = tnAddList.get(i);
			addMap.put("visit_no", visit_no);
			result = sqlSession.insert("equipAdd", addMap);
			if(result==0) {
				return result;
			}
		}
		for(int i=0;i<vtAddList.size();i++) {
			Map<String, Object> addMap = pkAddList.get(i);
			addMap.put("visit_no", visit_no);
			result = sqlSession.insert("carAdd", addMap);
			if(result==0) {
				return result;
			}
		}
		sqlSession.commit();
		return result;
	}

	public int visitorUpdate(Map<String, Object> pMap) {
		int result = 0;
		logger.info("dao visitorUpdate");
		logger.info("pMap : "+pMap);
		result = sqlSession.update("visitorApplyUpdate", pMap);
		logger.info(result);
		return result;
	}

	public int visitorCancle(Map<String, Object> pMap) {
		int result = 0;
		result = sqlSession.update("visitorCancle", pMap);
		sqlSession.commit();
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

	public Map<String, Object> applySearch(Map<String, Object> pMap) {
		Map<String, Object> applySearch = sqlSession.selectOne("applySearch", pMap);
		return applySearch;
	}
	public List<Map<String, Object>> applyList(Map<String, Object> pMap) {
		List<Map<String, Object>> applyList = sqlSession.selectList("applyList", pMap);
		return applyList;
	}

	public List<Map<String, Object>> preVisitList(Map<String, Object> pMap) {
		List<Map<String, Object>> preVisitList = sqlSession.selectList("applyList", pMap);
		for(int i=0;i<preVisitList.size();i++) {
			Map<String,Object> indexMap = preVisitList.get(i);
			List<Map<String, Object>> visitorList = sqlSession.selectList("visitorList", indexMap);
			indexMap.put("visitorList", visitorList);
		}
		
		return preVisitList;
	}

	public Map<String, Object> previsitDetail(Map<String, Object> pMap) {
		Map<String,Object> preDetailList = new HashMap<String, Object>();
		
		List<Map<String, Object>> visitorList = sqlSession.selectList("visitorList", pMap);
		List<Map<String, Object>> equipList = sqlSession.selectList("equipList", pMap);
		List<Map<String, Object>> carList = sqlSession.selectList("carList", pMap);
		
		preDetailList.put("visitorList", visitorList);
		preDetailList.put("equipList", equipList);
		preDetailList.put("carList", carList);
		
		return preDetailList;
	}

	public Map<String, Object> applyDetail(Map<String, Object> pMap) {
		Map<String,Object> rMap = new HashMap<String, Object>();
		
		Map<String, Object> infoMap = sqlSession.selectOne("infoMap", pMap);
		List<Map<String, Object>> visitorList = sqlSession.selectList("visitorList", pMap);
		List<Map<String, Object>> equipList = sqlSession.selectList("equipList", pMap);
		List<Map<String, Object>> carList = sqlSession.selectList("carList", pMap);
		
		rMap.put("infoMap", infoMap);
		rMap.put("visitorList", visitorList);
		rMap.put("equipList", equipList);
		rMap.put("carList", carList);
		
		return rMap;
	}

	public List<Map<String, Object>> qrCodeList(Map<String, Object> pMap) {
		List<Map<String,Object>> qrCodeList = sqlSession.selectList("visitorQRcode",pMap);
		return qrCodeList;
	}


}
