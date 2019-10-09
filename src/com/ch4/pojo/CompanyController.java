package com.ch4.pojo;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import com.ch4.util.HashMapBinder;

public class CompanyController implements Controller {
   static String QRImagePath = "";
   Logger logger = Logger.getLogger(CompanyController.class);
   String requestName = null;
   CompanyLogic cLogic = null;

   public CompanyController(String requestName) {
      this.requestName = requestName;
      cLogic = new CompanyLogic();
   }

   @Override
   public ModelAndView excute(HttpServletRequest req, HttpServletResponse res) throws Exception {
      logger.info("execute 호출 성공");
      QRImagePath = req.getRealPath("/QR/");
      ModelAndView mav = new ModelAndView(req, res);
      Map<String, Object> pMap = new HashMap<>();
      HashMapBinder hmb = new HashMapBinder(req);
      hmb.bind(pMap);
      logger.info("pMap : " + pMap);
      if (requestName.equals("mngPermit")) {
         int result = 0;
         result = cLogic.mngPermit(pMap);
         if (result == 1) {
            mav.isRedirect(true);
            mav.setViewName("Manager_Main.jsp");
         } else if (result == 0) {
            mav.isRedirect(false);
            mav.setViewName("Fail.jsp");
         }
      } else if (requestName.equals("login")) {
         int result = 0;
         result = cLogic.companyLogin(pMap);
         String msg = pMap.get("msg").toString();
         mav.isRedirect(false);
         
         if(msg.equals("error")) {
            mav.setViewName("Fail.jsp");
         }
         else if(msg.equals("id")||msg.equals("pw")) {
            mav.addObject("msg", msg);
            mav.setViewName("Company_Login.jsp");
         }
         else if(msg.equals("success")) {
            Map<String,Object> sMap = new HashMap<String, Object>();
            sMap.put("cmng_id", pMap.get("cmng_id"));
            sMap.put("cmng_name", pMap.get("cmng_name"));
            sMap.put("com_no", pMap.get("com_no"));
            sMap.put("com_name", pMap.get("com_name"));
            sMap.put("dept_name", pMap.get("dept_name"));
            
            HttpSession session = req.getSession();
            session.setAttribute("sMap", sMap);
            
            if(pMap.get("cmng_grade").toString().equals("승인자")) {
               mav.setViewName("manager/Manager_Main.jsp");
            }
            else if(pMap.get("cmng_grade").toString().equals("안내데스크")) {
               mav.setViewName("info/Info_Main.jsp");
            }
         }
      } else if (requestName.equals("register")) {
         mav.isRedirect(true);
         mav.setViewName("Company_Join.jsp");
      } else if (requestName.equals("join")) {
         int result = 0;
         result = cLogic.companyJoin(pMap);
         if (result == 1) {
            mav.isRedirect(true);
            mav.setViewName("Company_Login.jsp");
         } else if (result == 0) {
            mav.isRedirect(false);
            mav.setViewName("Fail.jsp");
         }
      } else if (requestName.equals("isExistID")) {
         int result = 0;
         result = cLogic.isExistID(pMap);

      }

      return mav;

   }

}