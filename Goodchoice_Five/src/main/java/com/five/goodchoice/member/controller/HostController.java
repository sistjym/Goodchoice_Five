package com.five.goodchoice.member.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.tiles.autotag.core.runtime.annotation.Parameter;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.five.goodchoice.common.FileManager;
import com.five.goodchoice.common.Sha256;
import com.five.goodchoice.detail.model.AcomodationVO;
import com.five.goodchoice.member.model.HostVO;
import com.five.goodchoice.member.model.MemberVO;
import com.five.goodchoice.member.service.InterHostService;

@Controller
public class HostController {

	@Autowired  //  TYPE 에 따라서 , SPRING 에서 알아서 BEAN 을 주입 해준다.
	private InterHostService service ;
	
	 @Autowired     // Type에 따라 알아서 Bean 을 주입해준다.
	 private FileManager fileManager;
	
	// 사업자등록 중복 유무 검사
	@ResponseBody
	@RequestMapping(value="/checkDuplicateBusinessNum.gc", method = {RequestMethod.POST}) 
	public String checkDuplicateBusinessNum(HttpServletRequest request){
		
		
		String business_id = request.getParameter("business_id");
		boolean isExists = service.checkDuplicateBusinessNum(business_id);
		
		JSONObject jsonObj = new JSONObject();
		jsonObj.put("isExists", isExists);
		
			
		return jsonObj.toString();

	}
	
	// 업주회원가입 
	@RequestMapping(value="/gohostRegister.gc", method = {RequestMethod.POST}) 
	public ModelAndView gohostRegister(ModelAndView mav, HttpServletRequest request){
		
		String email = request.getParameter("email");
		String pwd = request.getParameter("pwd");
		String business_id = request.getParameter("business_id");
		String onerName = request.getParameter("onerName");
		String companyName = request.getParameter("companyName");
		
		Map<String, String> paraMap = new HashMap<>();
		paraMap.put("email", email);
		paraMap.put("pwd", Sha256.encrypt(pwd));
		paraMap.put("business_id", business_id);
		paraMap.put("onerName", onerName);
		paraMap.put("companyName", companyName);
		
		String message ="";
		String loc = "";
		
		if(service.gohostRegister(paraMap)) {
			 message = "호스트로 회원가입에 성공 했습니다.";
			 loc = request.getContextPath() + "/memberLogin.gc";
		}
		
		else {
			message = "회원가입에 실패 했습니다.";
			loc = "javascript:history.back()";
		}
		
		mav.addObject("message", message);
		mav.addObject("loc", loc);
		
		mav.setViewName("msg");
		
		
		return mav;
	}
	
	
	// 업소 등록
	@RequestMapping(value="/hostRegister.gc") 
	public String hostRegister() {
		return "host/accommodations_register.tiles3";
	}
	
	
	// 업소 정보 수정
	@RequestMapping(value="/hostEdit.gc") 
	public String hostEdit() {
		return "host/accommodations_edit.tiles3";
	}
	
