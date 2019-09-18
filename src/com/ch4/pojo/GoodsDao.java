package com.ch4.pojo;

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
		return result;
	}

	public int goodsCancle(Map<String, Object> pMap) {
		int result = 0;
		result = sqlSession.update("goodsCancle", pMap);
		return result;
	}

}
