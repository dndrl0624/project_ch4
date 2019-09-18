package com.ch4.pojo;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class GoodsLogic {
	GoodsDao gDao = null;
	public GoodsLogic() {
		gDao = new GoodsDao();
	}

	public int goodsApplyAdd(Map<String, Object> pMap) {
		int result = 0;
		Map<String, Object> addInfo = SortAndBind.goodsApplySort(pMap);
		
		List<Map<String,Object>> gmAddList = (List<Map<String,Object>>)addInfo.get("gmAddList");
		Map<String,Object> applyAdd = (Map<String,Object>) addInfo.get("applyAdd");
		String aplg_no = gDao.goodsApplyAdd(applyAdd);
		
		if(aplg_no==null) {
			return result;
		}
		else {
			result = gDao.goodsSubAdd(gmAddList,aplg_no);
		}
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