	// 업소 등록
	@RequestMapping(value="/insertAcomoAndRoom.gc", method = {RequestMethod.POST}) 
	public ModelAndView insertAcomoAndRoom(ModelAndView mav, MultipartHttpServletRequest mrequest) {
		
		String lat = mrequest.getParameter("lat");
		String lng = mrequest.getParameter("lng");
		
		MultipartFile RoomImagefile = mrequest.getFile("RoomImage");
		MultipartFile AcomoImagefile = mrequest.getFile("AcomoImage");
		
		String parkInfo = mrequest.getParameter("parkInfo");
		
		String companyName = mrequest.getParameter("companyName");
		
	    String postcode = mrequest.getParameter("postcode");
	    int firstIndex = postcode.indexOf(' ');
	    int secondIndex = postcode.indexOf(' ', firstIndex + 1);
	    
	    String address = postcode.substring(0, secondIndex);
	    String extra_address = postcode.substring(secondIndex+1);
	    
		
		String accommodationType = mrequest.getParameter("accommodationType");
		String accommodationSpec = mrequest.getParameter("accommodationSpec");
		
		String[] publicServices = mrequest.getParameterValues("publicService");
		
		
		String aroundInfo1 = mrequest.getParameter("aroundInfo1");
		String aroundInfo2 = mrequest.getParameter("aroundInfo2");
		String aroundInfo3 = mrequest.getParameter("aroundInfo3");
		
		String aroundInfo = "";
		if (aroundInfo1 != null && aroundInfo2 != null && aroundInfo3 != null) {
			  // 3개 모두 입력했을 경우
			  aroundInfo = aroundInfo1 + "/" + aroundInfo2 + "/" + aroundInfo3;
			} else if (aroundInfo1 != null && aroundInfo2 != null) {
			  // 2개만 입력했을 경우
			  aroundInfo = aroundInfo1 + "/" + aroundInfo2;
			} else if (aroundInfo1 != null && aroundInfo3 != null) {
			  // 2개만 입력했을 경우
			  aroundInfo = aroundInfo1 + "/" + aroundInfo3;
			} else if (aroundInfo2 != null && aroundInfo3 != null) {
			  // 2개만 입력했을 경우
			  aroundInfo = aroundInfo2 + "/" + aroundInfo3;
			}
			else if (aroundInfo1 != null) {
			  // 1개만 입력했을 경우 (aroundInfo1)
			  aroundInfo = aroundInfo1;
			} else if (aroundInfo2 != null) {
			  // 1개만 입력했을 경우 (aroundInfo2)
			  aroundInfo = aroundInfo2;
			} else if (aroundInfo3 != null) {
			  // 1개만 입력했을 경우 (aroundInfo3)
			  aroundInfo = aroundInfo3;
			}
			else {
			  // 1개도 입력하지 않았을 경우
			  aroundInfo = null;
			}
		
		
		if(publicServices != null) {
			for (String value : publicServices) {
			//	service.insertCategoryFacility(value);
		    }		
		}
		
		List<MultipartFile> fileList_1 = mrequest.getFiles("file_arr1");
		List<MultipartFile> fileList_2 = mrequest.getFiles("file_arr2");
		Map<String, String> paraMap = new HashMap<>();
		if (accommodationType != null && accommodationSpec != null) {
			paraMap.put("accommodationSpec", accommodationSpec);
		}
		
		int district_no = service.getDistrictno(postcode);	// 지역구 번호
		if(district_no > 0) {
			paraMap.put("district_no", String.valueOf(district_no));
		}
		
		HttpSession session = mrequest.getSession();
		
		HostVO loginuser = (HostVO)session.getAttribute("loginuser");
		
		String host_no = null;
		if(loginuser != null) {
			host_no = String.valueOf(loginuser.getHost_no());
			// login_userid 는 로그인 되어진 사용자의 userid 이다.
		}
		
		if(!AcomoImagefile.isEmpty()) {
			session = mrequest.getSession();
	        String root = session.getServletContext().getRealPath("/");
	        String path = root+"resources"+File.separator+"files";
	        
	        /*
	         2. 파일첨부를 위한 변수의 설정 및 값을 초기화 한 후 파일 올리기 
	      */
	         String newFileName = "";
	         // WAS(톰캣)의 디스크에 저장될 파일명 
	         
	         byte[] bytes = null;
	         // 첨부파일의 내용물을 담는 것 
	         
	         long fileSize = 0;
	         // 첨부파일의 크기 
	         
	         try {
	            bytes = AcomoImagefile.getBytes();
	            // 첨부파일의 내용물을 읽어오는 것
	            
	            String originalFilename = AcomoImagefile.getOriginalFilename();
	        
	            newFileName = fileManager.doFileUpload(bytes, originalFilename, path);
	            // 첨부되어진 파일을 업로드 하도록 하는 것이다
	            
	            paraMap.put("AcomoImagefile", originalFilename);
	          
	            
	         } catch (Exception e) {
	            e.printStackTrace();
	         }
	      }
	    System.out.println("aroundInfo : " + aroundInfo);
	    System.out.println("parkInfo : " + parkInfo);
		System.out.println("AcomoImagefile : " + paraMap.get("AcomoImagefile"));
		System.out.println("host_no : " + host_no);
		System.out.println("companyName : " + companyName);
		paraMap.put("host_no", host_no);
		paraMap.put("companyName", companyName);
		paraMap.put("lat", lat);
		paraMap.put("lng", lng);
		paraMap.put("address", address);
		paraMap.put("extra_address", extra_address);
		paraMap.put("aroundInfo", aroundInfo);
		paraMap.put("parkInfo", parkInfo);
		
		int n = service.acomoRegister(paraMap);
		
		System.out.println("n : " +n);
		
	    String root = session.getServletContext().getRealPath("/");
	    String path = root + "resources"+File.separator+"email_attach_file";
	    
	    File dir = new File(path);
	     if(!dir.exists()) {	// 폴더가 존재하지 않으면 폴더를 만들어라
	    	 dir.mkdirs();
	     }
	     
	     // >>> 첨부파일의 위의 path 경로에 올리기 <<< //
	     String[] arr_attachFilename = null;	// 첨부된 파일name만 담는곳
	     
	     if(fileList_1 != null && fileList_1.size() >0) {
	    	 
	    	 arr_attachFilename = new String[fileList_1.size()];
	    	 
	    	 for(int i=0; i<fileList_1.size(); i++) {
	    		 MultipartFile mtfile = fileList_1.get(i);
	    		 // System.out.println("파일명 : " + mtfile.getOriginalFilename() + " / 파일크기 : " + mtfile.getSize());
	    		 /*
					파일명 : 결제관련IAMPORT사용방법 .zip / 파일크기 : 1202177
					파일명 : berkelekle단가라포인트03.jpg / 파일크기 : 57641
					파일명 : Electrolux냉장고_사용설명서.pdf / 파일크기 : 791567
	    		  */
	    		 
	    		 
	    		 	try {
	    		 		//  == MultipartFile을 File 로 변환하여 탐색기 저장폴더에 저장하기 시작 == //
		    		 	  File attachFile = new File(path+File.separator+mtfile.getOriginalFilename());
		    		 	  mtfile.transferTo(attachFile);
		    		 	//  == MultipartFile을 File 로 변환하여 탐색기 저장폴더에 저장하기 끝 == //	 	
		    		 	  
		    		 	  arr_attachFilename[i] = mtfile.getOriginalFilename();
		    		 	
	    		 	} catch (Exception e) {
	    		 		e.printStackTrace();
	    		 	}
	    		 
	    	 }// end of for --------------------------------------------
		
		
	    	/* Map<String, Object> paraMap = new HashMap<>();
	    	 paraMap.put(key, value);*/
	    	 
	     }	 
		
		
		return mav;
	}
	
	
	
}
