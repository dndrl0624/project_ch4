package com.ch4.pojo;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class VisitorLogic {
	VisitorDao vDao = null;
	
	public VisitorLogic() {
		vDao = new VisitorDao();
	}

	public int applyAdd(Map<String, Object> pMap) {
		int result = 0;
		Map<String, Object> addInfo = SortAndBind.visitApplySort(pMap);
		
		List<Map<String,Object>> vtAddList = (List<Map<String,Object>>) addInfo.get("vtAddList");
		List<Map<String,Object>> tnAddList = (List<Map<String,Object>>) addInfo.get("tnAddList");
		List<Map<String,Object>> pkAddList = (List<Map<String,Object>>) addInfo.get("pkAddList");
		Map<String,Object> applyAdd = (Map<String,Object>) addInfo.get("applyAdd");
		result = vDao.applyAdd(vtAddList,tnAddList,pkAddList,applyAdd);
		return result;
	}

	public int visitorUpdate(Map<String, Object> pMap) {
		int result = 0;
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

	public Map<String, Object> applyDetail(Map<String, Object> pMap) {
		Map<String, Object> applyDetail = vDao.applyDetail(pMap);
		return applyDetail;
	}
	public List<Map<String, Object>> applyList(Map<String, Object> pMap) {
		List<Map<String, Object>> applyList = vDao.applyList(pMap);
		return applyList;
	}

	public List<Map<String, Object>> deptList(Map<String, Object> pMap) {
		List<Map<String, Object>> deptList = vDao.deptList(pMap);
		return deptList;
	}

}
