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
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.five.goodchoice.common.AES256;
import com.five.goodchoice.model.service.InterAdminService;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

@Controller
public class AdminController {
	
	@Autowired
	private InterAdminService service;
	
	@RequestMapping(value="/main/home.gc") // tiles test 입니다. public String
	public String main(HttpServletRequest request) {
	  
	  List<Map<String, String>> reviewList = service.getReviewList();
	  
	  request.setAttribute("reviewList", reviewList);
	  
	 return "main/home.tiles1"; // /WEB-INF/views/tiles1/{1}/{2}.jsp }
	}

	// 관리자 페이지 승인 부분
	@RequestMapping(value = "/acomm_approve.gc")
	public String acomm_approve(HttpServletRequest request) {

		String permission = request.getParameter("permission"); // 사용자가 선책한 승인여부
	
		Map<String, Object> paraMap = new HashMap<>();
		
		if (permission != null && !"".equals(permission)) {
			paraMap.put("permission", permission);

			request.setAttribute("permission", permission);
		}

		List<Map<String, String>> acommList = service.getAcommList(paraMap);

		request.setAttribute("acommList", acommList);
		
		return "admin/acomm_approve.tiles3";
	}

	// 숙소 등록 권한 업데이트 하기 
	@ResponseBody
	@RequestMapping(value="/updatePermissionAcomm.gc")
	public int updatePermissionAcomm(HttpServletRequest request) {

		
		String permission= request.getParameter("permission");
		String acom_no = request.getParameter("acom_no");
	
		Map<String, String> paraMap = new HashMap<>();
		 
		 paraMap.put("permission",permission);
		 paraMap.put("acom_no",acom_no);
		 
		 int n = service.updatePermissionAcomm(paraMap);
		
		 JSONObject jsonObj = new JSONObject();
		 jsonObj.put("n",n);

		 return n;		
	}
	
	
	// 관리자 모든 업주보기 + 권한 승인 기능
	@RequestMapping(value = "/showAllHost.gc")
	public String showAllHost(HttpServletRequest request) {

		
		String permission = request.getParameter("permission"); // 사용자가 선책한 승인여부
		System.out.println(permission);

		Map<String, Object> paraMap = new HashedMap<>();

		
		if (permission != null && !"".equals(permission)) {
			paraMap.put("permission", permission);

			request.setAttribute("permission", permission);
		}

		List<Map<String, String>> hostList = service.getHostList(paraMap);

		request.setAttribute("hostList", hostList);
		
		
		return "admin/showAllHost.tiles3";
	}
	
