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

	public int goodsApplyAdd(Map<String, Object> applyAdd) {
		
		
		int result = 0;
		result = sqlSession.insert("goodsApplyAdd", applyAdd);
		
		if(result==0) {
			return result;
		}
		else if(result==1) {			
			sqlSession.commit();
		}
		return result;
	}
	
	public int goodsSubAdd(Map<String,Object> gmMap) {
		int result = 0;
		result = sqlSession.insert("goodsAdd", gmMap);
		if(result==0) {
			return result;
		}		
		sqlSession.commit();
		return result;
	}

	/*
	 * id="goodsApplyUpdate" id="goodsSubDelete" id="goodsAdd" ??
	 */
	public int goodsUpdate(Map<String, Object> pMap) {
		int result = 0;
		result = sqlSession.update("goodsApplyUpdate", pMap);
		if(result==0) {
			return result;
		}
		else if(result==1) {
			result = goodsSubAdd(pMap);
		}
		if(result==0) {
			return result;
		}
		sqlSession.commit();
		return result;
	}

	public int goodsCancle(Map<String, Object> pMap) {
		int result = 0;
		result = sqlSession.update("goodsApplyCancle", pMap);
		sqlSession.commit();
		return result;
	}

	public List<Map<String, Object>> preGoodsList(Map<String, Object> pMap) {
		List<Map<String,Object>> preGoodsList = sqlSession.selectList("goodsApplySearch", pMap);
		for(int i=0;i<preGoodsList.size();i++) {
			Map<String,Object> indexMap = preGoodsList.get(i);
			List<Map<String, Object>> goodsDetail = sqlSession.selectList("goodsSearch", indexMap);
			indexMap.put("goodsDetail", goodsDetail);
		}
		return preGoodsList;
	}

	public List<Map<String, Object>> preGoodsDetail(Map<String, Object> pMap) {
		List<Map<String, Object>> preGoodsDetail = sqlSession.selectList("goodsSearch", pMap);
		return preGoodsDetail;
	}

	public Map<String, Object> goodsSearch(Map<String, Object> pMap) {
		Map<String,Object> goodsSearch = sqlSession.selectOne("goodsApplySearch", pMap);
		return goodsSearch;
	}

	public List<Map<String, Object>> goodsList(Map<String, Object> pMap) {
		List<Map<String, Object>> goodsList = sqlSession.selectList("goodsApplySearch", pMap);
		return goodsList;
	}

	public Map<String, Object> goodsDetail(Map<String, Object> pMap) {
		Map<String, Object> rMap = new HashMap<String, Object>();
		
		Map<String, Object> infoMap = sqlSession.selectOne("goodsApplySearch",pMap);
		List<Map<String,Object>> gmList = sqlSession.selectList("goodsSearch", pMap);
		
		rMap.put("infoMap", infoMap);
		rMap.put("gmList", gmList);
		return rMap;
	}

	public List<Map<String, Object>> qrCodeList(Map<String, Object> pMap) {
		List<Map<String,Object>> qrCodeList = sqlSession.selectList("goodsQRcode",pMap);
		return qrCodeList;
	}

}
