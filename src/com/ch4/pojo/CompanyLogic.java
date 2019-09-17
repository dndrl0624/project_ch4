package com.ch4.pojo;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class CompanyLogic {
	CompanyDao cDao = null;
	public CompanyLogic() {
		cDao = new CompanyDao();
	}

	public int mngCommit(Map<String, Object> pMap) {
		int result = 0;
		result = cDao.mngCommit(pMap);
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

}
