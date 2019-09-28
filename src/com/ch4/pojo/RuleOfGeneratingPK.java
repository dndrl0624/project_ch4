package com.ch4.pojo;

import java.text.SimpleDateFormat;
import java.util.Random;

public class RuleOfGeneratingPK {
	static SimpleDateFormat sdf = new SimpleDateFormat("yyyymmddssSSS");
	
	
	static public String getPK(int i) {
		String pk = null;
		if(i>=100) {
			Random rd = new Random();
			i = rd.nextInt(99)+1;
		}
		
		String a16 = Integer.toHexString(i);
		if(a16.length()<2) {
			a16 = "0"+ a16;
		}
		
		pk = sdf.format(System.currentTimeMillis()) + a16;
		
		return pk;
	}


}
