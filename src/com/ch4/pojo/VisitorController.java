package com.ch4.pojo;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import com.ch4.util.HashMapBinder;

public class VisitorController implements Controller {
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
      ModelAndView mav = new ModelAndView(req, res);
      Map<String, Object> pMap = new HashMap<>();
      HashMapBinder hmb = new HashMapBinder(req);
      hmb.bind(pMap);
      logger.info("pMap : " + pMap);

      if (requestName.equals("applyRequest")) {
         HttpSession session = req.getSession();
         session.setAttribute("pMap", pMap);
         mav.isRedirect(false);
         mav.setViewName("Visit_Agreement.jsp");
      } else if (requestName.equals("searchVisitor")) {
         mav.isRedirect(true);
         mav.setViewName("Visit_SearchVisitor.jsp");
      } else if (requestName.equals("searchVQRcode")) {
         // mav.isRedirect(false);
         mav.setViewName("Visit_SearchVisitorQR.jsp");
      } else if (requestName.equals("applyAgreement")) {
         logger.info("pMap : " + pMap);
         mav.isRedirect(false);
         mav.setViewName("Visit_Select.jsp");
      } else if (requestName.equals("visitPurpose")) {
         String vPP = req.getParameter("pp");
         if (vPP.equals("visitor")) {
            mav.isRedirect(false);
            mav.setViewName("Visit_ApplyVisitor.jsp");
         } else if (vPP.equals("goods")) {
            mav.isRedirect(false);
            mav.setViewName("Visit_ApplyGoods.jsp");
         }
      } else if (requestName.equals("add")) {
         int result = 0;
         result = vLogic.visitApplyAdd(pMap);

         if (result == 1) {
            mav.isRedirect(false);
            mav.addObject("visit_no", pMap.get("visit_no"));
            mav.addObject("vtAddList", pMap.get("vtAddList"));
            mav.addObject("tkAddList", pMap.get("tkAddList"));
            mav.addObject("pkAddList", pMap.get("pkAddList"));
            mav.setViewName("Visit_ResultVisitor.jsp");
         } else if (result == 0) {
            mav.setViewName("Fail.jsp");
         }
      } else if (requestName.equals("cancle")) {
         int result = 0;
         result = vLogic.visitorCancle(pMap);
         if (result == 1) {
            mav.isRedirect(true);
            mav.setViewName("Visit_Main.jsp");
         } else if (result == 0) {
            mav.isRedirect(false);
            mav.setViewName("Fail.jsp");
         }
      } else if (requestName.equals("changeVisitor")) {
         mav.isRedirect(false);
         Map<String, Object> rMap = vLogic.applyDetail(pMap);
         mav.addObject("rMap", rMap);
         logger.info(rMap);
         mav.setViewName("Visit_ChangeVisitor.jsp");
      } else if (requestName.equals("update")) {
         int result = 0;
         result = vLogic.visitorUpdate(pMap);
         mav.isRedirect(false);
         if (result == 1) {
            mav.addObject("visit_no", pMap.get("visit_no"));
            mav.addObject("vtAddList", pMap.get("vtAddList"));
            mav.addObject("tkAddList", pMap.get("tkAddList"));
            mav.addObject("pkAddList", pMap.get("pkAddList"));
            mav.setViewName("Visit_ResultVisitor.jsp");
         } else if (result == 0) {
            mav.setViewName("Fail.jsp");
         }
      }

      return mav;
   }

}