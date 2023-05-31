package com.five.goodchoice.member.controller;

import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.collections4.map.HashedMap;
import org.apache.poi.hssf.usermodel.HSSFDataFormat;
import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.CellType;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.VerticalAlignment;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.xssf.streaming.SXSSFSheet;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.five.goodchoice.model.service.InterAdminService;



@Controller
public class AdminController {
	@Autowired
	private InterAdminService service;

    // 관리자 페이지 승인 부분
	@RequestMapping(value="/host_approve.gc") 
	public String host_approve() {	
		List<String> hostList = service.HostList();
		return "admin/host_approve.tiles3";
	}
	
	// 관리자 모든 숙소 보기 + 검색 기능 
	@RequestMapping(value="/showAllAcomm.gc") 
	public String showAllAcomm(HttpServletRequest request) {
		
		List<String> categoryList = service.categoryNameList();
		//List<String> specList = service.specNameList();
		
		//System.out.println(categoryList);
		
		/*
		 * List<String> specList = service.specNameList(); //List<String> specList =
		 * service.specNameList(); request.setAttribute("specList", specList);
		 * //System.out.println(categoryList);
		 */		
		
		String str_categoryName = request.getParameter("category_name"); // 사용자 선택한 카테고리 
		String permission = request.getParameter("permission"); //사용자가 선책한 승인여부
		
		Map<String, Object> paraMap = new HashedMap<>();
		
		if(str_categoryName != null && !"".equals(str_categoryName)) {
			String[] arr_categoryName = str_categoryName.split("\\,");
			paraMap.put("arr_categoryName", arr_categoryName);
			
			request.setAttribute("str_categoryName", str_categoryName);
		}
		if(permission != null && !"".equals(permission)) {
			paraMap.put("permission", permission);
			
			request.setAttribute("permission", permission);
		}

		List<Map<String,String>> acommList  = service.getAcommList(paraMap);
		
		request.setAttribute("categoryList", categoryList);
		request.setAttribute("acommList", acommList);

		return "admin/showAllAcomm.tiles3";
	}
	
	/*
	 * @SuppressWarnings("incomplete-switch") private static String
	 * cellReader(XSSFCell cell) { String value = ""; CellType ct =
	 * cell.getCellType(); if(ct != null) { switch(cell.getCellType()) { case
	 * FORMULA: value = cell.getCellFormula()+""; break; case NUMERIC: value =
	 * cell.getNumericCellValue()+""; break; case STRING: value =
	 * cell.getStringCellValue()+""; break; case BOOLEAN: value =
	 * cell.getBooleanCellValue()+""; break; case ERROR: value =
	 * cell.getErrorCellValue()+""; break; } } return value; }
	 */
	
	/*
	 * @RequestMapping(value="/excel/downloadExcelFile.gc") public String
	 * downloadExcelFile(HttpServletRequest request, Model model){ // model 을 저장소
	 * 역하ㅓㄹ
	 * 
	 * String str_categoryName = request.getParameter("category_name"); // 사용자 선택한
	 * 카테고리 String permission = request.getParameter("permission"); //사용자가 선책한 승인여부
	 * 
	 * Map<String, Object> paraMap = new HashedMap<>();
	 * 
	 * if(str_categoryName != null && !"".equals(str_categoryName)) { String[]
	 * arr_categoryName = str_categoryName.split("\\,");
	 * paraMap.put("arr_categoryName", arr_categoryName);
	 * 
	 * } if(permission != null && !"".equals(permission)) {
	 * paraMap.put("permission", permission);
	 * 
	 * }
	 * 
	 * List<Map<String,String>> acommList = service.getAcommList(paraMap);
	 * 
	 * // === 조회결과물인 empList를 가지고 엑셀 시트 생성하기 === // 시트를 생성하고, 행, 셀 을 생성하고 내용을 넣어주면
	 * 된당 (apache poi를 설정 해줘야함)
	 * 
	 * //SXSSFWorkbook workbook = new SXSSFWorkbook();
	 * 
	 * // 시트생성 //SXSSFSheet sheet = workbook.createSheet("숙소 정보");
	 * 
	 * 
	 * 
	 * 
	 * 
	 * }
	 */
	
	
	
	
	
	
	
	
	// 관리자 모든 회원 보기
	@RequestMapping(value="/showAllMember.gc") 
	public String showAllMember() {
		return "admin/showAllMember.tiles3";
	}
	
	
	
	
	
	
	
	
		
}
