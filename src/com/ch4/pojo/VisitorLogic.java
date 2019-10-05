package com.ch4.pojo;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

public class VisitorLogic {
	Logger logger = Logger.getLogger(VisitorLogic.class);
	VisitorDao vDao = null;
	
	public VisitorLogic() {
		vDao = new VisitorDao();
	}


	public int visitApplyAdd(Map<String, Object> pMap) {
		int result = 0;
		String visit_no = null;

		Map<String, Object> addInfo = SortAndBind.visitApplySort(pMap);
		
		List<Map<String,Object>> vtAddList = (List<Map<String,Object>>) addInfo.get("vtAddList");
		List<Map<String,Object>> tnAddList = (List<Map<String,Object>>) addInfo.get("tnAddList");
		List<Map<String,Object>> pkAddList = (List<Map<String,Object>>) addInfo.get("pkAddList");
		Map<String,Object> applyAdd = (Map<String,Object>) addInfo.get("applyAdd");
		vDao.visitApplyAdd(applyAdd);
		result = (int)applyAdd.get("result");
		if(result==0) {
			return result;
		}
		else if(result==1){
			visit_no = applyAdd.get("visit_no").toString();
			pMap.put("visit_no", visit_no);
			
			Map<String, Object> vtMap = new HashMap<String, Object>();
			vtMap.put("vtAddList", vtAddList);
			vtMap.put("visit_no", visit_no);
			Map<String, Object> tnMap = new HashMap<String, Object>();
			tnMap.put("tnAddList", tnAddList);
			tnMap.put("visit_no", visit_no);
			Map<String, Object> pkMap = new HashMap<String, Object>();
			pkMap.put("pkAddList", pkAddList);
			pkMap.put("visit_no", visit_no);
			
			result = vDao.visitSubAdd(vtMap,tnMap,pkMap);
		}
		
		return result;
	}

	public int visitorUpdate(Map<String, Object> pMap) {
		int result = 0;
		result = vDao.visitorUpdate(pMap);
		/*
		 * 여기에 방문자,차량,기기 add 코드
		 */
		return result;
	}

	public int visitorCancle(Map<String, Object> pMap) {
		int result = 0;
		result = vDao.visitorCancle(pMap);
		return result;
	}


	public List<Map<String, Object>> companyList() {
		List<Map<String, Object>> companyList = vDao.companyList();
		return companyList;
	}

	public Map<String, Object> applySearch(Map<String, Object> pMap) {
		Map<String, Object> applySearch = vDao.applySearch(pMap);
		return applySearch;
	}
	public List<Map<String, Object>> applyList(Map<String, Object> pMap) {
		List<Map<String, Object>> applyList = vDao.applyList(pMap);
		return applyList;
	}

	public List<Map<String, Object>> deptList(Map<String, Object> pMap) {
		List<Map<String, Object>> deptList = vDao.deptList(pMap);
		return deptList;
	}

	public List<Map<String, Object>> preVisitList(Map<String, Object> pMap) {
		List<Map<String,Object>> preVisitList = vDao.preVisitList(pMap);
		return preVisitList;
	}

	public Map<String, Object> previsitDetail(Map<String, Object> pMap) {
		Map<String,Object> preDetailList = vDao.previsitDetail(pMap);
		return preDetailList;
	}

	public Map<String, Object> applyDetail(Map<String, Object> pMap) {
		Map<String,Object> rMap = vDao.applyDetail(pMap);
		return rMap;
	}

	public List<Map<String, Object>> qrCodeList(Map<String, Object> pMap) {
		List<Map<String,Object>> qrCodeList = vDao.qrCodeList(pMap);
		return qrCodeList;
	}

}
