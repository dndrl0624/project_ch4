package com.ch4.pojo;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Controller {
	public ModelAndView excute(HttpServletRequest req, HttpServletResponse res) 
			throws Exception;

}
