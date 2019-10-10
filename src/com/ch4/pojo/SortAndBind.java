package com.ch4.pojo;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class SortAndBind {
   
   public static Map<String,Object> visitApplySort(Map<String,Object> pMap){
      Map<String,Object> rMap = new HashMap<String, Object>();
      
      
      List<Map<String,Object>> vtAddList = new ArrayList<Map<String,Object>>();
      List<Map<String,Object>> tkAddList = new ArrayList<Map<String,Object>>();
      List<Map<String,Object>> pkAddList = new ArrayList<Map<String,Object>>();
      Map<String,Object> applyAdd = null;
      
      ////////////////// [방문자 list에 담기] //////////////////
      String[] vt_names = (String[])pMap.get("visitor_names");
      String[] vt_hps = (String[])pMap.get("visitor_hps");
      if(vt_names.length>0 || vt_names!=null) {
         for(int i=0;i<vt_names.length;i++) {
            Map<String,Object> addMap = new HashMap<String, Object>();
            addMap.put("visitor_names",vt_names[i]);
            addMap.put("visitor_hps",vt_hps[i]);
            vtAddList.add(addMap);
         }
         pMap.remove("visitor_names");
         pMap.remove("visitor_hps");
      }
      
        ///////////////// [반입기기 list에 담기] //////////////////
      String[] tk_models = (String[])pMap.get("tkin_models");
      String[] tk_brand = (String[])pMap.get("tkin_brands");
      String[] tk_kinds = (String[])pMap.get("tkin_kinds");
      if(tk_models.length>0 || tk_models!=null) {
         for(int i=0;i<tk_models.length;i++) {
            Map<String,Object> addMap = new HashMap<String, Object>();
            addMap.put("tkin_models",tk_models[i]);
            addMap.put("tkin_brands",tk_brand[i]);
            addMap.put("tkin_kinds",tk_kinds[i]);
            tkAddList.add(addMap);         
         }
         pMap.remove("tkin_models");
         pMap.remove("tkin_brands");
         pMap.remove("tkin_kinds");
      }
        ///////////////// [방문차량 list에 담기] //////////////////
      String[] pk_kinds = (String[])pMap.get("parking_kinds");
      String[] pk_models = (String[])pMap.get("parking_models");
      String[] pk_nums = (String[])pMap.get("parking_nums");
      if(pk_kinds.length>0||pk_kinds!=null) {
         for(int i=0;i<pk_kinds.length;i++) {
            Map<String,Object> addMap = new HashMap<String, Object>();
            addMap.put("parking_kinds",pk_kinds[i]);
            addMap.put("parking_models",pk_models[i]);
            addMap.put("parking_nums",pk_nums[i]);
            pkAddList.add(addMap);         
         }
         pMap.remove("parking_kinds");
         pMap.remove("parking_models");
         pMap.remove("parking_nums");
      }
      ///////////////// [배열 제외한 신청정보] ///////////////
      applyAdd = pMap;
      
      
      
      /////// 4개의 정보들 하나의 Map에 담기 
      rMap.put("vtAddList", vtAddList);
      rMap.put("tkAddList", tkAddList);
      rMap.put("pkAddList", pkAddList);
      rMap.put("applyAdd", applyAdd);
      
      return rMap;
   }

   public static Map<String, Object> goodsApplySort(Map<String, Object> pMap) {
      Map<String,Object> rMap = new HashMap<String, Object>();
      
      List<Map<String,Object>> gmAddList = new ArrayList<Map<String,Object>>();
      Map<String,Object> applyAdd = null;
      
      ///////////////// [반입물품 list에 담기] ///////////////
      String[] gm_names = (String[])pMap.get("gmng_names");
      String[] gm_types = (String[])pMap.get("gmng_types");
      String[] gm_quans = (String[])pMap.get("gmng_quans");
      if(gm_names.length>0||gm_names!=null) {
         for(int i=0;i<gm_names.length;i++) {
            Map<String,Object> addMap = new HashMap<String, Object>();
            addMap.put("gmng_names",gm_names[i]);
            addMap.put("gmng_types",gm_types[i]);
            addMap.put("gmng_quans",gm_quans[i]);
            gmAddList.add(addMap);         
         }      
         pMap.remove("gmng_names");
         pMap.remove("gmng_types");
         pMap.remove("gmng_quans");
      }
      ///////////////// [배열 제외한 신청정보] ///////////////
      applyAdd = pMap;
      
      rMap.put("gmAddList", gmAddList);
      rMap.put("applyAdd", applyAdd);
      
      return rMap;
   }

}