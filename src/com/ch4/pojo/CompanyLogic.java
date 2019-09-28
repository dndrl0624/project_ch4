package com.ch4.pojo;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.imageio.ImageIO;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.WriterException;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.QRCodeWriter;

public class CompanyLogic {
	CompanyDao cDao = null;
	public CompanyLogic() {
		cDao = new CompanyDao();
	}

	public int mngPermit(Map<String, Object> pMap) {
		int result = 0;
		result = cDao.mngUpdate(pMap); // update
		/*
		 * 반려일경우, 
		 * if(){
		 * 
		 * }
		 * else if(){
		 * 
		 * }
		 * 승인일경우
		 */
		if(result==0) {
			return result;
		}
		else if(result==1) {
			result = cDao.mngPermit(pMap); // insert
		}
		if(result==1) {
			String qrCode = cDao.getQRcode(pMap);
			String savedFilePath = CompanyController.QRImagePath;
			String path = null;
			String url = null;
			
			if(pMap.get("visit_no")!=null) {
				path = savedFilePath + "visit/";
				url = "http://localhost:8080/Info/QRconfirm.ch4?confm_qrcode=" + qrCode;
			}
			else if(pMap.get("aplg_no")!=null) {
				path = savedFilePath + "goods/";
				url = "http://localhost:8080/Info/QRconfirm.ch4?confm_qrcode=" + qrCode;
			}
			File file = new File(path);
			QRCodeWriter writer = new QRCodeWriter();
		    try {
				BitMatrix qr = writer.encode(url, BarcodeFormat.QR_CODE, 200, 200);
				BufferedImage qrImage = MatrixToImageWriter.toBufferedImage(qr);
				ImageIO.write(qrImage, "PNG", new File(file,qrCode +".png"));
			} catch (WriterException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}  
		}
		else if(result==0) {
			return result;
		}
		return result;
	}
	
	public List<Map<String, Object>> applyVisitList(Map<String, Object> pMap) {
		List<Map<String, Object>> applyVisitList = cDao.applyVisitList(pMap);
		return applyVisitList;
	}

	public List<Map<String, Object>> inOutList(Map<String, Object> pMap) {
		List<Map<String, Object>> inOutList = cDao.inOutList(pMap);
		return inOutList;
	}

	public int companyLogin(Map<String, Object> pMap) {
		int result = 0;
		result = cDao.companyLogin(pMap);
		return result;
	}

	public int companyJoin(Map<String, Object> pMap) {
		int result = 0;
		result = cDao.companyJoin(pMap);
		return result;
	}

	public int isExistID(Map<String, Object> pMap) {
		int result = 0;
		result = cDao.isExistID(pMap);
		return result;
	}

	public List<Map<String, Object>> applyGoodsList(Map<String, Object> pMap) {
		List<Map<String, Object>> applyGoodsList = cDao.applyGoodsList(pMap);
		return applyGoodsList;
	}


}
