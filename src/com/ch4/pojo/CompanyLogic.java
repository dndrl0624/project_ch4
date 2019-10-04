package com.ch4.pojo;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;


public class CompanyLogic {
	Logger logger = Logger.getLogger(CompanyLogic.class);
	CompanyDao cDao = null;
	public CompanyLogic() {
		cDao = new CompanyDao();
	}

	public int mngVPermit(Map<String, Object> pMap) {
		int result = 0;
		cDao.mngVPermit(pMap);
		result = (int)pMap.get("result");
		List<Map<String,Object>> confirmList = null;
		logger.info("test");
		confirmList = (List<Map<String,Object>>)pMap.get("confirmList");
		logger.info("result: "+result);
		for(int i=0;i<confirmList.size();i++) {
			logger.info(
					"QR코드:"+confirmList.get(i).get("CONFM_QRCODE")+
					" 방문일자:"+confirmList.get(i).get("CONFM_VISIT_DATE")+
					" 방문자:"+confirmList.get(i).get("CONFM_NAME")
					);
		}
		
		
		
		
//		if(result==0) {
//			return result;
//		}
//		else if(result==1) {
//			result = cDao.mngPermit(pMap); // insert
//		}
//		if(result==1) {
//			String qrCode = cDao.getQRcode(pMap);
//			String savedFilePath = CompanyController.QRImagePath;
//			String path = null;
//			String url = null;
//			
//			if(pMap.get("visit_no")!=null) {
//				path = savedFilePath + "visit/";
//				url = "http://localhost:8080/Info/QRconfirm.ch4?confm_qrcode=" + qrCode;
//			}
//			else if(pMap.get("aplg_no")!=null) {
//				path = savedFilePath + "goods/";
//				url = "http://localhost:8080/Info/QRconfirm.ch4?confm_qrcode=" + qrCode;
//			}
//			File file = new File(path);
//			
//		}
//		else if(result==0) {
//			return result;
//		}
		return result;
	}
	public int mngGPermit(Map<String, Object> pMap) {
		int result = 0;
		cDao.mngGPermit(pMap);
		result = (int)pMap.get("result");
		List<Map<String,Object>> confirmList = null;
		logger.info("test");
		confirmList = (List<Map<String,Object>>)pMap.get("confirmList");
		logger.info("result: "+result);
		for(int i=0;i<confirmList.size();i++) {
			logger.info(
					"QR코드:"+confirmList.get(i).get("CONFM_QRCODE")+
					" 반입일자:"+confirmList.get(i).get("APLG_TRANS_DATE")+
					" 물품명:"+confirmList.get(i).get("CONFM_NAME")
					);
		}
		if(result==1) {
			result = cDao.goodsQRAdd(pMap);
		}
		return result;
	}
	
	public List<Map<String, Object>> applyVisitList(Map<String, Object> pMap) {
		List<Map<String, Object>> applyVisitList = cDao.applyVisitList(pMap);
		return applyVisitList;
	}

	public List<Map<String, Object>> inOutList(Map<String, Object> pMap) {
		List<Map<String, Object>> inOutList = cDao.inOutList(pMap);
		return inOutList;
	}

	public int companyLogin(Map<String, Object> pMap) {
		int result = 0;
		result = cDao.companyLogin(pMap);
		return result;
	}

	public int companyJoin(Map<String, Object> pMap) {
		int result = 0;
		pMap.put("dept_no", "DP190501123QWZ");
		pMap.put("cmng_id", "test2");
		pMap.put("cmng_pw", "1234");
		pMap.put("cmng_name", "선인장");
		pMap.put("cmng_hp", "010-1111-1111");
		pMap.put("cmng_grade", "안내데스크");
		result = cDao.companyJoin(pMap);
		return result;
	}

	public int isExistID(Map<String, Object> pMap) {
		int result = 0;
		result = cDao.isExistID(pMap);
		return result;
	}

	public List<Map<String, Object>> applyGoodsList(Map<String, Object> pMap) {
		List<Map<String, Object>> applyGoodsList = cDao.applyGoodsList(pMap);
		return applyGoodsList;
	}


}
