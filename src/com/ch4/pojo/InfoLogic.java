package com.ch4.pojo;

import java.util.Map;

public class InfoLogic {
	InfoDao iDao = null;
	
	public InfoLogic() {
		iDao = new InfoDao();
	}

	public int confirmQR(Map<String, Object> pMap) {
		int result = 0;
		result = iDao.confirmQR(pMap);
		pMap.put("result", result);
		return result;
	}

}
