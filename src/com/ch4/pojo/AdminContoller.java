package com.ch4.pojo;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.ch4.util.HashMapBinder;

public class AdminContoller implements Controller{
	Logger logger = Logger.getLogger(AdminContoller.class);
	final static String adminID = "admin";
	final static String adminPW = "q1w2e3r4";

	@Override
	public ModelAndView excute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		logger.info("execute 호출 성공");
		ModelAndView mav = new ModelAndView(req, res);
		Map<String,Object> pMap = new HashMap<>();
		HashMapBinder hmb = new HashMapBinder(req);
		hmb.bind(pMap);
		if((pMap.get("").equals(adminID))&&(pMap.get("").equals(adminPW))) {
			mav.setViewName("");
		}
		return mav;
	}

}