	// 호스트 권한 승인하기 
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
	
	
	//  ===  HOST 리스트 Exel파일로 다운받기  ====
	@RequestMapping(value="/excel/downloadExcelFile.gc")
	public String downloadExcelFile(HttpServletRequest request, Model model){ // model 을 저장소 역할

		String permission = request.getParameter("permission");
		
		Map<String, Object> paraMap = new HashedMap<>();
	
		if(permission != null && !"".equals(permission)) {
			paraMap.put("permission", permission);

		}
		
		List<Map<String,String>> hostList = service.getHostList(paraMap);
		
		// === 조회결과물인 getHostList를 가지고 엑셀 시트 생성하기 ===
		// 시트를 생성하고, 행, 셀 을 생성하고 내용을 넣어주면 된당 (apache poi를 설정 해줘야함)
		
		SXSSFWorkbook workbook = new SXSSFWorkbook();
		
		// 시트생성 
		SXSSFSheet sheet = workbook.createSheet("호스트 정보 리스트");
		
		
		sheet.setColumnWidth(0, 3000);
        sheet.setColumnWidth(1, 3000);
        sheet.setColumnWidth(2, 3000);
        sheet.setColumnWidth(3, 3000);

        // 행의 위치를 나타내는 변수 
        int rowLocation = 0;
		        
    	////////////////////////////////////////////////////////////////////////////////////////
		// CellStyle 정렬하기(Alignment)
		// CellStyle 객체를 생성하여 Alignment 세팅하는 메소드를 호출해서 인자값을 넣어준다.
		// 아래는 HorizontalAlignment(가로)와 VerticalAlignment(세로)를 모두 가운데 정렬 시켰다.
		CellStyle mergeRowStyle = workbook.createCellStyle();
		mergeRowStyle.setAlignment(HorizontalAlignment.CENTER);
		mergeRowStyle.setVerticalAlignment(VerticalAlignment.CENTER);
		// import org.apache.poi.ss.usermodel.VerticalAlignment 으로 해야함.
		
		CellStyle headerStyle = workbook.createCellStyle();
		headerStyle.setAlignment(HorizontalAlignment.CENTER);
		headerStyle.setVerticalAlignment(VerticalAlignment.CENTER);
		
		
		// CellStyle 배경색(ForegroundColor)만들기
		// setFillForegroundColor 메소드에 IndexedColors Enum인자를 사용한다.
		// setFillPattern은 해당 색을 어떤 패턴으로 입힐지를 정한다.
		mergeRowStyle.setFillForegroundColor(IndexedColors.LAVENDER.getIndex());  // IndexedColors.DARK_BLUE.getIndex() 는 색상(남색)의 인덱스값을 리턴시켜준다. 
		mergeRowStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
		
		headerStyle.setFillForegroundColor(IndexedColors.CORAL.getIndex()); // IndexedColors.LIGHT_YELLOW.getIndex() 는 연한노랑의 인덱스값을 리턴시켜준다. 
		headerStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
	
		
		// Cell 폰트(Font) 설정하기
		// 폰트 적용을 위해 POI 라이브러리의 Font 객체를 생성해준다.
		// 해당 객체의 세터를 사용해 폰트를 설정해준다. 대표적으로 글씨체, 크기, 색상, 굵기만 설정한다.
		// 이후 CellStyle의 setFont 메소드를 사용해 인자로 폰트를 넣어준다.
		Font mergeRowFont = workbook.createFont(); // import org.apache.poi.ss.usermodel.Font; 으로 한다.
		mergeRowFont.setFontName("나눔고딕");
		mergeRowFont.setFontHeight((short)500);
		mergeRowFont.setColor(IndexedColors.WHITE.getIndex());
		mergeRowFont.setBold(true);
		
		mergeRowStyle.setFont(mergeRowFont);
		
		
		// CellStyle 테두리 Border
		// 테두리는 각 셀마다 상하좌우 모두 설정해준다.
		// setBorderTop, Bottom, Left, Right 메소드와 인자로 POI라이브러리의 BorderStyle 인자를 넣어서 적용한다.
		headerStyle.setBorderTop(BorderStyle.THICK);
		headerStyle.setBorderBottom(BorderStyle.THICK);
		headerStyle.setBorderLeft(BorderStyle.THIN);
		headerStyle.setBorderRight(BorderStyle.THIN);
		
		
		// Cell Merge 셀 병합시키기
		/* 셀병합은 시트의 addMergeRegion 메소드에 CellRangeAddress 객체를 인자로 하여 병합시킨다.
		CellRangeAddress 생성자의 인자로(시작 행, 끝 행, 시작 열, 끝 열) 순서대로 넣어서 병합시킬 범위를 정한다. 배열처럼 시작은 0부터이다.  
		*/
		// 병합할 행 만들기
		Row mergeRow = sheet.createRow(rowLocation); // 엑셀에서 행의 시작은 0부터 시작한다.
		
		// 병합할 행에 "우리회사 사원정보" 로 셀을 만들어 셀에 스타일 주기
		for(int i=0; i<4; i++) {
			Cell cell = mergeRow.createCell(i);
			cell.setCellStyle(mergeRowStyle); // 메인타이틀을 의미하는 코드
			cell.setCellValue("호스트 리스트");
		} // end of for()---------------------------------
		
		// 셀 병합하기
		sheet.addMergedRegion(new CellRangeAddress(rowLocation, rowLocation, 0, 3)); // 시작 행, 끝 행, 시작 열, 끝 열
		///////////////////////////////////////=== 여기까지 제목 만들기 ===/////////////////////////////////////////////
		
		// 헤더 행 생성
		Row headerRow = sheet.createRow(++rowLocation); // 엑셀에서 행의 시작은 0 부터 시작한다.
										// ++rowLocation 는 전위연산자임
					
		// 해당 행의 첫번째 열 셀 생성
        Cell headerCell = headerRow.createCell(0); // 엑셀에서 열의 시작은 0 부터 시작한다.
        headerCell.setCellValue("호스트 이름");
        headerCell.setCellStyle(headerStyle);
        
        // 해당 행의 두번째 열 셀 생성
        headerCell = headerRow.createCell(1);
        headerCell.setCellValue("가입일자");
        headerCell.setCellStyle(headerStyle);
        
        // 해당 행의 세번째 열 셀 생성
        headerCell = headerRow.createCell(2);
        headerCell.setCellValue("사업자 등록 번호");
        headerCell.setCellStyle(headerStyle);
        
        // 해당 행의 네번째 열 셀 생성
        headerCell = headerRow.createCell(3);
        headerCell.setCellValue("권한	");
        headerCell.setCellStyle(headerStyle);
        
       
        // === HR사원정보 내용에 해당하는 행 및 셀 생성하기 === //
        Row bodyRow = null;
        Cell bodyCell = null;
        
        for(int i=0; i<hostList.size(); i++) {
           
           Map<String, String> empMap = hostList.get(i);
           
           // 행생성
           bodyRow = sheet.createRow(i + (rowLocation+1));
           
           // 데이터 부서번호 표시
           bodyCell = bodyRow.createCell(0);
           bodyCell.setCellValue(empMap.get("host_name")); 
           
           // 데이터 부서명 표시
           bodyCell = bodyRow.createCell(1);
           bodyCell.setCellValue(empMap.get("HOST_REG_DATE")); 
                      
           // 데이터 사원번호 표시
           bodyCell = bodyRow.createCell(2);
           bodyCell.setCellValue(empMap.get("cp_reg_no")); 
           
           // 데이터 사원명 표시
           bodyCell = bodyRow.createCell(3);
           bodyCell.setCellValue(empMap.get("IS_HOST_PERMISSION")); 
        
           
        }// end of for------------------------------
        
        model.addAttribute("locale", Locale.KOREA);
        model.addAttribute("workbook", workbook);
        model.addAttribute("workbookName", "호스트 리스트");
        
        return "excelDownloadView";
        //   "excelDownloadView" 은 
        //  /webapp/WEB-INF/spring/appServlet/servlet-context.xml 파일에서
        //  기술된 bean 의 id 값이다.   
        		
	}
	

	
	
	
	
