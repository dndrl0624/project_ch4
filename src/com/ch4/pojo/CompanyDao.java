package com.ch4.pojo;

import java.util.HashMap;
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
	

	public String getQRcode(Map<String, Object> pMap) {
		String qrCode = null;
		if(pMap.get("visit_no")!=null) {
			qrCode = sqlSession.selectOne("visitorQR",pMap);
		}
		else if(pMap.get("aplg_no")!=null) {
			qrCode = sqlSession.selectOne("goodsQR",pMap);
		}
		return qrCode;
	}
/////////////////////////////////////////////////////////////////////////
	public int mngPermit(Map<String, Object> pMap) {
		int result = 0;
		if(pMap.get("visit_no")!=null) {
			String confm_no = "VA" + RuleOfGeneratingPK.getPK(100);
			pMap.put("confm_no", confm_no);
			result = sqlSession.insert("mngVPermit",pMap);// VISIT_CONFM테이블에 insert
			if(result==0) {
				return result;
			}
			else if(result==1) {
				String[] vNames = (String[])pMap.get("visitor_name");
				String[] phones = (String[])pMap.get("visitor_hp");
				int amount = vNames.length;
				for(int i=0;i<amount;i++) {
					Map<String,Object> insInfo = new HashMap<String, Object>();					
					String qrCode = "QR" + RuleOfGeneratingPK.getPK(i);
					insInfo.put("visit_no", pMap.get("visit_no"));
					insInfo.put("visitor_name",vNames[i]);
					insInfo.put("visitor_hp", phones[i]);
					insInfo.put("confm_no", confm_no);
					insInfo.put("qrCode", qrCode);
					result = sqlSession.insert("visitorQR",insInfo);
					if(result==0) {
						return result;
					}
				}
			}
		}
		else if(pMap.get("aplg_no")!=null) {
			String[] gNames = (String[])pMap.get("gmng_name");
			String[] gTypes = (String[])pMap.get("gmng_type");
			String[] gAmount = (String[])pMap.get("gmng_quan");
			int count = gNames.length;
			for(int i=0;i<count;i++) {
				Map<String,Object> insInfo = new HashMap<String, Object>();
				String confm_no = "GC" + RuleOfGeneratingPK.getPK(i);
				String qrCode = "QR" + RuleOfGeneratingPK.getPK(i);
				insInfo.put("aplg_no", pMap.get("aplg_no"));
				insInfo.put("gmng_name", gNames[i]);
				insInfo.put("gmng_type", gTypes[i]);
				insInfo.put("gmng_quan", gAmount[i]);
				insInfo.put("confm_no", confm_no);
				insInfo.put("qrCode", qrCode);
				result = sqlSession.insert("mngGPermit",insInfo); // GOODS_COMFM테이블에 insert
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
