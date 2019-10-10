package com.ch4.pojo;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
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
   VisitorLogic vLogic = null;

   public CompanyController(String requestName) {
      this.requestName = requestName;
      cLogic = new CompanyLogic();
      vLogic = new VisitorLogic();
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
            mav.setViewName("manager/Manager_SearchVisitor.jsp");
         } else if (result == 0) {
            mav.isRedirect(false);
            mav.setViewName("Fail.jsp");
         }
      } 
      else if (requestName.equals("login")) {
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
            ///////////////////// 세션에 정보 넘기기 //////////////////////
            Map<String,Object> sMap = new HashMap<String, Object>();
            sMap.put("cmng_id", pMap.get("cmng_id"));
            sMap.put("cmng_name", pMap.get("cmng_name"));
            sMap.put("com_no", pMap.get("com_no"));
            sMap.put("com_name", pMap.get("com_name"));
            sMap.put("dept_name", pMap.get("dept_name"));
            
            HttpSession session = req.getSession();
            session.setAttribute("sMap", sMap);
            //////////////////////////////////////////////////////////
            
            
           if(pMap.get("logincheck")!=null) {
              Cookie id = new Cookie("cmng_id", pMap.get("cmng_id").toString());
              Cookie pw = new Cookie("cmng_pw", pMap.get("cmng_pw").toString());
              logger.info(pMap.get("cmng_id").toString());
               logger.info(pMap.get("cmng_pw").toString());
               id.setMaxAge(60);
               pw.setMaxAge(60);
               
               res.addCookie(id);
               res.addCookie(pw);
           }
            
            if(pMap.get("cmng_grade").toString().equals("승인자")) {
               mav.setViewName("manager/Manager_Main.jsp");
            }
            else if(pMap.get("cmng_grade").toString().equals("안내데스크")) {
               mav.setViewName("info/Info_Main.jsp");
            }
         }
      } 
      else if (requestName.equals("register")) {
         mav.isRedirect(true);
         mav.setViewName("Company_Join.jsp");
      } 
      else if (requestName.equals("join")) {
         int result = 0;
         result = cLogic.companyJoin(pMap);
         if (result == 1) {
            mav.isRedirect(true);
            mav.setViewName("Company_Login.jsp");
         } else if (result == 0) {
            mav.isRedirect(false);
            mav.setViewName("Fail.jsp");
         }
      } 
      else if (requestName.equals("isExistID")) {
         int result = 0;
         result = cLogic.isExistID(pMap);
      }
      else if (requestName.equals("logout")) {
         HttpSession session = req.getSession();
         session.invalidate();
         
         mav.isRedirect(false);
         mav.setViewName("Company_Login.jsp");
      }
      else if (requestName.equals("applyVisitDetail")) {
         Map<String, Object> rMap = vLogic.applyDetail(pMap);
         mav.addObject("rMap", rMap);
         mav.setViewName("manager/Manager_DetailVisitor.jsp");
      }
      /////////////// SideMenuBar ///////////////////
      else if (requestName.equals("mng_main")) {
         mav.isRedirect(true);
         mav.setViewName("manager/Manager_Main.jsp");
      }
      else if (requestName.equals("searchVisitor")) {
         mav.isRedirect(true);
         mav.setViewName("manager/Manager_SearchVisitor.jsp");
      }
      else if (requestName.equals("logVisitor")) {
         mav.isRedirect(true);
         mav.setViewName("manager/Manager_LogVisitor.jsp");
      }
      else if (requestName.equals("searchGoods")) {
         mav.isRedirect(true);
         mav.setViewName("manager/Manager_SearchGoods.jsp");
      }
      else if (requestName.equals("logGoods")) {
         mav.isRedirect(true);
         mav.setViewName("manager/Manager_LogGoods.jsp");
      }

      return mav;

   }

}