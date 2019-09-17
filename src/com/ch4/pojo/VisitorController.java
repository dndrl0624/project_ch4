package com.ch4.pojo;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import com.ch4.util.HashMapBinder;

public class VisitorController implements Controller{
	Logger logger = Logger.getLogger(VisitorController.class);
	String requestName = null;
	VisitorLogic vLogic = null;

	public VisitorController(String requestName) {
		this.requestName = requestName;
		vLogic = new VisitorLogic();
	}

	@Override
	public ModelAndView excute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		logger.info("execute 호출 성공");
		ModelAndView mav = new ModelAndView();
		Map<String,Object> pMap = new HashMap<>();
		HashMapBinder hmb = new HashMapBinder(req);
		if(requestName.equals("visitPurpose")) {
			mav.isRedirect(false);
			String vPP = req.getParameter("pp");
			if(vPP.equals("visit")) {
				mav.setViewName("Visit_ApplyVisitor.jsp");
			}
			else if(vPP.equals("goods")) {
				mav.setViewName("Visit_ApplyGoods.jsp");
			}
		}
		else if(requestName.equals("applyRequest")) {
			mav.isRedirect(false);
			hmb.bind(pMap);
			logger.info("pMap : " + pMap);
			HttpSession session = req.getSession();
			session.setAttribute("pMap", pMap);
			mav.setViewName("Visit_Agreement.jsp");
		}
		else if(requestName.equals("applyAgreement")) {
			mav.isRedirect(false);
			hmb.bind(pMap);
			logger.info("pMap : " + pMap);
			mav.setViewName("Visit_Select.jsp");
		}
		else if(requestName.equals("add")) {
			mav.isRedirect(false);
			hmb.bind(pMap);
			int result = 0;
			logger.info("pMap : " + pMap);
			result = vLogic.visitrorAdd(pMap);
			if(result == 0) {
				mav.setViewName("Visit_ResultVisitor.jsp");
				mav.addObject("visit_no", result);
			}
			else if(result == 1) {
				mav.setViewName("Visit_ApplyFail.jsp");
			}
		}
		else if(requestName.equals("update")) {
			int result = 0;
			hmb.bind(pMap);
			logger.info("pMap : " + pMap);
			result = vLogic.visitorUpdate(pMap);
			if(result == 0) {
				mav.setViewName("Visit_ResultVisitor.jsp");
			}
			else if(result == 1) {
				mav.setViewName("Visit_ApplyFail.jsp");
			}
		}
		else if(requestName.equals("cancle")) {
			int result = 0;
			hmb.bind(pMap);
			logger.info("pMap : " + pMap);
			result = vLogic.visitorCancle(pMap);
			if(result == 0) {
				mav.setViewName("Visit_Main.jsp");
			}
			else if(result == 1) {
				mav.setViewName("Visit_ApplyFail.jsp");
			}
		}
		
		return mav;
	}

}
