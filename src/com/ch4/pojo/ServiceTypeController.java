package com.ch4.pojo;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

public class ServiceTypeController implements Controller{
	Logger logger = Logger.getLogger(ServiceTypeController.class);
	String requestName = null;

	public ServiceTypeController(String requestName) {
		this.requestName = requestName;
	}

	@Override
	public ModelAndView excute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		logger.info("execute 호출 성공");
		ModelAndView mav = new ModelAndView();
		mav.isRedirect(true);
		if("visitor".equals(requestName)) {
			mav.setViewName("Visit_Main.jsp");
		}
		else if("company".equals(requestName)) {
			mav.setViewName("Manager_Main.jsp");
		}
		else if("admin".equals(requestName)) {
			mav.setViewName("Admin_MangerLogin.jsp");
		}
		
		return mav;
	}

}
