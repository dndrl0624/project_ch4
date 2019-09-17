package com.ch4.pojo;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class InfoController implements Controller{
	String requestName = null;

	public InfoController(String requestName) {
		this.requestName = requestName;
	}

	@Override
	public ModelAndView excute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = null;
		return mav;
	}


}
