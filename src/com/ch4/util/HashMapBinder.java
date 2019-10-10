package com.ch4.util;
import java.io.File;
import java.io.InputStream;
import java.util.Enumeration;
/*
 * 사용자가 입력한 값을 읽을 때마다 반복되는  request.getParameter()를 대신해서 
 * 사용할 수 있는 bind메소드 추가하기
 * 리턴 타입은 void로 하지만 파라미터를 Map타입으로 하여 필요한 개발자가 Map을 생성하고
 * 그 주소번지를 받아서 여기에 값을 담는다.
 * 
 */
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.sun.media.jfxmedia.logging.Logger;

public class HashMapBinder {
	HttpServletRequest req = null;
	//첨부파일 추가
	MultipartRequest multi = null;
	String realFolder = "";
	//첨부파일 한글처리
	String encType = "utf-8";
	//첨부파일 크기
	int maxSize = 5*1024*1024;
	//req객체를 서블릿에서 받아와야 하니깐.....
	public HashMapBinder(HttpServletRequest req) {
		this.req = req;
		realFolder = "C:\\project_ch4\\project_ch4_pojo\\WebContent\\pds";
	}
	//첨부파일 처리시 사용할 메소드
	public void multiBind(Map<String,Object> pMap) {
		pMap.clear();
		try {
			multi = new MultipartRequest(req, realFolder, maxSize, encType, new DefaultFileRenamePolicy());
		} catch (Exception e) {
			e.printStackTrace();
		}
		Enumeration<String> en = multi.getParameterNames();
		while(en.hasMoreElements()) {
			String key = en.nextElement();
			pMap.put(key,multi.getParameter(key));
		}
		//첨부파일 정보 받아오기
		Enumeration<String> files = multi.getFileNames();
		if(files!=null) {
			//읽어온 파일이름을 객체로 만듦 - 파일크기를 계산할 때 메소드를 지원
			File file = null;
			while(files.hasMoreElements()) {
				String fname = files.nextElement();
				String fileName = multi.getFilesystemName(fname);
				pMap.put("bs_file",fileName);
				if(fileName!=null && fileName.length()>1) {
					file = new File(realFolder+"\\"+fileName);
					double size = 0.0;
					//첨부파일 크기 계산
					if(file!=null) {
						size = file.length();
						size = size/(1024.0);
						pMap.put("bs_size", size);
					}
				}
			}
		}
	}
	//get방식으로 요청시 사용할것
	/*******************************************************
	 * @param target Map<String,Object> 객체생성해서 넘길것.
	 * 주의 :NullPointerException 맞기 싫으면....
	 ********************************************************/
	public void bind(Map<String,Object> target) {
		//insert here
		//파라미터로 넘어온 target안에 다른 정보가 담겨 있다면 제거
		target.clear();
		Enumeration er = req.getParameterNames();
		while(er.hasMoreElements()) {
			String name = (String)er.nextElement();//name,address,pet
			if(
					////// visit ////////
					("visitor_names".equals(name))
					||("visitor_hps".equals(name))
					||("tkin_models".equals(name))
					||("tkin_brands".equals(name))
					||("tkin_kinds".equals(name))
					||("parking_kinds".equals(name))
					||("parking_models".equals(name))
					||("parking_nums".equals(name))
				    ////// goods ////////
					||("gmng_names".equals(name))
					||("gmng_types".equals(name))
					||("gmng_quans".equals(name))
				) 
			{
				String values[] = req.getParameterValues(name);
				if(values!=null) {
					target.put(name,values);
				}
			}
			//key에는 name, address, pet이 와야함
			//value에는 각 key가 가리키는 값이 오면 됨.				
			else {
				target.put(name
						 , req.getParameter(name));//Tomcat server.xml
			}
		}
	}
	//post방식으로 요청시 사용할 것. - 한글처리 인코딩 타입은  UTF-8 로 하였음.
	public void bindPost(Map<String,Object> target) {
		//insert here
		//파라미터로 넘어온 target안에 다른 정보가 담겨 있다면 제거
		target.clear();
		Enumeration er = req.getParameterNames();
		while(er.hasMoreElements()) {
			String name = (String)er.nextElement();//name,address,pet
				target.put(name
						, HangulConversion.toUTF(req.getParameter(name)));
		}
	}
}