	// 관리자 모든 숙소 보기 + sorting 
	@RequestMapping(value = "/showAllAcomm.gc")
	public String showAllAcomm(HttpServletRequest request) {

		List<String> categoryList = service.categoryNameList(); // 카테고리 리스트
		List<String> districtList = service.districtNameList(); // 지역리스트

		String str_categoryName = request.getParameter("str_categoryName"); // 사용자 선택한 카테고리
		String str_districtName = request.getParameter("str_districtName"); // 사용자 선택한 카테고리
	
		Map<String, Object> paraMap = new HashedMap<>();

		if (str_categoryName != null && !"".equals(str_categoryName)) {
			String[] arr_categoryName = str_categoryName.split("\\,");
			paraMap.put("arr_categoryName", arr_categoryName);

			request.setAttribute("str_categoryName", str_categoryName);
		}
		if (str_districtName != null && !"".equals(str_districtName)) {
			String[] arr_districtName = str_districtName.split("\\,");
			paraMap.put("arr_districtName", arr_districtName);

			request.setAttribute("str_districtName", str_districtName);
		}
		

		List<Map<String, String>> acommList = service.getAcommList(paraMap);

		request.setAttribute("categoryList", categoryList);
		request.setAttribute("districtList", districtList);
		request.setAttribute("acommList", acommList);

		return "admin/showAllAcomm.tiles3";
	}
	
//  ===  HOST 리스트 Exel파일로 다운받기  ====
	@RequestMapping(value="/excel/downloadExcelFile_acomm.gc")
	public String downloadExcelFile_acomm(HttpServletRequest request, Model model){ // model 을 저장소 역할

		List<String> categoryList = service.categoryNameList(); // 카테고리 리스트
		List<String> districtList = service.districtNameList(); // 지역리스트

		String str_categoryName = request.getParameter("str_categoryName"); // 사용자 선택한 카테고리
		String str_districtName = request.getParameter("str_districtName"); // 사용자 선택한 카테고리
	
		Map<String, Object> paraMap = new HashedMap<>();

		// 특정 분류가 있을 경우
		if (str_categoryName != null && !"".equals(str_categoryName)) {
			String[] arr_categoryName = str_categoryName.split("\\,");
			paraMap.put("arr_categoryName", arr_categoryName);

			request.setAttribute("str_categoryName", str_categoryName);
		}
		if (str_districtName != null && !"".equals(str_districtName)) {
			String[] arr_districtName = str_districtName.split("\\,");
			paraMap.put("arr_districtName", arr_districtName);

			request.setAttribute("str_districtName", str_districtName);
		}
		

		List<Map<String, String>> acommList = service.getAcommList(paraMap);
		
		// === 조회결과물인 getHostList를 가지고 엑셀 시트 생성하기 ===
		// 시트를 생성하고, 행, 셀 을 생성하고 내용을 넣어주면 된당 (apache poi를 설정 해줘야함)
		
		SXSSFWorkbook workbook = new SXSSFWorkbook();
		
		// 시트생성 
		SXSSFSheet sheet = workbook.createSheet("숙소 분류 별 리스트");
		
		
		sheet.setColumnWidth(0, 4000);
        sheet.setColumnWidth(1, 4000);
        sheet.setColumnWidth(2, 4000);
        sheet.setColumnWidth(3, 4000);
        sheet.setColumnWidth(4, 4000);

        // 행의 위치를 나타내는 변수 
        int rowLocation = 0;
		        
    	////////////////////////////////////////////////////////////////////////////////////////
		// CellStyle 정렬하기(Alignment)
		// CellStyle 객체를 생성하여 Alignment 세팅하는 메소드를 호출해서 인자값을 넣어준다.
		// 아래는 HorizontalAlignment(가로)와 VerticalAlignment(세로)를 모두 가운데 정렬 시켰다.
		CellStyle mergeRowStyle = workbook.createCellStyle();
		mergeRowStyle.setAlignment(HorizontalAlignment.CENTER);
		mergeRowStyle.setVerticalAlignment(VerticalAlignment.CENTER);
		// import org.apache.poi.ss.usermodel.VerticalAlignment 으로 해야함.
		
		CellStyle headerStyle = workbook.createCellStyle();
		headerStyle.setAlignment(HorizontalAlignment.CENTER);
		headerStyle.setVerticalAlignment(VerticalAlignment.CENTER);
		
		
		// CellStyle 배경색(ForegroundColor)만들기
		// setFillForegroundColor 메소드에 IndexedColors Enum인자를 사용한다.
		// setFillPattern은 해당 색을 어떤 패턴으로 입힐지를 정한다.
		mergeRowStyle.setFillForegroundColor(IndexedColors.LAVENDER.getIndex());  // IndexedColors.DARK_BLUE.getIndex() 는 색상(남색)의 인덱스값을 리턴시켜준다. 
		mergeRowStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
		
		headerStyle.setFillForegroundColor(IndexedColors.CORAL.getIndex()); // IndexedColors.LIGHT_YELLOW.getIndex() 는 연한노랑의 인덱스값을 리턴시켜준다. 
		headerStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
	
		
		// Cell 폰트(Font) 설정하기
		// 폰트 적용을 위해 POI 라이브러리의 Font 객체를 생성해준다.
		// 해당 객체의 세터를 사용해 폰트를 설정해준다. 대표적으로 글씨체, 크기, 색상, 굵기만 설정한다.
		// 이후 CellStyle의 setFont 메소드를 사용해 인자로 폰트를 넣어준다.
		Font mergeRowFont = workbook.createFont(); // import org.apache.poi.ss.usermodel.Font; 으로 한다.
		mergeRowFont.setFontName("나눔고딕");
		mergeRowFont.setFontHeight((short)500);
		mergeRowFont.setColor(IndexedColors.WHITE.getIndex());
		mergeRowFont.setBold(true);
		
		mergeRowStyle.setFont(mergeRowFont);
		
		
		// CellStyle 테두리 Border
		// 테두리는 각 셀마다 상하좌우 모두 설정해준다.
		// setBorderTop, Bottom, Left, Right 메소드와 인자로 POI라이브러리의 BorderStyle 인자를 넣어서 적용한다.
		headerStyle.setBorderTop(BorderStyle.THICK);
		headerStyle.setBorderBottom(BorderStyle.THICK);
		headerStyle.setBorderLeft(BorderStyle.THIN);
		headerStyle.setBorderRight(BorderStyle.THIN);
		
		
		// Cell Merge 셀 병합시키기
		/* 셀병합은 시트의 addMergeRegion 메소드에 CellRangeAddress 객체를 인자로 하여 병합시킨다.
		CellRangeAddress 생성자의 인자로(시작 행, 끝 행, 시작 열, 끝 열) 순서대로 넣어서 병합시킬 범위를 정한다. 배열처럼 시작은 0부터이다.  
		*/
		// 병합할 행 만들기
		Row mergeRow = sheet.createRow(rowLocation); // 엑셀에서 행의 시작은 0부터 시작한다.
		
		// 병합할 행에 "우리회사 사원정보" 로 셀을 만들어 셀에 스타일 주기
		for(int i=0; i<5; i++) {
			Cell cell = mergeRow.createCell(i);
			cell.setCellStyle(mergeRowStyle); // 메인타이틀을 의미하는 코드
			cell.setCellValue("숙소 리스트");
		} // end of for()---------------------------------
		
		// 셀 병합하기
		sheet.addMergedRegion(new CellRangeAddress(rowLocation, rowLocation, 0, 4)); // 시작 행, 끝 행, 시작 열, 끝 열
		///////////////////////////////////////=== 여기까지 제목 만들기 ===/////////////////////////////////////////////
		
		// 헤더 행 생성
		Row headerRow = sheet.createRow(++rowLocation); // 엑셀에서 행의 시작은 0 부터 시작한다.
										// ++rowLocation 는 전위연산자임
					
		// 해당 행의 첫번째 열 셀 생성
        Cell headerCell = headerRow.createCell(0); // 엑셀에서 열의 시작은 0 부터 시작한다.
        headerCell.setCellValue("카테고리");
        headerCell.setCellStyle(headerStyle);
        
        // 해당 행의 두번째 열 셀 생성
        headerCell = headerRow.createCell(1);
        headerCell.setCellValue("분류");
        headerCell.setCellStyle(headerStyle);
        
        // 해당 행의 세번째 열 셀 생성
        headerCell = headerRow.createCell(2);
        headerCell.setCellValue("숙소이름");
        headerCell.setCellStyle(headerStyle);
        
        // 해당 행의 네번째 열 셀 생성
        headerCell = headerRow.createCell(3);
        headerCell.setCellValue("호스트이름");
        headerCell.setCellStyle(headerStyle);
        
        // 해당 행의 네번째 열 셀 생성
        headerCell = headerRow.createCell(4);
        headerCell.setCellValue("지역");
        headerCell.setCellStyle(headerStyle);
        
       
        // === HR사원정보 내용에 해당하는 행 및 셀 생성하기 === //
        Row bodyRow = null;
        Cell bodyCell = null;
        
        for(int i=0; i<acommList.size(); i++) {
           
           Map<String, String> acommMap = acommList.get(i);
           
           // 행생성
           bodyRow = sheet.createRow(i + (rowLocation+1));
           
           // 카테고리 이름 표시
           bodyCell = bodyRow.createCell(0);
           bodyCell.setCellValue(acommMap.get("CATEGORY_NAME")); 
           
           // 분류 이름 표시
           bodyCell = bodyRow.createCell(1);
           bodyCell.setCellValue(acommMap.get("SPEC_NAME")); 
                      
           // 숙소 이름 표시
           bodyCell = bodyRow.createCell(2);
           bodyCell.setCellValue(acommMap.get("ACOM_NAME")); 
           
           // 호스트 이름  표시
           bodyCell = bodyRow.createCell(3);
           bodyCell.setCellValue(acommMap.get("HOST_NAME"));
           
           // 지역 이름 표시
           bodyCell = bodyRow.createCell(4);
           bodyCell.setCellValue(acommMap.get("district_name")); 
        
           
        }// end of for------------------------------
        
        model.addAttribute("locale", Locale.KOREA);
        model.addAttribute("workbook", workbook);
        model.addAttribute("workbookName", "호스트 리스트");
        
        return "excelDownloadView";
        //   "excelDownloadView" 은 
        //  /webapp/WEB-INF/spring/appServlet/servlet-context.xml 파일에서
        //  기술된 bean 의 id 값이다.   
        		
	}
	
