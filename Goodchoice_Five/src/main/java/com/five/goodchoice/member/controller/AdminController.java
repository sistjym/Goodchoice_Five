package com.five.goodchoice.member.controller;

import java.util.HashMap;
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
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.five.goodchoice.common.AES256;
import com.five.goodchoice.model.service.InterAdminService;

@Controller
public class AdminController {
	
	@Autowired
	private AES256 aes;
	
	@Autowired
	private InterAdminService service;

	// 관리자 페이지 승인 부분
	@RequestMapping(value = "/acomm_approve.gc")
	public String acomm_approve(HttpServletRequest request) {

		String permission = request.getParameter("permission"); // 사용자가 선책한 승인여부

		Map<String, Object> paraMap = new HashedMap<>();
		
		if (permission != null && !"".equals(permission)) {
			paraMap.put("permission", permission);

			request.setAttribute("permission", permission);
		}

		List<Map<String, String>> acommList = service.getAcommList(paraMap);

		request.setAttribute("acommList", acommList);
		
		return "admin/acomm_approve.tiles3";
	}

	// 관리자 모든 업주보기 + 권한 승인 기능
	@RequestMapping(value = "/showAllHost.gc")
	public String showAllHost(HttpServletRequest request) {
		
		String permission = request.getParameter("permission"); // 사용자가 선책한 승인여부

		Map<String, Object> paraMap = new HashedMap<>();

		
		if (permission != null && !"".equals(permission)) {
			paraMap.put("permission", permission);

			request.setAttribute("permission", permission);
		}

		List<Map<String, String>> hostList = service.getHostList(paraMap);

		request.setAttribute("hostList", hostList);
		
		
		return "admin/showAllHost.tiles3";
	}
	
	@ResponseBody
	@RequestMapping(value="/updatePermission.gc")
	public int updatePermission(HttpServletRequest request) {
		
		String permission= request.getParameter("permission");
		String host_no = request.getParameter("host_no");
		
		System.out.println(permission);
		System.out.println(host_no);
		
		
		Map<String, String> paraMap = new HashMap<>();
		 
		 paraMap.put("permission",permission);
		 paraMap.put("host_no",host_no);
		 
		 int n = service.updatePermission(paraMap);
		
		 JSONObject jsonObj = new JSONObject();
		 jsonObj.put("n",n);

		 return n;		
	}
	
	

	// 관리자 모든 숙소 보기 + sorting 
	@RequestMapping(value = "/showAllAcomm.gc")
	public String showAllAcomm(HttpServletRequest request) {

		List<String> categoryList = service.categoryNameList();

		String str_categoryName = request.getParameter("str_categoryName"); // 사용자 선택한 카테고리
		String permission = request.getParameter("permission"); // 사용자가 선책한 승인여부

		Map<String, Object> paraMap = new HashedMap<>();

		if (str_categoryName != null && !"".equals(str_categoryName)) {
			String[] arr_categoryName = str_categoryName.split("\\,");
			paraMap.put("arr_categoryName", arr_categoryName);

			request.setAttribute("str_categoryName", str_categoryName);
		}
		if (permission != null && !"".equals(permission)) {
			paraMap.put("permission", permission);

			request.setAttribute("permission", permission);
		}

		List<Map<String, String>> acommList = service.getAcommList(paraMap);

		request.setAttribute("categoryList", categoryList);
		request.setAttribute("acommList", acommList);

		return "admin/showAllAcomm.tiles3";
	}

}
