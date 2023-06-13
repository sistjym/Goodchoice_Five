<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
   String ctxPath = request.getContextPath();
%>   

<style type="text/css">
	th.th_info {
		width: 136px;
		background-color: #eaeaea;
	    text-align: center;
	    font-size: 1.2em;
	    font-weight: bold;
	    line-height: 1.57;
	    color: #000000;
	    min-height: 10px;
	    vertical-align: middle;
	}
	
	input.input_info {
		height: 50px;
	}
	
	button.btn_address {
		height:48px;
		border:none;
		background-color: #f2114c;
		color: #fff;
		font-weight: 500;
		border-radius: 4px;
		margin-left:10px;
		padding: 6px 12px;
	}
	
	button.btn_image {
		border-color: #ccc;
		padding: 6px 12px;
		font-size: 14px;
    	font-weight: 400px;
    	text-align: center;
    	vertical-align: middle;
   	    height: 48px;
   	    color: #fff;
   	    background-color: #0000008F;
   	    border-radius: 4px;
   	    
	}
	
	button.btn_image:hover {
		background-color: #eaeaea;
		color: #333;
	}
	
	input[type='checkbox']{
		
	}
	
	div#backgroundImg {
		background-image: url("<%= ctxPath%>/resources/images/주변정보.png");
		background-size: cover; /* 이미지를 컨테이너에 맞게 조정 */
     	background-position: center; /* 이미지를 가운데로 정렬 */
	}
	span#infoExample {
		width: 300px;
	    max-height: 260px;
	    float: left;
	    margin-top: 60px;
	    margin-left: 7px;
	    overflow-y: auto;
	    color: #888;
	    font-size: 14px;
	    line-height: 20px;
	}	
	
	textarea {
		min-height: 190px !important;
	}
	
	button.btn_save {
		width: 177px;
	    height: 48px;
	    font-size: 18px;
		background-color: #f2114c;
	    color: #fff;
	    font-weight: bold;	    
	    padding: 6px 13px;
	    border-radius: 4px;
	    border:solid 1px #f2114c;
		}
		
		
	/* 모달 스타일 */
    .modal {
      display: none;
      position: fixed;
      z-index: 1;
      left: 0;
      top: 0;
      width: 100%;
      height: 100%;
      overflow: auto;
      background-color: rgba(0, 0, 0, 0.5);
    }

    .modal-content {
      background-color: #f8f8f8;
      margin: 10% auto;
      padding: 20px;
      border-radius: 4px;
      width: 60%;
      box-shadow: 0 0 8px rgba(0, 0, 0, 0.3);
    }

    .modal-close {
      position: absolute;
      top: 10px;
      right: 10px;
      font-size: 24px;
      color: #555;
      cursor: pointer;
    }

    .file-info {
      margin-top: 20px;
      width: 45%;
    }

    /* 드롭 영역 스타일 */
    .drop-area {
      width: 300px;
      height: 200px;
      border: 2px dashed #ccc;
      text-align: center;
      margin: 20px auto;
      cursor: pointer;
      line-height: 200px;
      font-size: 20px;
      color: #aaa;
      transition: border-color 0.3s ease-in-out;
    }

    .drop-area:hover {
      border-color: #555;
      color: #555;
    }	
    
   span.delete, span.delete_1{display:inline-block; width: 20px; border: solid 1px gray; text-align: center;} 
   span.delete:hover, span.delete_1:hover{background-color: #000; color: #fff; cursor: pointer;}
   span.fileName, span.fileName_1{padding-left: 10px;}
   span.fileSize, span.fileSize_1{padding-right: 20px; float:right;} 
   span.clear, span.clear_1{clear: both;}
		
	
</style>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=aa9e3a8df8aa72d93190dd5dc4ebafb1&libraries=services"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
	
	$(document).ready(function(){
		setEventhandling();
		
		
	});
	
	var formData = new FormData($("form[name='addFrm']").get(0));
	
	function setEventhandling() {
	      
	      $("button#find_address").click(addressDaum);
	      // 상호명 유효성 검사
	      $('input#companyName').on('input', compnayNameCheck);
	      // 유형선택
	      $('select#accommodationType').on('change', selectedOption);
	      
	      $("select#accommodationSpec").on('change', selectedSpec);

	      $('#acomoModal-close').click(function() {
	         $('#myModal').css('display', 'none');
	        /*  updateImageData(); */
	      });
		
	      publicService();
	      
	      $('#addAcomoImage').click(function() {
	         $('#myModal').css('display', 'block');
	      });

	      acomoDragDropEvent();
	      
	      
	      
	      
	      $('#roomModal-close').click(function() {
	         $('#myModal_1').css('display', 'none');
	         /* updateImageData_1(); */
	      });

	      $('#addRoomImage').click(function() {
	         $('#myModal_1').css('display', 'block');
	      });

	      roomDragDropEvent();
	   }
	
	function compnayNameCheck(e) {
		const companyName = $(this).val();
		
		// 한글과 영어만 입력 가능한지 확인
	    var pattern = /^[a-zA-Z가-힣0-9\s]*$/;
	    if (!pattern.test(companyName)) {
	      $('span#error_companyName').text('업체명은 한글과 영어 숫자만 입력 숫자만 가능합니다.');
	      return;
	    }
	    if (companyName.length < 2 || companyName.length > 10) {
	        $('span#error_companyName').text('업체명은 2글자 이상 10글자 이하여야 합니다.');
	        return;
	      }
	    
	    $('span#error_companyName').text("");
	}
	
	function addressDaum() {
		new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                let addr = ''; // 주소 변수
                let extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    addr += extraAddr ;
                
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById("postcode").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("address").focus();
            }
        }).open();	
	
	} // END OF function addressDaum(){
	function selectedSpec() {
		
		const accommodationSpec = $(this).val();
		
		if(accommodationSpec !='choice'){
			$("input[name='accommodationSpec']").val(accommodationSpec);
		}
	}

		
	function selectedOption() {
		const selectedOption = $('select#accommodationType').val().trim();
        
		if (selectedOption === '1') {
	          $('#accommodationSpec').html(
	        	'<option value="choice">타입 선택</option>' +	  
	            '<option value="1">5성급</option>' +
	            '<option value="2">4성급</option>' +
	            '<option value="3">3성급</option>' +
	            '<option value="4">비지니스</option>' 
	          );
		}
		else if(selectedOption === '2') {
			$('#accommodationSpec').html(
				'<option value="choice">타입 선택</option>' +
	            '<option value="5">바다뷰</option>' +
	            '<option value="6">하늘뷰</option>' +
	            '<option value="7">호수뷰</option>' +
	            '<option value="8">공원뷰</option>' 
	          );
		}
		else if(selectedOption === 'choice') {
			$('#accommodationSpec').html('<option value="choice">먼저 숙소유형을 선택하시기바랍니다.</option>')
		}
		else{
			$('#accommodationSpec').html(
				'<option value="choice">타입 선택</option>' +	
	            '<option value="9">풀빌라</option>' +
	            '<option value="10">럭셔리</option>' 
	          );
		}
		
        
        
        $("input[name='accommodationType']").val(selectedOption);
        
		
	}
	
		let file_arr1 = []; // 첨부되어진 파일 정보를 담아 둘 배열 

	   function acomoDragDropEvent() {

	   $("div#dropArea").on('dragenter', function(event){   /* "dragenter" 이벤트는 드롭대상인 박스 안에 Drag 한 파일이 최초로 들어왔을 때 */
	           event.preventDefault();
	           event.stopPropagation();
	        }).on('dragover', function(event){   /* "dragover" 이벤트는 드롭대상인 박스 안에 Drag 한 파일이 머물러 있는 중일 때. 필수이벤트이다. dragover 이벤트를 적용하지 않으면 drop 이벤트가 작동하지 않음 */
	           event.preventDefault();
	           event.stopPropagation();
	           }).on('dragleave', function(event){   /* "dragleave" 이벤트는 Drag 한 파일이 드롭대상인 박스 밖으로 벗어났을 때  */
	             event.preventDefault();
	             event.stopPropagation();
	           }).on('drop', function(event){   /* "drop" 이벤트는 드롭대상인 박스 안에서 Drag 한것을 Drop(Drag 한 파일(객체)을 놓는것) 했을 때. 필수이벤트이다. */
	             event.preventDefault(); 
	        

	          var files = event.originalEvent.dataTransfer.files; // 드롭된 파일 가져오기
	          
	          if (files != null && files != undefined) {
	            
	            const f = files[0];
	             
	            var fileInfo = $('div#fileInfo').html(); // 기존 파일 정보 가져오기
	            
	            for (var i = 0; i < files.length; i++) {
	              var file = files[i];
	              var fileName = file.name;
	              var fileSize = file.size;
	              
	              

	              if (fileSize <= 10 * 1024 * 1024) { // 파일 크기가 10MB 이하인 경우에만 처리
	                 
	                 file_arr1.push(f);
	                 
	                 fileSize = fileSize < 1 ? fileSize.toFixed(3) : fileSize.toFixed(1);
	                  
	                 fileInfo +=
	                    "<div class='fileList'>" +
	                          "<span class='delete'>&times;</span>" +
	                          "<span class='fileName'>"+fileName+"</span>" +
	                          "<span class='fileSize'>"+formatFileSize(fileSize)+"</span>" +
	                          "<span class='clear'></span>" +
	                      "</div>";
	                   
	                } else {
	                  // 파일 크기가 10MB 이상인 경우에는 처리하지 않고 건너뜁니다.
	                   alert("10MB 이상인 파일은 업로드할 수 없습니다.!!");
	                }
	              
	              }
	            
	            $('#fileInfo').html(fileInfo); // 누적된 파일 정보 업데이트
	            isFileSelected = true;
	               $('#modal-confirm').click(function() {
	                // 여기에 확인 버튼 클릭 시 처리할 로직 작성
	                // 컨트롤러로 파일 전송 등의 동작 수행 가능
	                 /*  updateImageData(); */
	               $('#myModal').css('display', 'none'); // 모달 창 닫기
	              });
	            
	          }
	        });

	        // 파일의 확장자 가져오기
	        function getFileExtension(fileName) {
	          return fileName.slice((fileName.lastIndexOf('.') - 1 >>> 0) + 2);
	        }

	        // 파일 크기 포맷팅 (KB, MB, GB 등)
	        function formatFileSize(fileSize) {
	          if (fileSize === 0) return '0 Bytes';

	          var units = ['Bytes', 'KB', 'MB', 'GB', 'TB'];
	          var i = Math.floor(Math.log(fileSize) / Math.log(1024));

	          return parseFloat((fileSize / Math.pow(1024, i)).toFixed(2)) + ' ' + units[i];
	        }
	        
	        $(document).on('click',"span.delete", function(e){
	              let idx = $("span.delete").index($(e.target));
	           //   alert("인덱스 : " + idx);
	              
	              //console.log("배열에서 파일을 제거하기 전 => " + file_arr1);
	           
	              file_arr1.splice(idx,1);
	              //console.log("배열에서 파일을 제거한 후 => " + file_arr1);
	              <%-- 
	                       배열명.splice() : 배열의 특정 위치에 배열 요소를 추가하거나 삭제하는데 사용한다. 
	                                                        삭제할 경우 리턴값은 삭제한 배열 요소이다. 삭제한 요소가 없으면 빈 배열( [] )을 반환한다.
	         
	                      배열명.splice(start, 0, element);  // 배열의 특정 위치에 배열 요소를 추가하는 경우 
	                            start   - 수정할 배열 요소의 인덱스
	                            0       - 요소를 추가할 경우
	                            element - 배열에 추가될 요소
	                
	                      배열명.splice(start, deleteCount); // 배열의 특정 위치의 배열 요소를 삭제하는 경우    
	                            start   - 수정할 배열 요소의 인덱스
	                            deleteCount - 삭제할 요소 개수
	         --%>
	              $(e.target).parent().remove();   // 스팬태그 뿐만아니라 전체 내용을 다삭제함
	              /* updateImageData();  */      
	           });
	   }

	   let file_arr2 = [];	
		
	function roomDragDropEvent() {
		$("div#dropArea_1").on('dragenter', function(event){   /* "dragenter" 이벤트는 드롭대상인 박스 안에 Drag 한 파일이 최초로 들어왔을 때 */
           event.preventDefault();
           event.stopPropagation();
        }).on('dragover', function(event){   /* "dragover" 이벤트는 드롭대상인 박스 안에 Drag 한 파일이 머물러 있는 중일 때. 필수이벤트이다. dragover 이벤트를 적용하지 않으면 drop 이벤트가 작동하지 않음 */
           event.preventDefault();
           event.stopPropagation();
           }).on('dragleave', function(event){   /* "dragleave" 이벤트는 Drag 한 파일이 드롭대상인 박스 밖으로 벗어났을 때  */
             event.preventDefault();
             event.stopPropagation();
           }).on('drop', function(event){   /* "drop" 이벤트는 드롭대상인 박스 안에서 Drag 한것을 Drop(Drag 한 파일(객체)을 놓는것) 했을 때. 필수이벤트이다. */
             event.preventDefault(); 
        

          var files = event.originalEvent.dataTransfer.files; // 드롭된 파일 가져오기
          
          if (files != null && files != undefined) {
            
            const f = files[0];
             
            var fileInfo = $('div#fileInfo_1').html(); // 기존 파일 정보 가져오기
            
            for (var i = 0; i < files.length; i++) {
              var file = files[i];
              var fileName = file.name;
              var fileSize = file.size;
              
              

              if (fileSize <= 10 * 1024 * 1024) { // 파일 크기가 10MB 이하인 경우에만 처리
                 
                 file_arr2.push(f);
                 
                 fileSize = fileSize < 1 ? fileSize.toFixed(3) : fileSize.toFixed(1);
                  
                 fileInfo +=
                    "<div class='fileList_1'>" +
                          "<span class='delete_1'>&times;</span>" +
                          "<span class='fileName_1'>"+fileName+"</span>" +
                          "<span class='fileSize_1'>"+formatFileSize(fileSize)+"</span>" +
                          "<span class='clear'></span>" +
                      "</div>";
                   
                } else {
                  // 파일 크기가 10MB 이상인 경우에는 처리하지 않고 건너뜁니다.
                   alert("10MB 이상인 파일은 업로드할 수 없습니다.!!");
                }
              
              }
            
            $('#fileInfo_1').html(fileInfo); // 누적된 파일 정보 업데이트
            isFileSelected = true;
               $('#modal-confirm_1').click(function() {
                // 여기에 확인 버튼 클릭 시 처리할 로직 작성
                // 컨트롤러로 파일 전송 등의 동작 수행 가능
                // AJAX 요청 등을 이용하여 처리하면 됩니다.
                // 예: sendFilesToController(files);
            	   /* updateImageData_1(); */
               $('#myModal_1').css('display', 'none'); // 모달 창 닫기
              });
            
          }
        });

        // 파일의 확장자 가져오기
        function getFileExtension(fileName) {
          return fileName.slice((fileName.lastIndexOf('.') - 1 >>> 0) + 2);
        }

        // 파일 크기 포맷팅 (KB, MB, GB 등)
        function formatFileSize(fileSize) {
          if (fileSize === 0) return '0 Bytes';

          var units = ['Bytes', 'KB', 'MB', 'GB', 'TB'];
          var i = Math.floor(Math.log(fileSize) / Math.log(1024));

          return parseFloat((fileSize / Math.pow(1024, i)).toFixed(2)) + ' ' + units[i];
        }
        
        $(document).on('click',"span.delete_1", function(e){
              let idx = $("span.delete_1").index($(e.target));
           //   alert("인덱스 : " + idx);
              
             // console.log("배열에서 파일을 제거하기 전 => " + file_arr2);
           
              file_arr2.splice(idx,1);
            //  console.log("배열에서 파일을 제거한 후 => " + file_arr2);
              <%-- 
                       배열명.splice() : 배열의 특정 위치에 배열 요소를 추가하거나 삭제하는데 사용한다. 
                                                        삭제할 경우 리턴값은 삭제한 배열 요소이다. 삭제한 요소가 없으면 빈 배열( [] )을 반환한다.
         
                      배열명.splice(start, 0, element);  // 배열의 특정 위치에 배열 요소를 추가하는 경우 
                            start   - 수정할 배열 요소의 인덱스
                            0       - 요소를 추가할 경우
                            element - 배열에 추가될 요소
                
                      배열명.splice(start, deleteCount); // 배열의 특정 위치의 배열 요소를 삭제하는 경우    
                            start   - 수정할 배열 요소의 인덱스
                            deleteCount - 삭제할 요소 개수
         --%>
              $(e.target).parent().remove();   // 스팬태그 뿐만아니라 전체 내용을 다삭제함
           });
	   }
	
	function publicService() {
		$('input[type="checkbox"][name="publicService"]:checked').each(function() {
	 	   formData.append('publicService', $(this).val());
	 	 });
	}
	
	
	function openAcomoImage() {
		  // 파일 선택 input 태그 열기
		  $('input#AcomoImage').click();
		  formData = new FormData($("form[name='addFrm']").get(0));
		  $("input#AcomoImage").change(function() {
			    var fileInput = $(this)[0];
			    var file = fileInput.files[0]
			    formData.append('AcomoImage', file);
		  });
		  
		  const postcode = $('input#postcode').val();
      	  const address = $("input#address").val();
      	
      	  $("input#address_hidden").val(postcode+address);
      	
      	  func_geocoder(postcode+address);
		}
	
	
	function openRoomImage() {
		  // 파일 선택 input 태그 열기
		  $('input#RoomImage').click();
		  formData = new FormData($("form[name='addFrm']").get(0));
		  $("input#RoomImage").change(function() {
			    var fileInput = $(this)[0];
			    var file = fileInput.files[0]
			    formData.append('RoomImage', file);
		  });
		}
	
	function goAcomoinspection() {
		formData = new FormData($("form[name='addFrm']").get(0));
		
		const companyName = $("#companyName").val().trim();
        if(companyName == "" ||  $('span#error_companyName').text() != "") {
           alert("업체명을 올바르게 입력해주세요!!");
           $("#companyName").focus();
	           return;
        }
        
        if ($('input#postcode').val() == "" || $("input#address").val() == "" ){
			alert('우편주소를 입력해주세요');
			return ;
		}
      
        	
        	 
        
        
        if ($("select#accommodationType").val() == 'choice'){
        	alert('숙소  유형을 선택해주세요');
			return ;
        }
        
        
        if ($("select#accommodationSpec").val() == 'choice'){
        	alert('숙소  타입을 선택해주세요');
			return ;
        }
        
        
        
        if(file_arr1.length > 0){// 파일 첨부가 있을 경우
            
            // 첨부한 파일의 총합의 크기가 10MB 이상이라면 메일 전송을 못하게 막는다.
            let sum_file_size = 0;
             
              for(let i=1; i<file_arr1.length;i++){
                sum_file_size += file_arr1[i].size;
              } // end of for -------------------------------------------
              
              if(sum_file_size >= 10*1024*1024){ // 첨부한 파일의 총합의 크기가 10MB 이상이라면
                 alert("첨부한 숙소 추가이미지 파일의 총합의 크기가 10MB 이상이라서 파일을 업로드 할 수 없습니다.");
                   return; // 종료
              }
              else{ // formData 속에 첨부파일을 넣어주기 
                  file_arr1.forEach(function(item){
                	  formData.append("file_arr1", item); // 첨부파일을 추가하기
                  });                            // 같은 key를 가진 값을 여러 개 넣을 수 있다.(덮어씌워지지 않고 추가가 된다.)
               }
            
         }// end of if(file_arr.length > 0) ----------------------------
         
         const AcomoImage = $("input#AcomoImage");
         
         if(AcomoImage.get(0).files.length === 0){
        	   alert('숙소대표 이미지를 추가 하셔야 합니다.');
        	    return;
         }
         
         let isChecked = false;

         $("input:checkbox[name='publicService']").each(function() {
           if ($(this).prop('checked')) {
             isChecked = true;
             return false; // 체크박스가 하나라도 선택되었으므로 반복문을 종료
           }
           
           
           
         });

         if (!isChecked) {
           alert("편의 시설을 최소 1개 이상 선택 해주세요.");
           return;
         }
         
         
         let hasInput = false;

         for (var i = 1; i <= 3; i++) {
           var aroundInfo = $('#aroundInfo' + i).val();
           
           if (aroundInfo) {
             hasInput = true;
             break; // 하나라도 입력된 경우 반복문을 종료합니다.
           }
         }

         if (!hasInput) {
           alert("적어도 하나의 주변 정보를 작성해주세요.");
         }
        	
         if($("#roomType").val() == "other") {
        	 alert('객실 유형을 선택해주세요');
 			 return ;
         }
         
         const price = $("input#price").val();         
         if(!/^\d+$/.test(price) || $("input#price").val() == "") {
        	 alert('정상가 입력란이 비어있거나 정상가는 숫자만 입력가능합니다.!!');
        	 return;
         }
         
         const RoomImage = $("input#RoomImage");
         
         if(RoomImage.get(0).files.length === 0){
        	   alert('객실 대표 이미지를 추가 하셔야 합니다.');
        	    return;
         }
         
         
         if(file_arr2.length > 0){// 파일 첨부가 있을 경우
             
             // 첨부한 파일의 총합의 크기가 10MB 이상이라면 메일 전송을 못하게 막는다.
             let sum_file_size = 0;
              
               for(let i=1; i<file_arr2.length;i++){
                 sum_file_size += file_arr2[i].size;
               } // end of for -------------------------------------------
               
               if(sum_file_size >= 10*1024*1024){ // 첨부한 파일의 총합의 크기가 10MB 이상이라면
                  alert("첨부한 추가 객실 이미지 파일의 총합의 크기가 10MB 이상이라서 파일을 업로드 할 수 없습니다.");
                    return; // 종료
               }
               else{ // formData 속에 첨부파일을 넣어주기 
                   file_arr2.forEach(function(item){
                	   formData.append("file_arr2", item); // 첨부파일을 추가하기
                   });                            // 같은 key를 가진 값을 여러 개 넣을 수 있다.(덮어씌워지지 않고 추가가 된다.)
                }
             
          }// end of if(file_arr.length > 0) ----------------------------
          
          
          
          $.ajax({
     	  	 url : "<%= ctxPath%>/insertAcomoAndRoom.gc",
              type : "post",
              data : formData,
              processData:false,  // 파일 전송시 설정 
              contentType:false,  // 파일 전송시 설정 
              dataType:"json",
              success:function(json){
                  // console.log("~~~ 확인용 : " + JSON.stringify(json));
                  // ~~~ 확인용 : {"result":1}
                  if(json.result == 1) {
                	  alert("관리자에게 숙소 검수 요청 되었습니다.");
                	  location.href="<%= ctxPath%>/main/hosthome.gc";
                  }
                  else {
                  }
              },
              error: function(request, status, error){
              	alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
              }
              
     	  });
          
          
          
         
	}
	
	function func_geocoder(address) {
		   // 주소-좌표 변환 객체를 생성합니다
		   var geocoder = new kakao.maps.services.Geocoder();

		   geocoder.addressSearch(address, function(result, status) {

			   if (status === kakao.maps.services.Status.OK) {
				    // 주소가 정상적으로 검색이 완료됐으면
			    	$("input#lat").val(result[0].y); // result[0].y ==> 위도
			    	$("input#lng").val(result[0].x); // result[0].x ==> 경도
			    } 
			}); 
	   }
	
 	
