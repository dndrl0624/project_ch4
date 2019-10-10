package com.ch4.pojo;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.log4j.Logger;

import com.ch4.util.MyBatisCommonFactory;

public class CompanyDao {
   Logger logger = Logger.getLogger(CompanyDao.class);
   SqlSessionFactory sqlSessionFactory = null;
   SqlSession sqlSession = null;
   
   public CompanyDao() {
      sqlSessionFactory = MyBatisCommonFactory.getSqlSessionFactory();
      sqlSession = sqlSessionFactory.openSession();
   }

   //////////////////////////////////////////////////////////////////////////
   public int mngUpdateV(Map<String, Object> pMap) {
      int result = 0;
  
      sqlSession.update("vApplyPermit",pMap); 
      result = (int)pMap.get("result");
      logger.info("pMap : : " + pMap);
      
      if(result==1) {
         sqlSession.commit();
      }
      return result;
   }
   
   public int mngUpdateG(Map<String, Object> pMap) {
      int result = 0;
      sqlSession.update("gApplyPermit",pMap); 
       result = (int)pMap.get("result");
       if(result==1) {
          sqlSession.commit();
       }
      return result;
      
   }

   public int mngPermitV(Map<String,Object> pMap) {
      int result = 0;
      result = sqlSession.insert("vApplyConfirm",pMap);// VISIT_CONFM테이블에 insert
      if(result==0) {
         return result;
      }
      else if(result==1) {
         
      }
      sqlSession.commit();
      return result;
   }
   
   public int mngPermitG(Map<String,Object> pMap) {
      int result = 0;
      result = sqlSession.insert("gApplyConfirm",pMap);// GOODS_COMFM테이블에 insert
      if(result==0) {
         return result;
      }
      sqlSession.commit();
      return result;
   }
   
/////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////
   public List<Map<String, Object>> applyVisitList(Map<String, Object> pMap) {
      List<Map<String, Object>> applyVisitList = sqlSession.selectList("visitorApplySearch", pMap);
      return applyVisitList;
   }

   public List<Map<String, Object>> inOutList(Map<String, Object> pMap) {
      List<Map<String, Object>> inOutList = sqlSession.selectList("inOutList", pMap);
      return inOutList;
   }


   public int companyLogin(Map<String, Object> pMap) {
         int result = 0;
         logger.info(pMap);
         sqlSession.update("companyLogin", pMap);
         result = (int)pMap.get("result");
         return result;
      }

   public int companyJoin(Map<String, Object> pMap) {
      int result = 0;
      result = sqlSession.insert("companyJoin",pMap);
      sqlSession.commit();
      return result;
   }


   public int isExistID(Map<String, Object> pMap) {
      int result = 0;
      result = sqlSession.selectOne("isExistID", pMap);
      return result;
   }


   public List<Map<String, Object>> applyGoodsList(Map<String, Object> pMap) {
      List<Map<String, Object>> applyGoodsList = sqlSession.selectList("goodsApplySearch", pMap);
      return applyGoodsList;
   }

public List<Map<String, Object>> destiList(Map<String, Object> pMap) {
   List<Map<String, Object>> destiList = sqlSession.selectList("destiCombo",pMap);
   return destiList;
}



}