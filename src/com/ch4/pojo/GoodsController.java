package com.ch4.pojo;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.ch4.util.HashMapBinder;

public class GoodsController implements Controller {
   Logger logger = Logger.getLogger(GoodsController.class);
   String requestName = null;
   GoodsLogic gLogic = null;

   public GoodsController(String requestName) {
      this.requestName = requestName;
      gLogic = new GoodsLogic();
   }

   @Override
   public ModelAndView excute(HttpServletRequest req, HttpServletResponse res) throws Exception {
      logger.info("execute 호출 성공");
      ModelAndView mav = new ModelAndView(req, res);
      Map<String, Object> pMap = new HashMap<>();
      HashMapBinder hmb = new HashMapBinder(req);
      hmb.bind(pMap);
      logger.info("pMap : " + pMap);
      if (requestName.equals("add")) {
         int result = 0;
         result = gLogic.goodsApplyAdd(pMap);
         if (result == 1) {
            mav.isRedirect(false);
            mav.addObject("aplg_no", pMap.get("aplg_no"));
            mav.addObject("gmAddList", pMap.get("gmAddList"));
            mav.setViewName("Visit_ResultGoods.jsp");
         } else if (result == 0) {
            mav.setViewName("Fail.jsp");
         }

      } else if (requestName.equals("cancle")) {
         int result = 0;
         result = gLogic.goodsCancle(pMap);
         if (result == 1) {
            mav.isRedirect(true);
            mav.setViewName("Visit_Main.jsp");
         } else if (result == 0) {
            mav.isRedirect(false);
            mav.setViewName("Fail.jsp");
         }
      } else if (requestName.equals("changeGoods")) {
         mav.isRedirect(false);
         Map<String, Object> rMap = gLogic.goodsDetail(pMap);
         mav.addObject("rMap", rMap);
         logger.info(rMap);
         mav.setViewName("Visit_ChangeGoods.jsp");
      } else if (requestName.equals("update")) {
         int result = 0;
         result = gLogic.goodsUpdate(pMap);
         if (result == 1) {
            mav.addObject("aplg_no", pMap.get("aplg_no"));
            mav.addObject("gmAddList", pMap.get("gmAddList"));
            mav.setViewName("Visit_ResultGoods.jsp");
         } else if (result == 0) {
            mav.isRedirect(false);
            mav.setViewName("Fail.jsp");
         }
      } else if (requestName.equals("searchGoods")) {
         mav.isRedirect(true);
         mav.setViewName("Visit_SearchGoods.jsp");
      }
      return mav;
   }

}