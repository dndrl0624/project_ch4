package com.ch4.pojo;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class GoodsLogic {
   GoodsDao gDao = null;
   public GoodsLogic() {
      gDao = new GoodsDao();
   }

   public int goodsApplyAdd(Map<String, Object> pMap) {
      int result = 0;
      String aplg_no = null;
      Map<String, Object> addInfo = SortAndBind.goodsApplySort(pMap);
      
      List<Map<String,Object>> gmAddList = (List<Map<String,Object>>)addInfo.get("gmAddList");
      Map<String,Object> applyAdd = (Map<String,Object>) addInfo.get("applyAdd");
      gDao.goodsApplyAdd(applyAdd);
      result = (int)applyAdd.get("result");
      if(result==0) {
         return result;
      }
      else if(result==1) {
         aplg_no = applyAdd.get("aplg_no").toString();
         pMap.put("aplg_no", aplg_no);
         
         Map<String, Object> gmMap = new HashMap<String, Object>();
         gmMap.put("aplg_no", aplg_no);
         gmMap.put("gmAddList", gmAddList);
         
         result = gDao.goodsSubAdd(gmMap);
         if(result==1) {
            pMap.put("gmAddList", gmAddList);
         }
      }
      return result;
   }

   public int goodsUpdate(Map<String, Object> pMap) {
      int result = 0;
      String aplg_no = null;
      Map<String, Object> updInfo = SortAndBind.goodsApplySort(pMap);
      
      List<Map<String,Object>> gmAddList = (List<Map<String,Object>>)updInfo.get("gmAddList");
      Map<String,Object> applyupd = (Map<String,Object>) updInfo.get("applyAdd");
      
      result = gDao.goodsUpdate(pMap);
      
      if(result==0) {
         return result;
      }
      else if(result==1) {
         aplg_no = pMap.get("aplg_no").toString();
         
         Map<String, Object> gmMap = new HashMap<String, Object>();
          gmMap.put("aplg_no", aplg_no);
          gmMap.put("gmAddList", gmAddList);
          
          result = gDao.goodsSubAdd(gmMap);
          
          if(result==1) {
             pMap.put("gmAddList", gmAddList);
          }
      }
      return result;
   }

   public int goodsCancle(Map<String, Object> pMap) {
      int result = 0;
      result = gDao.goodsCancle(pMap);
      return result;
   }

   public List<Map<String, Object>> preGoodsList(Map<String, Object> pMap) {
      List<Map<String,Object>> preGoodsList = gDao.preGoodsList(pMap);
      return preGoodsList;
   }
   
   public Map<String, Object> preGoodsDetail(Map<String, Object> pMap) {
      Map<String, Object> rMap = gDao.preGoodsDetail(pMap);
      return rMap;
   }

   public List<Map<String,Object>> goodsSearch(Map<String, Object> pMap) {
	  List<Map<String,Object>> goodsSearch = gDao.goodsSearch(pMap);  
      return goodsSearch;
   }

   public List<Map<String, Object>> goodsList(Map<String, Object> pMap) {
      List<Map<String, Object>> goodsList = gDao.goodsList(pMap);
      return goodsList;
   }

   public Map<String, Object> goodsDetail(Map<String, Object> pMap) {
      Map<String, Object> goodsDetail = gDao.goodsDetail(pMap);
      return goodsDetail;
   }

   public List<Map<String, Object>> qrCodeList(Map<String, Object> pMap) {
      List<Map<String,Object>> qrCodeList = gDao.qrCodeList(pMap);
      return qrCodeList;
   }


}