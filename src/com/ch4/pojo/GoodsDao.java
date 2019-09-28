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

	public String goodsApplyAdd(Map<String, Object> applyAdd) {
		String aplg_no = null;
		
		aplg_no = "GC" + RuleOfGeneratingPK.getPK(100);
		
		int result = 0;
		applyAdd.put("aplg_no", aplg_no);
		result = sqlSession.insert("goodsApplyAdd", applyAdd);
		
		if(result==0) {
			return null;
		}
		else if(result==1) {			
			sqlSession.commit();
		}
		return aplg_no;
	}
	
	public int goodsSubAdd(List<Map<String,Object>> gmAddList, String aplg_no) {
		int result = 0;
		for(int i=0;i<gmAddList.size();i++) {
			Map<String, Object> addMap = gmAddList.get(i);
			addMap.put("aplg_no", aplg_no);
			result = sqlSession.insert("goodsSubAdd", addMap);
			if(result==0) {
				return result;
			}
		}
		sqlSession.commit();
		return result;
	}

	public int goodsUpdate(Map<String, Object> pMap) {
		int result = 0;
		result = sqlSession.update("goodsUpdate", pMap);
		sqlSession.commit();
		return result;
	}

	public int goodsCancle(Map<String, Object> pMap) {
		int result = 0;
		result = sqlSession.update("goodsCancle", pMap);
		sqlSession.commit();
		return result;
	}

	public List<Map<String, Object>> preGoodsList(Map<String, Object> pMap) {
		List<Map<String,Object>> preGoodsList = sqlSession.selectList("preGoodsList", pMap);
		for(int i=0;i<preGoodsList.size();i++) {
			Map<String,Object> indexMap = preGoodsList.get(i);
			List<Map<String, Object>> goodsDetail = sqlSession.selectList("goodsDetail", indexMap);
			indexMap.put("goodsDetail", goodsDetail);
		}
		return preGoodsList;
	}

	public List<Map<String, Object>> preGoodsDetail(Map<String, Object> pMap) {
		List<Map<String, Object>> preGoodsDetail = sqlSession.selectList("goodsDetail", pMap);
		return preGoodsDetail;
	}

	public Map<String, Object> goodsSearch(Map<String, Object> pMap) {
		Map<String,Object> goodsSearch = sqlSession.selectOne("goodsSearch", pMap);
		return goodsSearch;
	}

	public List<Map<String, Object>> goodsList(Map<String, Object> pMap) {
		List<Map<String, Object>> goodsList = sqlSession.selectList("goodsList", pMap);
		return goodsList;
	}

	public Map<String, Object> goodsDetail(Map<String, Object> pMap) {
		Map<String, Object> rMap = new HashMap<String, Object>();
		
		Map<String, Object> infoMap = sqlSession.selectOne("goodsInfoMap",pMap);
		List<Map<String,Object>> preGoodsList = sqlSession.selectList("preGoodsList", pMap);
		
		rMap.put("infoMap", infoMap);
		rMap.put("preGoodsList", preGoodsList);
		return rMap;
	}

	public List<Map<String, Object>> qrCodeList(Map<String, Object> pMap) {
		List<Map<String,Object>> qrCodeList = sqlSession.selectList("goodsQRcode",pMap);
		return qrCodeList;
	}

}
