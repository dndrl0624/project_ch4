package com.ch4.pojo;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.ch4.util.HashMapBinder;

public class CompanyController implements Controller{
	Logger logger = Logger.getLogger(CompanyController.class);
	String requestName = null;
	CompanyLogic cLogic = null;

	
	public CompanyController(String requestName) {
		this.requestName = requestName;
		cLogic = new CompanyLogic();
	}

	@Override
	public ModelAndView excute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		logger.info("execute 호출 성공");
		ModelAndView mav = new ModelAndView();
		Map<String,Object> pMap = new HashMap<>();
		HashMapBinder hmb = new HashMapBinder(req);
		if(requestName.equals("mngcommit")) {
			int result = 0;
			hmb.multiBind(pMap);
			logger.info("pMap : " + pMap);
			result = cLogic.mngCommit(pMap);
			if(result == 0) {
				mav.setViewName("Visit_ResultGoods.jsp");
			}
			else if(result == 1) {
				mav.setViewName("Visit_ApplyFail.jsp");
			}
		}

		return mav;
	}

}
