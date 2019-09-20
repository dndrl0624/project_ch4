package com.ch4.pojo;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.ch4.util.HashMapBinder;

public class GoodsController implements Controller{
	Logger logger = Logger.getLogger(GoodsController.class);
	String requestName = null;
	GoodsLogic gLogic = null;

	public GoodsController(String requestName) {
		this.requestName = requestName;
		gLogic = new GoodsLogic();
	}

	@Override
	public ModelAndView excute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		logger.info("execute 호출 성공");
		ModelAndView mav = new ModelAndView(req, res);
		Map<String,Object> pMap = new HashMap<>();
		HashMapBinder hmb = new HashMapBinder(req);
		if(requestName.equals("add")) {
			int result = 0;
			hmb.multiBind(pMap);
			logger.info("pMap : " + pMap);
			result = gLogic.goodsApplyAdd(pMap);
			
			if(result == 1) {
				mav.isRedirect(false);
				mav.addObject("aplg_no",pMap.get("aplg_no"));
				mav.setViewName("Visit_ResultGoods.jsp");
			}
			else if(result == 0) {
				mav.setViewName("Visit_ApplyFail.jsp");
			}
			
		}
		else if(requestName.equals("update")) {
			int result = 0;
			hmb.multiBind(pMap);
			logger.info("pMap : " + pMap);
			result = gLogic.goodsUpdate(pMap);
			if(result == 1) {
				mav.setViewName("Visit_ResultGoods.jsp");
			}
			else if(result == 0) {
				mav.setViewName("Visit_ApplyFail.jsp");
			}
		}
		else if(requestName.equals("cancle")) {
			int result = 0;
			hmb.multiBind(pMap);
			logger.info("pMap : " + pMap);
			result = gLogic.goodsCancle(pMap);
			if(result == 1) {
				mav.setViewName("Visit_Main.jsp");
			}
			else if(result == 0) {
				mav.setViewName("Visit_ApplyFail.jsp");
			}
		}
		return mav;
	}

}
