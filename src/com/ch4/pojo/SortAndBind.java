package com.ch4.pojo;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class SortAndBind {
	
	public static Map<String,Object> visitApplySort(Map<String,Object> pMap){
		Map<String,Object> rMap = new HashMap<String, Object>();
		
		
		List<Map<String,Object>> vtAddList = new ArrayList<Map<String,Object>>();
		List<Map<String,Object>> tnAddList = new ArrayList<Map<String,Object>>();
		List<Map<String,Object>> pkAddList = new ArrayList<Map<String,Object>>();
		Map<String,Object> applyAdd = null;
		
		////////////////// [방문자 list에 담기] //////////////////
		String[] vt_names = (String[])pMap.get("visitor_name");
		String[] vt_hps = (String[])pMap.get("visitor_hp");
		if(vt_names.length>0 || vt_names!=null) {
			for(int i=0;i<vt_names.length;i++) {
				Map<String,Object> addMap = new HashMap<String, Object>();
				addMap.put("visitor_name",vt_names[i]);
				addMap.put("visitor_hp",vt_hps[i]);
				vtAddList.add(addMap);
			}
			pMap.remove("visitor_name");
			pMap.remove("visitor_hp");
		}
		
        ///////////////// [반입기기 list에 담기] //////////////////
		String[] tn_models = (String[])pMap.get("tkin_model");
		String[] tn_brand = (String[])pMap.get("tkin_brand");
		String[] tn_kinds = (String[])pMap.get("tkin_kind");
		if(tn_models.length>0 || tn_models!=null) {
			for(int i=0;i<tn_models.length;i++) {
				Map<String,Object> addMap = new HashMap<String, Object>();
				addMap.put("tkin_model",tn_models[i]);
				addMap.put("tkin_brand",tn_brand[i]);
				addMap.put("tkin_kind",tn_kinds[i]);
				tnAddList.add(addMap);			
			}
			pMap.remove("tkin_model");
			pMap.remove("tkin_brand");
			pMap.remove("tkin_kind");
		}
        ///////////////// [방문차량 list에 담기] //////////////////
		String[] pk_kinds = (String[])pMap.get("parking_kind");
		String[] pk_models = (String[])pMap.get("parking_model");
		String[] pk_nums = (String[])pMap.get("parking_num");
		if(pk_kinds.length>0||pk_kinds!=null) {
			for(int i=0;i<pk_kinds.length;i++) {
				Map<String,Object> addMap = new HashMap<String, Object>();
				addMap.put("parking_kind",pk_kinds[i]);
				addMap.put("parking_model",pk_models[i]);
				addMap.put("parking_num",pk_nums[i]);
				pkAddList.add(addMap);			
			}
			pMap.remove("parking_kind");
			pMap.remove("parking_model");
			pMap.remove("parking_num");
		}
		///////////////// [배열 제외한 신청정보] ///////////////
		applyAdd = pMap;
		
		
		
		/////// 4개의 정보들 하나의 Map에 담기 
		rMap.put("vtAddList", vtAddList);
		rMap.put("tnAddList", tnAddList);
		rMap.put("pkAddList", pkAddList);
		rMap.put("applyAdd", applyAdd);
		
		return rMap;
	}

	public static Map<String, Object> goodsApplySort(Map<String, Object> pMap) {
		Map<String,Object> rMap = new HashMap<String, Object>();
		
		List<Map<String,Object>> gmAddList = new ArrayList<Map<String,Object>>();
		Map<String,Object> applyAdd = null;
		
		///////////////// [반입물품 list에 담기] ///////////////
		String[] gm_names = (String[])pMap.get("gmng_name");
		String[] gm_types = (String[])pMap.get("gmng_type");
		String[] gm_quans = (String[])pMap.get("gmng_quan");
		if(gm_names.length>0||gm_names!=null) {
			for(int i=0;i<gm_names.length;i++) {
				Map<String,Object> addMap = new HashMap<String, Object>();
				addMap.put("gmng_name",gm_names[i]);
				addMap.put("gmng_type",gm_types[i]);
				addMap.put("gmng_quan",gm_quans[i]);
				gmAddList.add(addMap);			
			}		
			pMap.remove("gmng_name");
			pMap.remove("gmng_type");
			pMap.remove("gmng_quan");
		}
		///////////////// [배열 제외한 신청정보] ///////////////
		applyAdd = pMap;
		
		rMap.put("gmAddList", gmAddList);
		rMap.put("applyAdd", applyAdd);
		
		return rMap;
	}

}
