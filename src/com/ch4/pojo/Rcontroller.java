package com.ch4.pojo;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Rcontroller {
	public abstract String execute(HttpServletRequest req, HttpServletResponse res) throws Exception;

}
