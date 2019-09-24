package com.ch4.pojo;

import java.util.Map;

public class AdminLogic {
	AdminDao adminDao = null;
	public AdminLogic() {
		adminDao = new AdminDao();
	}

	public int sendAnwser(Map<String, Object> pMap) {
		int result = 0;
		result = adminDao.sendAnwser(pMap);
		return result;
	}

}
