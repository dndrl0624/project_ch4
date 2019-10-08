package com.ch4.pojo;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.log4j.Logger;

import com.ch4.util.MyBatisCommonFactory;

public class VisitorDao {
   Logger logger = Logger.getLogger(VisitorDao.class);
   SqlSessionFactory sqlSessionFactory = null;
   SqlSession sqlSession = null;
   
   public VisitorDao() {
      sqlSessionFactory = MyBatisCommonFactory.getSqlSessionFactory();
      sqlSession = sqlSessionFactory.openSession();
   }
   
   /********************
    * 
    * 
    * 
    *******************/
   public void visitApplyAdd(Map<String,Object> applyAdd) {
      logger.info("applyAdd : " + applyAdd);
      sqlSession.update("visitorApplyAdd", applyAdd);
      int result = (int)applyAdd.get("result");
      if(result==0) {   
         return;
      }
      else if(result==1) {
         sqlSession.commit();
      }
   }
   
   public int visitSubAdd(Map<String, Object> vtMap
                        , Map<String, Object> tkMap
                        , Map<String, Object> pkMap
                        ) 
   {
      int result = 0;
      
      int visitorNum = ((List<Map<String,Object>>)vtMap.get("vtAddList")).size();
      int deviceNum = ((List<Map<String,Object>>)tkMap.get("tkAddList")).size();
      int parkNum = ((List<Map<String,Object>>)pkMap.get("pkAddList")).size();
      int rowNum = 0;
      logger.info("visitorNum : " + visitorNum);
      logger.info("deviceNum : " + deviceNum);
      logger.info("parkNum : " + parkNum);
      
      rowNum = sqlSession.insert("visitorAdd", vtMap);
      if(visitorNum==rowNum) {
         result = 1;
         rowNum = sqlSession.insert("deviceAdd", tkMap);
         if(deviceNum==rowNum) {
            result = 1;
            rowNum = sqlSession.insert("parkingAdd", pkMap);
         }
         else {
            result = 0;
            return result;
         }
      }
      else {
         result = 0;
         return result;
      }
      if(result==1) {
         sqlSession.commit();
      }
      return result;
   }

   public int visitorUpdate(Map<String, Object> pMap) {
      int result = 0;
      result = sqlSession.update("visitorUpdate", pMap);
      return result;
   }

   public int visitorCancle(Map<String, Object> pMap) {
      int result = 0;
      sqlSession.update("visitorApplyCancle", pMap);
      result = (int)pMap.get("result");
      logger.info("result : " + (int)pMap.get("result"));
      sqlSession.commit();
      return result;
   }


   public List<Map<String, Object>> companyList() {
      List<Map<String, Object>> companyList = sqlSession.selectList("com.ch4.mybatis.mapper.CompanyMapper.companyCombo");
      return companyList;
   }
   public List<Map<String, Object>> deptList(Map<String, Object> pMap) {
      logger.info(pMap);
      List<Map<String, Object>> deptList = sqlSession.selectList("com.ch4.mybatis.mapper.CompanyMapper.deptCombo", pMap);
      return deptList;
   }

   public Map<String, Object> applySearch(Map<String, Object> pMap) {
      Map<String, Object> applySearch = sqlSession.selectOne("visitorApplySearch", pMap);
      return applySearch;
   }
   public List<Map<String, Object>> applyList(Map<String, Object> pMap) {
      List<Map<String, Object>> applyList = sqlSession.selectList("visitorApplySearch", pMap);
      return applyList;
   }

   public List<Map<String, Object>> preVisitList(Map<String, Object> pMap) {
      sqlSession.update("preVisitorSearch", pMap);
      logger.info("pMap : " + pMap);
      List<Map<String, Object>> preVisitList = (List<Map<String, Object>>)pMap.get("preList");
      return preVisitList;
   }

   public Map<String, Object> previsitDetail(Map<String, Object> pMap) {
      Map<String,Object> preDetailList = new HashMap<String, Object>();
      
      List<Map<String, Object>> visitorList = sqlSession.selectList("visitorSearch", pMap);
      List<Map<String, Object>> deviceList = sqlSession.selectList("deviceSearch", pMap);
      List<Map<String, Object>> parkingList = sqlSession.selectList("parkingSearch", pMap);
      
      preDetailList.put("vtList", visitorList);
      preDetailList.put("tkList", deviceList);
      preDetailList.put("pkList", parkingList);
      
      return preDetailList;
   }

   public Map<String, Object> applyDetail(Map<String, Object> pMap) {
      Map<String,Object> rMap = new HashMap<String, Object>();
      
      Map<String, Object> infoMap = sqlSession.selectOne("visitorApplySearch", pMap);
      List<Map<String, Object>> vtList = sqlSession.selectList("visitorSearch", pMap);
      List<Map<String, Object>> tkList = sqlSession.selectList("deviceSeaech", pMap);
      List<Map<String, Object>> pkList = sqlSession.selectList("parkingSearch", pMap);
      
      rMap.put("infoMap", infoMap);
      rMap.put("vtList", vtList);
      rMap.put("tkList", tkList);
      rMap.put("pkList", pkList);
      
      return rMap;
   }

   public List<Map<String, Object>> qrCodeList(Map<String, Object> pMap) {
      List<Map<String,Object>> qrCodeList = sqlSession.selectList("visitorQRcode",pMap);
      return qrCodeList;
   }


}