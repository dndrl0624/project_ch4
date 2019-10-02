package com.ch4.pojo;

import org.apache.log4j.Logger;

public class RequestMapping {
	static Logger logger = Logger.getLogger(RequestMapping.class);
	static String requestName = "";
	
	public static Controller getController(String command) {	
		
		Controller controller = null;
		String commands[] = command.split("/");
		String work = commands[1];
		String requestName = commands[2];
		RequestMapping.requestName = requestName.substring(0,requestName.indexOf(".ch4"));
		if((RequestMapping.requestName.indexOf("list")>-1)
				||(RequestMapping.requestName.indexOf("List")>-1)
				||("detail".equals(RequestMapping.requestName))
				||("search".equals(RequestMapping.requestName))
		  ) {
			return controller;
		}
		
		
		if("company".equals(work)) {
			controller = new CompanyController(RequestMapping.requestName);
		}
		else if("visitor".equals(work)) {
			controller = new VisitorController(RequestMapping.requestName);
		}
		else if("goods".equals(work)) {
			controller = new GoodsController(RequestMapping.requestName);
		}
		else if("info".equals(work)) {
			controller = new InfoController(RequestMapping.requestName);
		}
		else if("service".equals(work)) {
			controller = new ServiceTypeController(RequestMapping.requestName);
		}
		
		
	
		return controller;
	}

}