</script>

<div>
	<h2 style="margin-bottom: 20px;">숙소등록</h2>
	<span style="display:inline-block; margin-bottom:20px; font-weight:bold; color:333333;">[필수 기입 정보]</span>
	<form name="addFrm" id="" enctype="multipart/form-data">
		<div class="table">
  <table class="table align-middle">
    
    <tbody>
      <tr>
        <th class="th_info" style="border:solid 1px #ddd;">게스트 하우스 <br> 기본정보</th>
     	<td >
     		<div class="row text-center"><span class="col-md-2" style="display:inline-block; margin-top:14px; font-size: 14px; font-weight: bold;">업체명</span><input type="text" id="companyName" name="companyName"class="form-control col-md-6 input_info" placeholder="업체 명을 입력하세요."/></div>
     		<div class="row " style="padding-top:3px; margin-left:39px;"><span class="offset-md-2"id="error_companyName" style="color:red;"></span></div>
     		<div class="row text-center" style="margin-top:10px;"><span class="col-md-2"style="display:inline-block; margin-top:14px; font-size: 14px; font-weight: bold;">업체 주소</span><input type="text" id="postcode" class="form-control  col-md-6 input_info" name="postcode" placeholder="업체 주소를 입력하세요." readonly/><button type="button" id="find_address"class="col-md-2 btn_address">주소검색</button></div>
     		<div class="row" style="margin-top:10px; margin-right:5px;"><input name="address" id="address" class="form-control col-md-6 offset-md-3" style="height:50px; "placeholder="나머지 주소를 입력하세요."/></div>
     		<div class="row text-center" style="margin-top:10px; margin-right:5px;" >
     		<span class="col-md-2" style="display:inline-block; margin-top:14px; font-size: 14px; font-weight: bold;">숙소유형</span>
     			<select class="form-control col-md-3 offset-md-1" id="accommodationType">
     				<option value="choice" selected>유형 선택</option>
     				<option value="1">호텔/리조트</option>
     				<option value="2">모텔</option>
     				<option value="3">펜션</option>
     			</select>
     			<input type="hidden" name="accommodationType">
     			<span class="col-md-2" style="display:inline-block; margin-top:14px; font-size: 14px; font-weight: bold;">타입</span>
     			<select id ="accommodationSpec"  class="form-control col-md-3"><option>먼저 숙소유형을 선택하시기바랍니다.</option></select>
     			<input type="hidden" name="accommodationSpec" >
     		</div>
     	</td>
      </tr>
      <tr class="align-bottom">
        <th class="th_info" style="border:solid 1px #ddd;">업체 이미지 <br> (최대 20장)</th>
        <td>
        	<div style="line-height: 22px !important; color:#0000008F !important; font-size:13px !important; width:100% !important;">
	        	<p>* 객실 및 업체 전경, 로비, 주차장 등 업체의 전반적인 이미지를 업로드해주시기 바랍니다.</p>
	        	<p>* 이미지 교체를 원하시면 "변경"을 선택하시고 삭제를 원하시면 우측 "삭제"를 선택하시기 바랍니다.</p>
	        	<p>* 이미지 장소는 짧게 기입해주시기 바랍니다. 예시) 전경, 로비, 주차장 등</p>
	        	<p>* 첫 이미지가 메인 이미지이며 드래그를 통해 순서 변경이 가능합니다.</p>
        	</div>
        	<div style="margin-top:30px;">
        		<span class="col-md-3" style="display:inline-block; margin-top:14px; font-size: 14px; font-weight: bold;">숙소대표 이미지</span><button type="button" id="AcomoImage" class="btn_image" style="margin-left:10px;" onclick="openAcomoImage()">+이미지 추가</button><input type="file" name="AcomoImage"id="AcomoImage" style="display:none" />
        	</div>
        	<div style="margin-top:30px;" >
        		<span class="col-md-3" style="display:inline-block; margin-top:14px; font-size: 14px; font-weight: bold;">숙소 추가이미지</span><button id="addAcomoImage" type="button" class="btn_image" style="margin-left:10px;">+이미지 추가</button>
        			  <div id="myModal" class="modal">
					    <div class="modal-content">
					      <span id="acomoModal-close"class="modal-close">&times;</span>
					      <h3>숙소 추가 이미지</h3>
					      <div class="drop-area" id="dropArea">이곳에 숙소 사진을 드롭하세요</div>
					      <p>* 여러장을 한꺼번에 드래그하여 업로드 할 수 있습니다.</p>
					      <p style="color:red;">* 최대 20장 까지 등록이 가능합니다.</p>
					      <p>*  사진 권장사이즈 : 1920 * 1080 또는 960 * 540</p>
					      <h5 style="margin-top:20px;">업로드된 파일</h5>
					      <div id="fileInfo" class="file-info"></div>
					      <div class="modal-buttons text-center">
						      <button type="button" id="modal-confirm" style="margin-top:20px;">확인</button>
					      </div>
					    </div>
					  </div>
        	</div>
        </td>
      </tr>
      <tr>
         <th class="th_info" style="border:solid 1px #ddd;">편의시설 <br> 서비스 안내</th>
         <td>
         	 <div style="width: 100%; font-size: 14px;margin-left:10px; line-height: 30px;">
	         	<input type="checkbox" name ="publicService"id="theme01" value="1" /><label style="width: 90px; margin-left:8px;" for="theme01">사우나</label>
	         	<input type="checkbox" name ="publicService"id="theme02" value="2"/><label style="width: 90px; margin-left:8px;" for="theme02">야외테라스</label>
	         	<input type="checkbox" name ="publicService"id="theme03" value="3"/><label style="width: 90px; margin-left:8px;" for="theme03">스파</label>
	         	<input type="checkbox" name ="publicService"id="theme04" value="4"/><label style="width: 90px; margin-left:8px;" for="theme04">미니바</label><br>
	         	<input type="checkbox" name ="publicService"id="theme05" value="5"/><label style="width: 90px; margin-left:8px;" for="theme05">욕실TV</label>
	         	<input type="checkbox" name ="publicService"id="theme06" value="6"/><label style="width: 90px; margin-left:8px;" for="theme06">빔프로젝터</label>
	         	<input type="checkbox" name ="publicService"id="theme07" value="7"/><label style="width: 90px; margin-left:8px;" for="theme07">당구대</label>
	         	<input type="checkbox" name ="publicService"id="theme08" value="8"/><label style="width: 90px; margin-left:8px;" for="theme08">노래방</label><br>
	         	<input type="checkbox" name ="publicService"id="theme09" value="9"/><label style="width: 90px; margin-left:8px;" for="theme09">골프장</label>
	         	<input type="checkbox" name ="publicService"id="theme10" value="10"/><label style="width: 90px; margin-left:8px;" for="theme10">레스토랑</label>
	         	<input type="checkbox" name ="publicService"id="theme11" value="11"/><label style="width: 90px; margin-left:8px;" for="theme11">편의점</label>
	         	<input type="checkbox" name ="publicService"id="theme12" value="12"/><label style="width: 90px; margin-left:8px;" for="theme12">라운지</label><br>
	         	<input type="checkbox" name ="publicService"id="theme13" value="13"/><label style="width: 90px; margin-left:8px;" for="theme13">와이파이</label>
	         	<input type="checkbox" name ="publicService"id="theme14" value="14"/><label style="width: 90px; margin-left:8px;" for="theme14">전기밥솥</label>
	         	<input type="checkbox" name ="publicService"id="theme15" value="15"/><label style="width: 90px; margin-left:8px;" for="theme15">욕실용품</label>
	         	<input type="checkbox" name ="publicService"id="theme16" value="16" /><label style="width: 90px; margin-left:8px;" for="theme16">냉장고</label><br>
	         	<input type="checkbox" name ="publicService"id="theme17" value="17"/><label style="width: 90px; margin-left:8px;" for="theme17">BBQ</label>
	         	<input type="checkbox" name ="publicService"id="theme18" value="18"/><label style="width: 90px; margin-left:8px;" for="theme18">카페</label>
	         	<input type="checkbox" name ="publicService"id="theme19" value="19" /><label style="width: 90px; margin-left:8px;" for="theme19">족구장</label>
	         	<input type="checkbox" name ="publicService"id="theme20" value="20"/><label style="width: 90px; margin-left:8px;" for="theme20">놀이방</label><br>
	         	<input type="checkbox" name ="publicService"id="theme21" value="21"/><label style="width: 90px; margin-left:8px;" for="theme21">에어컨</label>
	         	<input type="checkbox" name ="publicService"id="theme22" value="22"/><label style="width: 90px; margin-left:8px;" for="theme22">전기밥솥</label>
	         	<input type="checkbox" name ="publicService"id="theme23" value="23"/><label style="width: 90px; margin-left:8px;" for="theme23">욕실용품</label>
	         	<input type="checkbox" name ="publicService"id="theme24" value="24"/><label style="width: 90px; margin-left:8px;" for="theme24">냉장고</label><br>
	         </div>
         </td>
      </tr>
      <tr>
         <th class="th_info" style="border:solid 1px #ddd;">주변정보 </th>
         <td>
         	 <div style="line-height: 22px !important; color:#0000008F !important; font-size:13px !important; width:100% !important;">
		         <p class=col-md-12>* 숙소 주변의 명소(교통, 관광, 쇼핑 등 )와 이동수단, 게스트하우스로부터 소요시간을 기입해주세요.</p>
		         <p class=col-md-12>* [명소 / 이동수단 / 소요시간] 순으로 한줄만 입력이 가능하며 최대 3개까지 작성 가능합니다.</p>
		         <p class=col-md-12>* 예시) 가산디지털단지역 도보 5분</p>
		         <p class=col-md-12>* 예시) 팔당댐 차량 10분</p>
	         </div>
	         <div  style="margin-top: 50px;">
	         	<input type="text" name="aroundInfo1" id="aroundInfo1" class="form-control col-md-12" placeholder="숙소 주변의 명소를 홍보하여 주세요.교통, 관광, 쇼핑 명소부터 게스트하우스까지의 소요시간을 예시 문구를 참고하여 작성해 주시면게스트들이 예약할 때 큰 도움이 됩니다."/>
	         	<br>
	         	<input type="text" name="aroundInfo2" id="aroundInfo2" class="form-control col-md-12" placeholder="숙소 주변의 명소를 홍보하여 주세요.교통, 관광, 쇼핑 명소부터 게스트하우스까지의 소요시간을 예시 문구를 참고하여 작성해 주시면게스트들이 예약할 때 큰 도움이 됩니다."/>
	         	<br>
	         	<input type="text" name="aroundInfo3" id="aroundInfo3" class="form-control col-md-12" placeholder="숙소 주변의 명소를 홍보하여 주세요.교통, 관광, 쇼핑 명소부터 게스트하우스까지의 소요시간을 예시 문구를 참고하여 작성해 주시면게스트들이 예약할 때 큰 도움이 됩니다."/>
	         </div>
	         <div id="backgroundImg" style="height: 315px;">
	         	<div>
	         		<span id="infoExample" class="col-md-5">명동 도보 5분<br>application/host/views/pages/guest/intro.php 남산공원 버스 15분<br>청계천 지하철 10분<br><br></span>
	         	</div>
	         </div>
         </td>
      </tr>
      <tr>
      	<th class="th_info" style="border:solid 1px #ddd;">주차장 정보</th>
      	<td>
      		<div>
      			<textarea name="parkInfo" id="parkInfo" class="form-control row-6" placeholder="주차장 유/무료 정보 및 시간당 요금을 기재해주세요."></textarea>
      		</div>
      		<div style="height: 315px; background-image: url('<%= ctxPath%>/resources/images/주차정보.png'); background-size: cover; background-position: center;">
      			<span id="infoExample"  class="col-md-5">숙소 앞 공용 유료 주차장<br>(시간당 2,000원 / 22시 이후 무료)</span>
      		</div>
      	</td>
      </tr>
      <tr>
      	<th class="th_info" style="border:solid 1px #ddd;">객실 정보 및 가격</th>
      	<td>
      		<div class="row text-center mt-3">
      			<span class="col-md-2" style="display:inline-block; margin-top:14px; font-size: 14px; font-weight: bold;">객실 유형</span>
      			<select id="roomType"class="form-control col-md-6 offset-md-1" style="height: 50px;">
      				<option value="other" selected>유형을 선택해주세요.</option>
      				<option>스탠다드</option>
      				<option>디럭스</option>
      			</select>	
      		</div>
      		<div class="row text-center mt-3"><span class="col-md-2" style="display:inline-block; margin-top:14px; font-size: 14px; font-weight: bold; margin-left:3px;">정상가</span><input type="text" id="price" name="price"class="form-control col-md-4 input_info" /><span style="display:inline-block; margin-top:14px; font-size: 14px; font-weight: bold; margin-left:3px;">원</span></div>
      	</td>
      </tr>
      <tr>
      	<th class="th_info" style="border:solid 1px #ddd;">객실 이미지 정보 <br> (최대15장)</th>
      	<td>
      		<div style="line-height: 22px; color:#0000008F; font-size:13px; width:100%;">
	        	<p>* 객실의 전반적인 이미지를 업로드 해주시기 바랍니다.</p>
	        	<p>* 이미지 교체를 원하시면 "변경"을 선택하시고 삭제를 원하시면 우측 "삭제"를 선택하시기 바랍니다.</p>
	        	<p>* 이미지 장소는 짧게 기입해주시기 바랍니다. 예시) 객실명, 침대, 화장실 등</p>
	        	<p>* 첫 이미지가 메인 이미지이며 드래그를 통해 순서 변경이 가능합니다.</p>
        	</div>
        	<div style="margin-top:30px;">
        		<span class="col-md-3" style="display:inline-block; margin-top:14px; font-size: 14px; font-weight: bold;">객실 대표 이미지</span><button type="button" id="roomImage" class="btn_image" style="margin-left:10px;" onclick="openRoomImage()">+이미지 추가</button><input type="file" name="RoomImage" id="RoomImage" style="display:none" />
        	</div>
        	<div style="margin-top:30px;" >
        		<span class="col-md-3" style="display:inline-block; margin-top:14px; font-size: 14px; font-weight: bold;">객실 추가이미지</span><button id="addRoomImage" type="button" class="btn_image" style="margin-left:10px;">+이미지 추가</button>
        			  <div id="myModal_1" class="modal">
					    <div class="modal-content">
					      <span id="roomModal-close"class="modal-close">&times;</span>
					      <h3>숙소 추가 이미지</h3>
					      <div class="drop-area" id="dropArea_1">이곳에 숙소 사진을 드롭하세요</div>
					      <p>* 여러장을 한꺼번에 드래그하여 업로드 할 수 있습니다.</p>
					      <p style="color:red;">* 최대 15장 까지 등록이 가능합니다.</p>
					      <p>*  사진 권장사이즈 : 1920 * 1080 또는 960 * 540</p>
					      <h5 style="margin-top:20px;">업로드된 파일</h5>
					      <div id="fileInfo_1" class="file-info"></div>
					      <div class="modal-buttons text-center">
						      <button type="button" id="modal-confirm_1" style="margin-top:20px;">확인</button>
					      </div>
					    </div>
					  </div>
        	</div>
      	</td>
      </tr>
    </tbody>
  </table>
  <div class="text-center" style="padding: 20px 0px 20px 0px;">
  	 <input type="text"  id="address_hidden"/>
  	 <input type="text"  id="lat" name="lat"/>
  	 <input type="text"  id="lng" name="lng"/>
     <button type="button" class="btn_save" onclick="goAcomoinspection()">숙소 검수 요청 ></button>
  </div>
  
</div>
	</form>
</div>    