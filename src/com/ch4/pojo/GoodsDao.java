package com.ch4.pojo;

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

	public int goodsAdd(Map<String, Object> pMap) {
		int result = 0;
		result = sqlSession.insert("goodsAdd", pMap);
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
