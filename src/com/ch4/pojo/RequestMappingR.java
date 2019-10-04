package com.ch4.pojo;

import org.apache.log4j.Logger;

public class RequestMappingR {
	static String requestName = "";
	static Logger logger = Logger.getLogger(ActionServlet.class);

	public static Rcontroller getController(String command) {

		Rcontroller rController = null;
		String commands[] = command.split("/");
		String work = commands[0];
		String requestName = commands[1];
		RequestMappingR.requestName = requestName.substring(0,requestName.indexOf(".ch4"));
		
		if(
				(
						("company".equals(work))
						||("visitor".equals(work))
						||("goods".equals(work))
						||("info".equals(work))
				)
				&&(
						(RequestMapping.requestName.indexOf("list")>-1)
						||(RequestMapping.requestName.indexOf("List")>-1)
						||("detail".equals(RequestMapping.requestName))
						||("search".equals(RequestMapping.requestName))
				)
			) 
		{
			rController = new RestController(work,RequestMappingR.requestName);
		}
		return rController;
	}

}
