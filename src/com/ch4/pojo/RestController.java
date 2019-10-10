package com.ch4.pojo;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.ch4.util.HashMapBinder;
import com.google.gson.Gson;

public class RestController implements Rcontroller {
   Logger logger = Logger.getLogger(RestController.class);
   String work = null;
   String requestName = null;
   Gson g = null;

   public RestController(String work, String requestName) {
      this.work = work;
      this.requestName = requestName;
      g = new Gson();
   }

   @Override
   public String execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
      logger.info("execute 호출 성공");
      String jsonStr = null;
      Map<String,Object> pMap = new HashMap<>();
      HashMapBinder hmb = new HashMapBinder(req);
      hmb.bind(pMap);
      logger.info("pMap : " + pMap);
      if ("company".equals(work)) {/////////start of company
         CompanyLogic cLogic = new CompanyLogic();
         if (requestName.equals("applyVisitList")) {
            List<Map<String, Object>> applyVisitList =  cLogic.applyVisitList(pMap);
            jsonStr = g.toJson(applyVisitList);
         } 
         else if (requestName.equals("inOutList")) {
            List<Map<String, Object>> inOutList = cLogic.inOutList(pMap);
            jsonStr = g.toJson(inOutList);
         }
         else if (requestName.equals("applyGoodsList")) {
            List<Map<String, Object>> applyGoodsList = cLogic.applyGoodsList(pMap);
            jsonStr = g.toJson(applyGoodsList);
         }
      } ////////////////////////////////////end of company
      else if ("visitor".equals(work)) {/////////start of visitor
         VisitorLogic vLogic = new VisitorLogic();
         if (requestName.equals("companyList")) {
            logger.info("companyList 호출 성공");
            List<Map<String, Object>> companyList = vLogic.companyList();
            jsonStr = g.toJson(companyList);            
         }
         else if (requestName.equals("deptList")) {
            List<Map<String, Object>> deptList = vLogic.deptList(pMap);
            jsonStr = g.toJson(deptList);
         }
         else if (requestName.equals("preVisitList")) {
            List<Map<String,Object>> preVisitList = vLogic.preVisitList(pMap);
            jsonStr = g.toJson(preVisitList);
         }
         else if (requestName.equals("preVisitListDetail")) {
            Map<String,Object> preVisitDetail = vLogic.previsitDetail(pMap);
            jsonStr = g.toJson(preVisitDetail);
         }
         else if (requestName.equals("search")) {
            if(pMap.get("searchType").equals("num")) {
               List<Map<String, Object>> applySearch = vLogic.applySearch(pMap);
               jsonStr = g.toJson(applySearch);
            }
            else if(pMap.get("searchType").equals("info")){
               List<Map<String, Object>> applyList = vLogic.applyList(pMap);
               jsonStr = g.toJson(applyList);
            }
         }
         else if (requestName.equals("detail")) {
            Map<String,Object> rMap = vLogic.applyDetail(pMap);
            jsonStr = g.toJson(rMap);
         }
         else if (requestName.equals("qrCodeList")) {
            List<Map<String,Object>> qrCodeList = vLogic.qrCodeList(pMap);
            jsonStr = g.toJson(qrCodeList);
         }         
      } //////////////////////////////////////////end of visitor
      else if ("goods".equals(work)) {/////////start of goods
         GoodsLogic gLogic = new GoodsLogic();   
         if (requestName.equals("preGoodsList")) {
            List<Map<String,Object>> preGoodsList = gLogic.preGoodsList(pMap);
            logger.info("goods/preGoodsList");
            jsonStr = g.toJson(preGoodsList);
         }
         else if (requestName.equals("preGoodsListDetail")) {
            Map<String, Object> preGoodsDetail = gLogic.preGoodsDetail(pMap);
            jsonStr = g.toJson(preGoodsDetail);
         }
         else if (requestName.equals("search")) {
            if(pMap.get("searchType").equals("num")) {
               List<Map<String,Object>> goodsSearch = gLogic.goodsSearch(pMap);
               jsonStr = g.toJson(goodsSearch);
            }
            else if(pMap.get("searchType").equals("info")){
               List<Map<String, Object>> goodsList = gLogic.goodsList(pMap);
               jsonStr = g.toJson(goodsList);
            }
         
         }
         else if (requestName.equals("detail")) {
            Map<String, Object> rMap = gLogic.goodsDetail(pMap);
            jsonStr = g.toJson(rMap);
         }
         else if (requestName.equals("qrCodeList")) {
            List<Map<String,Object>> qrCodeList = gLogic.qrCodeList(pMap);
            jsonStr = g.toJson(qrCodeList);
         }         
      }////////////////////////////////////////end of goods 
      else if ("info".equals(work)) {
         InfoLogic iLogic = new InfoLogic();
         if (requestName.equals("list")) {
            
         } else if (requestName.equals("detail")) {

         }
      }

      logger.info("jsonStr : " + jsonStr);
      return jsonStr;
   }
}