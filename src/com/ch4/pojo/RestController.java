package com.ch4.pojo;

import java.util.ArrayList;
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
		
		if ("company".equals(work)) {/////////start of company
			CompanyLogic cLogic = new CompanyLogic();
			if (requestName.equals("list")) {
				List<Map<String, Object>> applyList =  cLogic.applyList(pMap);
				jsonStr = g.toJson(applyList);
			} else if (requestName.equals("inOutList")) {
				List<Map<String, Object>> inOutList = cLogic.inOutList(pMap);
				jsonStr = g.toJson(inOutList);
			}
		} ////////////////////////////////////end of company
		else if ("visitor".equals(work)) {/////////start of visitor
			VisitorLogic vLogic = new VisitorLogic();
			if (requestName.equals("companyList")) {
				List<Map<String, Object>> companyList = vLogic.companyList();
				jsonStr = g.toJson(companyList);
			}
			else if (requestName.equals("deptList")) {
				List<Map<String, Object>> deptList = vLogic.deptList(pMap);
				jsonStr = g.toJson(deptList);
			}
			else if (requestName.equals("detail")) {
				if(pMap.get("searchType").equals("applyNo")) {
					Map<String, Object> applyDetail = vLogic.applyDetail(pMap);
					jsonStr = g.toJson(applyDetail);
				}
				else if(pMap.get("searchType").equals("applicantInfo")){
					List<Map<String, Object>> applyList = vLogic.applyList(pMap);
					jsonStr = g.toJson(applyList);
				}
			}
			else if (requestName.equals("preVisitList")) {
				List<Map<String,Object>> preVisitList = vLogic.preVisitList(pMap);
				jsonStr = g.toJson(preVisitList);
			}
			else if (requestName.equals("preVisitListDetail")) {
				Map<String,Object> preVisitDetail = vLogic.previsitDetail(pMap);
				jsonStr = g.toJson(preVisitDetail);
			}
		} //////////////////////////////////////////end of visitor
		else if ("goods".equals(work)) {/////////start of goods
			GoodsLogic gLogic = new GoodsLogic();
			if (requestName.equals("list")) {
				
			} 
			else if (requestName.equals("detail")) {

			}
			else if (requestName.equals("preGoodsList")) {
				List<Map<String,Object>> preGoodsList = gLogic.preGoodsList(pMap);
				jsonStr = g.toJson(preGoodsList);
			}
			else if (requestName.equals("preGoodsListDetail")) {
				List<Map<String, Object>> preGoodsDetail = gLogic.preGoodsDetail(pMap);
				jsonStr = g.toJson(preGoodsDetail);
			}
		} else if ("info".equals(work)) {
			InfoLogic iLogic = new InfoLogic();
			if (requestName.equals("list")) {

			} else if (requestName.equals("detail")) {

			}
		}////////////////////////////////////////end of goods

		return jsonStr;
	}
}
