package com.ch4.pojo;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.ch4.util.HashMapBinder;

public class InfoController implements Controller{
	Logger logger = Logger.getLogger(InfoController.class);
	String requestName = null;
	InfoLogic iLogic = null;

	public InfoController(String requestName) {
		this.requestName = requestName;
		iLogic = new InfoLogic();
	}

	@Override
	public ModelAndView excute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		logger.info("execute 호출 성공");
		ModelAndView mav = new ModelAndView(req, res);
		Map<String,Object> pMap = new HashMap<>();
		HashMapBinder hmb = new HashMapBinder(req);
		hmb.bind(pMap);
		if(requestName.equals("kioskLogin")) {
			int result = 0;
			result = iLogic.kioskLogin(pMap);
		}			
		else if(requestName.equals("kioskJoin")) {
			int result = 0;
			result = iLogic.kioskJoin(pMap);
		}
		else if(requestName.equals("QRconfirm")) {
			Map<String, Object> resultMap = null;
			resultMap = iLogic.confirmQR(pMap);
			mav.isRedirect(false);
			if("in".equals(resultMap.get("inout"))
					||"denied".equals(resultMap.get("inout"))
					||"none".equals(resultMap.get("inout"))
			  ) 
			{
				mav.addObject("pMap", pMap);
				mav.setViewName("Kiosk_Result.jsp");
			}
			else if("out".equals(resultMap.get("inout"))) {
				mav.addObject("pMap", pMap);
				mav.setViewName("Kiosk_SelectExit.jsp");
			}
			
		}
		else if(requestName.equals("selectExit")) {
			Map<String, Object> resultMap = null;
			resultMap = iLogic.confirmQR(pMap);
			mav.setViewName("Kiosk_Result.jsp");
		}
		return mav;
	}


}
