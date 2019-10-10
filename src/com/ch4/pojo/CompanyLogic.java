package com.ch4.pojo;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.imageio.ImageIO;

import org.apache.log4j.Logger;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.WriterException;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.QRCodeWriter;


public class CompanyLogic {
	Logger logger = Logger.getLogger(CompanyLogic.class);
	CompanyDao cDao = null;
	public CompanyLogic() {
		cDao = new CompanyDao();
	}

	public int mngPermit(Map<String, Object> pMap) {
		int result = 0;
		 if(pMap.get("visit_no")!=null) {
			 result = cDao.mngUpdateV(pMap); // update
		 }
		 else if(pMap.get("aplg_no")!=null) {
			 result = cDao.mngUpdateG(pMap);    
		 }
		
		List<Map<String,Object>> confirmList = (List<Map<String,Object>>)pMap.get("confirmList");
		logger.info("와와아 : " + confirmList);
		for(int i=0;i<confirmList.size();i++) {
			logger.info(confirmList.get(i));
		}
		if(result==0) {
			return result;
		}
		else if(result==1) {
			if(pMap.get("visit_permit_st")!=null){// 방문일 경우
				cDao.mngPermitV(pMap);
				result = (int)pMap.get("result");
				if(result==0) {
					return result;
				}
			}
			else if(pMap.get("aplg_permit_id")!=null){// 반입일 경우
				cDao.mngPermitG(pMap);
				result = (int)pMap.get("result");
				if(result==0) {
					return result;
				}		
			}
		}
	
		///////////////////////////////////qr이미지 생성//////////////////////////////////
		for(int i=0; i<confirmList.size();i++) {
			Map<String,Object> cMap = confirmList.get(i);
			String qrCode = (String)cMap.get("CONFM_QRCODE");
			String savedFilePath = CompanyController.QRImagePath;
			String path = null;
			String url = null;
			
			if(pMap.get("visit_no")!=null) {
				path = savedFilePath + "visitor/";
				url = "http://localhost:8080/Info/QRconfirm.ch4?confm_qrcode=" + qrCode + "&type=visitor";
			}
			else if(pMap.get("aplg_no")!=null) {
				path = savedFilePath + "goods/";
				url = "http://localhost:8080/Info/QRconfirm.ch4?confm_qrcode=" + qrCode+ "&type=goods";
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
			///////////////////////////////////qr이미지 생성 끝//////////////////////////////////
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

	public List<Map<String, Object>> destiList(Map<String, Object> pMap) {
		List<Map<String, Object>> destiList = cDao.destiList(pMap);
		return destiList;
	}


}
