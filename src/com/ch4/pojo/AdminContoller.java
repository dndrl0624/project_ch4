package com.ch4.pojo;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.ch4.util.HashMapBinder;

public class AdminContoller implements Controller{
	Logger logger = Logger.getLogger(AdminContoller.class);
	String requestName = null;
	AdminLogic adminLogic = null;
	final static String adminID = "admin";
	final static String adminPW = "q1w2e3r4";
	
	public AdminContoller(String requestName) {
		this.requestName = requestName;
		adminLogic = new AdminLogic();
	}

	@Override
	public ModelAndView excute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		logger.info("execute 호출 성공");
		ModelAndView mav = new ModelAndView(req, res);
		Map<String,Object> pMap = new HashMap<>();
		HashMapBinder hmb = new HashMapBinder(req);
		hmb.bind(pMap);

		if("adminLogin".equals(requestName)) {
			if(pMap.get("adminID").equals(adminID)&&(pMap.get("adminPW").equals(adminPW))) {
				mav.setViewName("Admin_MangerInfo.jsp");
			}else {//실패하면
				mav.setViewName("");
			}
		}
		else if("adminInfo".equals(requestName)) {
			logger.info("admininfo 임");
		}
		else if("sendAnwser".equals(requestName)) {
			int result = 0;
			try {
				SendMail sm = new SendMail();
				//메일 보내기
				sm.sendMail(pMap);
				logger.info("메일 보내기 성공");
			} catch (MessagingException me) {
				me.printStackTrace();
				logger.info("메일 보내기 실패");
			} catch (Exception e) {
				e.printStackTrace();
				logger.info("메일 전송 실패");
			}
			result = adminLogic.sendAnwser(pMap);
			if(result == 1) {//성공
				mav.setViewName("Admin_QnA.jsp");
			}else {
				mav.setViewName("");
			}
		}
		return mav;
	}

}
