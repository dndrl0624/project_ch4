package com.ch4.pojo;

import java.util.Map;

public class GoodsLogic {
	GoodsDao gDao = null;
	public GoodsLogic() {
		gDao = new GoodsDao();
	}

	public int goodsAdd(Map<String, Object> pMap) {
		int result = 0;
		result = gDao.goodsAdd(pMap);
		return result;
	}

	public int goodsUpdate(Map<String, Object> pMap) {
		int result = 0;
		result = gDao.goodsUpdate(pMap);
		return result;
	}

	public int goodsCancle(Map<String, Object> pMap) {
		int result = 0;
		result = gDao.goodsCancle(pMap);
		return result;
	}


}
