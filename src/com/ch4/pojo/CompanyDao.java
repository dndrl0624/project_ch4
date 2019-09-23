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
		if(pMap.get("visit_no")!=null) {
			result = sqlSession.insert("mngVPermit",pMap); // VISIT_CONFM테이블에 insert
		}
		else if(pMap.get("aplg_no")!=null) {
			int amount = ((String[])pMap.get("gmng_name")).length;
			for(int i=0;i<amount;i++) {
				result = sqlSession.insert("mngGPermit",pMap); // GOODS_COMFM테이블에 insert
				if(result==0) {
					return result;
				}
			}
		}
		if(result==0) {
			return result;
		}
		else if(result==1) {
			result = sqlSession.update("mngPermitUpd",pMap);
		}
		sqlSession.commit();
		return result;
	}
	public int mngUpdate(Map<String, Object> pMap) {
		int result = 0;
		result = sqlSession.update("mngUpdate",pMap);
		sqlSession.commit();
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


	public int companyLogin(Map<String, Object> pMap) {
		int result = 0;
		result = sqlSession.selectOne("companyLogin", pMap);
		return result;
	}


	public int companyJoin(Map<String, Object> pMap) {
		int result = 0;
		result = sqlSession.insert("companyJoin",pMap);
		sqlSession.commit();
		return result;
	}


	public int isExistID(Map<String, Object> pMap) {
		int result = 0;
		result = sqlSession.selectOne("isExistID", pMap);
		return result;
	}


}
