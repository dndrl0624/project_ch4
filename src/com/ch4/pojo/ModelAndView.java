package com.ch4.pojo;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ModelAndView {
	HttpServletRequest req = null;
	HttpServletResponse res = null;
	String viewName = null;
	List<Map<String,Object>> reqList = new ArrayList<>();
	Object obj = null;
	public boolean isRedirect = false;
	public ModelAndView() {
		
	}
	public ModelAndView(HttpServletRequest req, HttpServletResponse res) {
		this.req = req;
		this.res = res;
	}
	public void setViewName(String viewName) {
		this.viewName = viewName;
	}
	public void addObject(Object obj) {
		this.obj = obj;
	}
	public void isRedirect(boolean isRedirect) {
		this.isRedirect = isRedirect;
	}


}
