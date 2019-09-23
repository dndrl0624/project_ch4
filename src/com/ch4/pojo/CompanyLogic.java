package com.ch4.pojo;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class CompanyLogic {
	CompanyDao cDao = null;
	public CompanyLogic() {
		cDao = new CompanyDao();
	}

	public int mngPermit(Map<String, Object> pMap) {
		int result = 0;
		result = cDao.mngPermit(pMap);
		return result;
	}
	public int mngUpdate(Map<String, Object> pMap) {
		int result = 0;
		result = cDao.mngUpdate(pMap);
		return result;
	}
	
	public List<Map<String, Object>> applyList(Map<String, Object> pMap) {
		List<Map<String, Object>> applyList = cDao.applyList(pMap);
		return applyList;
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
		result = cDao.companyJoin(pMap);
		return result;
	}

	public int isExistID(Map<String, Object> pMap) {
		int result = 0;
		result = cDao.isExistID(pMap);
		return result;
	}


}
