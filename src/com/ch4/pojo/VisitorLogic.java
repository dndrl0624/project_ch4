package com.ch4.pojo;

import java.util.List;
import java.util.Map;

public class VisitorLogic {
	VisitorDao vDao = null;
	
	public VisitorLogic() {
		vDao = new VisitorDao();
	}

	public int visitApplyAdd(Map<String, Object> pMap) {
		int result = 0;

		Map<String, Object> addInfo = SortAndBind.visitApplySort(pMap);
		
		List<Map<String,Object>> vtAddList = (List<Map<String,Object>>) addInfo.get("vtAddList");
		List<Map<String,Object>> tnAddList = (List<Map<String,Object>>) addInfo.get("tnAddList");
		List<Map<String,Object>> pkAddList = (List<Map<String,Object>>) addInfo.get("pkAddList");
		Map<String,Object> applyAdd = (Map<String,Object>) addInfo.get("applyAdd");
		
		String visit_no = vDao.visitApplyAdd(applyAdd);
		if(visit_no==null) {
			return result;
		}
		else {
			result = vDao.visitSubAdd(vtAddList,tnAddList,pkAddList,visit_no);
		}
		pMap.put("visit_no", visit_no);
		
		return result;
	}

	public int visitorUpdate(Map<String, Object> pMap) {
		int result = 0;
		pMap.put("visit_no","VA191002490MOD");
		pMap.put("visit_purps","바뀜4");
		pMap.put("visit_desti","바뀌었다4");
		pMap.put("visit_type","일일방문");
//		pMap.put("visit_term","");
//		pMap.put("visit_day","");
		pMap.put("visit_date","2019-12-31");
		pMap.put("visit_tkin_encc","X");
		pMap.put("visit_vhcle_encc","X");
		result = vDao.visitorUpdate(pMap);
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
