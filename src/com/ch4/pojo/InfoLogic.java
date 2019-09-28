package com.ch4.pojo;

import java.util.Map;

public class InfoLogic {
	InfoDao iDao = null;
	
	public InfoLogic() {
		iDao = new InfoDao();
	}

	public Map<String, Object> confirmQR(Map<String, Object> pMap) {
		Map<String, Object> resultMap = null;
		resultMap = iDao.confirmQR(pMap);
		return resultMap;
	}

	public int kioskLogin(Map<String, Object> pMap) {
		int result = 0;
		result = iDao.kioskLogin(pMap);
		return result;
	}

	public int kioskJoin(Map<String, Object> pMap) {
		int result = 0;
		result = iDao.kioskJoin(pMap);
		return result;
	}

}
