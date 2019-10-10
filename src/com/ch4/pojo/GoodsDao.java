package com.ch4.pojo;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.log4j.Logger;

import com.ch4.util.MyBatisCommonFactory;

public class GoodsDao {
   Logger logger = Logger.getLogger(GoodsDao.class);
   SqlSessionFactory sqlSessionFactory = null;
   SqlSession sqlSession = null;
   
   public GoodsDao() {
      sqlSessionFactory = MyBatisCommonFactory.getSqlSessionFactory();
      sqlSession = sqlSessionFactory.openSession();
   }

   public void goodsApplyAdd(Map<String, Object> applyAdd) {
      
      logger.info("applyAdd : " + applyAdd);
      sqlSession.update("goodsApplyAdd", applyAdd);
      int result = (int)applyAdd.get("result");
      if(result==0) {   
         return;
      }
      else if(result==1) {
         sqlSession.commit();
      }
   }
   
   public int goodsSubAdd(Map<String,Object> gmMap) {
      int result = 0;
      
      int gmNum = ((List<Map<String,Object>>)gmMap.get("gmAddList")).size();
      int rowNum = 0;
      
      rowNum = sqlSession.insert("goodsAdd", gmMap);
      if(gmNum==rowNum) {
         result = 1;
         sqlSession.commit();
      }      
      else {
         return result;
      }
      
      return result;
   }
   
   public int goodsUpdate(Map<String, Object> pMap) {
      int result = 0;
      sqlSession.update("goodsApplyUpdate", pMap);
      result = (int)pMap.get("result");
      if(result==1) {
         sqlSession.commit();
      }
      return result;
   }

   public int goodsCancle(Map<String, Object> pMap) {
      int result = 0;
      sqlSession.update("goodsApplyCancle", pMap);
      result = (int)pMap.get("result");
      if(result==1) {
         sqlSession.commit();
      }
      return result;
   }

   public List<Map<String, Object>> preGoodsList(Map<String, Object> pMap) {
      sqlSession.selectList("preGoodsSearch", pMap);
      List<Map<String,Object>> preGoodsList = (List<Map<String,Object>>)pMap.get("preList");
      return preGoodsList;
   }

   public Map<String, Object> goodsDetail(Map<String, Object> pMap) {
      Map<String,Object> rMap = new HashMap<String, Object>();
      
      Map<String, Object> infoMap = sqlSession.selectOne("goodsApplySearch", pMap);
      List<Map<String, Object>> gmList = sqlSession.selectList("goodsSearch", pMap);
      
      rMap.put("infoMap", infoMap);
      rMap.put("gmList", gmList);
      
      return rMap;
   }

   public List<Map<String,Object>> goodsSearch(Map<String, Object> pMap) {
      List<Map<String,Object>> goodsSearch = sqlSession.selectList("goodsApplySearch", pMap);
      return goodsSearch;
   }

   public List<Map<String, Object>> goodsList(Map<String, Object> pMap) {
      List<Map<String, Object>> goodsList = sqlSession.selectList("goodsApplySearch", pMap);
      return goodsList;
   }

   public Map<String, Object> preGoodsDetail(Map<String, Object> pMap) {
      Map<String, Object> rMap = new HashMap<String, Object>();
      List<Map<String,Object>> gmList = sqlSession.selectList("goodsSearch", pMap);
      rMap.put("gmList", gmList);
      return rMap;
   }

   public List<Map<String, Object>> qrCodeList(Map<String, Object> pMap) {
      List<Map<String,Object>> qrCodeList = sqlSession.selectList("goodsQRcode",pMap);
      return qrCodeList;
   }

}