	// 관리자 페이지 승인 부분
	@RequestMapping(value = "/viewChart.gc")
	public String viewChart(HttpServletRequest request) {

		return "admin/viewChart.tiles3";
	}

	// 스펙별 숙소의 개수 파이차트
	@ResponseBody
	@RequestMapping(value = "/totalAcommByspec.gc")
	public String totalAcommByspec(HttpServletRequest request) {

		List<Map<String,String>> acomListBySpec = service.totalAcommByspec();
		
		JsonArray jsonArr = new JsonArray();
		
		if(acomListBySpec != null && acomListBySpec.size() > 0) {
			for(Map<String, String> map:acomListBySpec ) {
				JsonObject jsonObj = new JsonObject(); // 구글이 만든 json
				jsonObj.addProperty("spec", map.get("spec"));
				jsonObj.addProperty("cnt", map.get("cnt"));
				jsonObj.addProperty("percentage", map.get("percentage"));
				
				jsonArr.add(jsonObj);
			}// end of for 
		}//end of if
		
		return new Gson().toJson(jsonArr);
	}
	
	// 지역별 숙소 갯수
	@ResponseBody
	@RequestMapping(value = "/acommCntByDistrict.gc")
	public String acommCntByDistrict(HttpServletRequest request) {

		List<Map<String,String>> acomListByDistrict = service.acommCntByDistrict();
		
		JsonArray jsonArr = new JsonArray();
		
		if(acomListByDistrict != null && acomListByDistrict.size() > 0) {
			for(Map<String, String> map:acomListByDistrict ) {
				JsonObject jsonObj = new JsonObject(); // 구글이 만든 json
				jsonObj.addProperty("district", map.get("district"));
				jsonObj.addProperty("cnt", map.get("cnt"));
				jsonObj.addProperty("percentage", map.get("percentage"));
				
				jsonArr.add(jsonObj);
			}// end of for 
		}//end of if
		
		return new Gson().toJson(jsonArr);
	}

	
	 
	// 지역별  도시별 숙소 통계 
	@ResponseBody
	@RequestMapping(value="/acommTotalByCity.gc",produces="text/plain;charset=UTF-8" )
	public String acommTotalByCity(HttpServletRequest request) {
		
		String district = request.getParameter("district");
		
		JsonArray jsonArr = new JsonArray();
		List<Map<String, String>> acommListByCity = service.acommCntByCity(district);
		
		if(acommListByCity != null && acommListByCity.size() > 0) {
			for( Map<String, String> map: acommListByCity) {
				JsonObject jsonobj = new JsonObject();
				jsonobj.addProperty("city", map.get("city"));
				jsonobj.addProperty("cnt", map.get("cnt"));
				jsonobj.addProperty("percentage", map.get("percentage"));
				
				jsonArr.add(jsonobj);
			}
		}
		return new Gson().toJson(jsonArr);
	}
	
	
	

}
