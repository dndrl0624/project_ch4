package com.ch4.pojo;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

public class ActionServlet extends HttpServlet {
	Logger logger = Logger.getLogger(ActionServlet.class);
	String viewPath = "../View";
	public void doService(HttpServletRequest req, HttpServletResponse res)
			throws ServletException,IOException{
		
		req.setCharacterEncoding("UTF-8");
	    res.setCharacterEncoding("UTF-8");
		
		/******************************************************s
		 * requestURI  : 요청주소에서 호스트부분을 제외한 주소                   *
		 * contextPath : 해당 요청에 해당하는 폴더 이름(View아래)       *
		 * command     : 사용자가 요청한 실제 내용(컨트롤러/요청내용)     *
		 *****************************************************/
		
		String requestURI = req.getRequestURI();// (=/컨트롤러/요청내용.ch4)
		String contextPath = requestURI.substring(0,requestURI.indexOf("/",2)) + "/"; // (=/컨트롤러)
		String command = requestURI.substring(1); //(=컨트롤러/요청내용.ch4)
		logger.info("command:"+command);
		Controller controller = null;
		Rcontroller rController = null;

		////////////////RequestMapping/////////////////
		try {
			controller = RequestMapping.getController(command);
			rController = RequestMappingR.getController(command);
		} catch (Exception e) {
			logger.info("Mapping Exception : " + e.getMessage());
		}
		///////////////////////////////////////////////
		
		ModelAndView mav = null;
		String viewName = null;
		
		if((controller==null) && (rController != null)) { // RestController인 경우
			logger.info("RestController 호출 성공");
			try {
				String json = rController.execute(req, res);
				PrintWriter out = res.getWriter();
				out.write(json);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		else if(controller!=null) { // 그외인 경우
			try {
				mav = controller.excute(req, res);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			// 이 컨트롤러는 url 패턴이 다른 컨트롤러와 달리
			// "service/(???).ch4 에서 (???)부분이 view폴더 이름이 된다.
			// 따라서 다른 path 지정이 필요.
			if(controller instanceof ServiceTypeController) {
				String requestName = requestURI.substring(requestURI.indexOf(contextPath)+contextPath.length()-1,requestURI.indexOf(".ch4")) + "/";
				logger.info("ClientTypeController 호출 성공");
				viewName = mav.viewName;
				res.sendRedirect(viewPath + requestName + viewName);
		
			}
			else if(controller instanceof CompanyController) {
				logger.info("CompanyController 호출 성공");
				viewName = mav.viewName;
				boolean isRedirect = mav.isRedirect;
				if(viewName.equals("Fail.jsp")) {
					contextPath = "/";
				}
				if(isRedirect) {
					res.sendRedirect(viewPath + contextPath + viewName);
				}
				else {
					RequestDispatcher view = req.getServletContext().getRequestDispatcher("/View" + contextPath + viewName);
					view.forward(req, res);
				}
				
			}
			else if(controller instanceof VisitorController) {
				logger.info("VisitorController 호출 성공");
				viewName = mav.viewName;
				boolean isRedirect = mav.isRedirect;
				if(viewName.equals("Fail.jsp")) {
					contextPath = "/";
				}
				if(isRedirect) {
					res.sendRedirect(viewPath + contextPath + viewName);
				}
				else {
					RequestDispatcher view = req.getServletContext().getRequestDispatcher("/View" + contextPath + viewName);
					view.forward(req, res);
				}
			}
			else if(controller instanceof InfoController) {
				logger.info("InfoController 호출 성공");
				viewName = mav.viewName;
				boolean isRedirect = mav.isRedirect;
				if(viewName.equals("Fail.jsp")) {
					contextPath = "/";
				}
				if(isRedirect) {
					res.sendRedirect(viewPath + contextPath + viewName);
				}
				else {
					RequestDispatcher view = req.getServletContext().getRequestDispatcher("/View" + contextPath + viewName);
					view.forward(req, res);
				}
			}
			else if(controller instanceof GoodsController) {
				logger.info("GoodsController 호출 성공");
				viewName = mav.viewName;
				boolean isRedirect = mav.isRedirect;
				if(viewName.equals("Fail.jsp")) {
					contextPath = "/s";
				}
				if(isRedirect) {
					res.sendRedirect(viewPath + "/visitor/" + viewName);
				}
				else {
					RequestDispatcher view = req.getServletContext().getRequestDispatcher("/View/visitor/" + viewName);
					view.forward(req, res);
				}
			}
		}
	}
	
	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException,IOException{
		doService(req,res);
	}
	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException,IOException{
		doService(req,res);
	}
}
