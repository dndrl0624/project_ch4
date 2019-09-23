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
		ModelAndView mav = new ModelAndView(req, res);
		Map<String,Object> pMap = new HashMap<>();
		HashMapBinder hmb = new HashMapBinder(req);
		hmb.multiBind(pMap);
		if(requestName.equals("mngPermit")) {
			int result = 0;
			logger.info("pMap : " + pMap);
			result = cLogic.mngPermit(pMap);
			if(result == 1) {
				mav.setViewName(".jsp");
			}
			else if(result ==0) {
				mav.setViewName(".jsp");
			}
		}
		else if(requestName.equals("mngUpdate")) {
			int result = 0;
			logger.info("pMap : " + pMap);
			result = cLogic.mngUpdate(pMap);
			if(result == 1) {
				mav.setViewName(".jsp");
			}
			else if(result ==0) {
				mav.setViewName(".jsp");
			}
		}
		else if(requestName.equals("login")) {
			int result = 0;
			result = cLogic.companyLogin(pMap);
			if(result == 1) {
				mav.setViewName(".jsp");
			}
			else if(result ==0) {
				mav.setViewName(".jsp");
			}
		}
		else if(requestName.equals("join")) {
			int result = 0;
			result = cLogic.companyJoin(pMap);
			if(result == 1) {
				mav.setViewName(".jsp");
			}
			else if(result ==0) {
				mav.setViewName(".jsp");
			}
		}
		else if(requestName.equals("isExistID")) {
			int result = 0;
			result = cLogic.isExistID(pMap);
			if(result == 1) {
				mav.setViewName(".jsp");
			}
			else if(result ==0) {
				mav.setViewName(".jsp");
			}
		}

		return mav;
		
	}

}
