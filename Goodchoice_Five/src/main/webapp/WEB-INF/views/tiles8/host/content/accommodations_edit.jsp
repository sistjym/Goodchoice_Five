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
	
</style>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
	
	$(document).ready(function(){
		eventhandling()
	});
	
	function eventhandling() {
		
		$("button#find_address").click(addressDaum);
		
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
	
	
	
</script>

<div>
	<h2 style="margin-bottom: 20px;">숙소정보 수정</h2>
	<form>
		<div class="table">
  <table class="table align-middle">
    
    <tbody>
      <tr>
        <th class="th_info" style="border:solid 1px #ddd;">게스트 하우스 <br> 기본정보</th>
     	<td >
     		<div class="row text-center"><span class="col-md-2" style="display:inline-block; margin-top:14px; font-size: 14px; font-weight: bold;">업체명</span><input type="text" class="form-control col-md-6 input_info" placeholder="수정 할 업체 명을 입력하세요."/></div>
     		<div class="row text-center" style="margin-top:10px;"><span class="col-md-2"style="display:inline-block; margin-top:14px; font-size: 14px; font-weight: bold;">업체 주소</span><input type="text" id="postcode" class="form-control  col-md-6 input_info" name="postcode" placeholder="업체 주소를 입력하세요." readonly/><button type="button" id="find_address"class="col-md-2 btn_address">주소검색</button></div>
     		<div class="row" style="margin-top:10px;"><input name="address" id="address" class="form-control col-md-6 offset-md-3" style="height:50px; "placeholder="나머지 주소를 입력하세요."/></div>
     	</td>
      </tr>
      <tr class="align-bottom">
        <th class="th_info" style="border:solid 1px #ddd;">업체 이미지 <br> (최대 20장)</th>
        <td>
        	<div style="line-height: 22px; color:#0000008F; font-size:13px; width:100%;">
	        	<p>* 객실 및 업체 전경, 로비, 주차장 등 업체의 전반적인 이미지를 업로드해주시기 바랍니다.</p>
	        	<p>* 이미지 교체를 원하시면 "변경"을 선택하시고 삭제를 원하시면 우측 "삭제"를 선택하시기 바랍니다.</p>
	        	<p>* 이미지 장소는 짧게 기입해주시기 바랍니다. 예시) 전경, 로비, 주차장 등</p>
	        	<p>* 첫 이미지가 메인 이미지이며 드래그를 통해 순서 변경이 가능합니다.</p>
        	</div>
        	<div style="margin-top:30px;">
        		<button type="button" class="btn_image">+이미지 추가</button>
        	</div>
        </td>
      </tr>
      <tr>
         <th class="th_info" style="border:solid 1px #ddd;">편의시설 <br> 서비스 안내</th>
         <td>
         	 <div style="width: 100%;font-size: 14pt;margin-left:30px; line-height: 50px;">
	         	<input type="checkbox" id="theme01" /><label style="width: 90px; margin-left:8px;" for="theme01">주방/식당</label>
	         	<input type="checkbox" id="theme02" /><label style="width: 90px; margin-left:8px;" for="theme02">세탁기</label>
	         	<input type="checkbox" id="theme03" /><label style="width: 90px; margin-left:8px;" for="theme03">건조기</label>
	         	<input type="checkbox" id="theme04" /><label style="width: 90px; margin-left:8px;" for="theme04">탈수기</label><br>
	         	<input type="checkbox" id="theme05" /><label style="width: 90px; margin-left:8px;" for="theme05">탈수기</label>
	         	<input type="checkbox" id="theme06" /><label style="width: 90px; margin-left:8px;" for="theme06">탈수기</label>
	         	<input type="checkbox" id="theme07" /><label style="width: 90px; margin-left:8px;" for="theme07">탈수기</label>
	         	<input type="checkbox" id="theme08" /><label style="width: 90px; margin-left:8px;" for="theme08">탈수기</label><br>
	         	<input type="checkbox" id="theme09" /><label style="width: 90px; margin-left:8px;" for="theme09">탈수기</label>
	         	<input type="checkbox" id="theme10" /><label style="width: 90px; margin-left:8px;" for="theme10">탈수기</label>
	         	<input type="checkbox" id="theme11" /><label style="width: 90px; margin-left:8px;" for="theme11">탈수기</label>
	         	<input type="checkbox" id="theme12" /><label style="width: 90px; margin-left:8px;" for="theme12">탈수기</label><br>
	         </div>
         </td>
      </tr>
      <tr>
         <th class="th_info" style="border:solid 1px #ddd;">주변정보 </th>
         <td>
         	 <div style="line-height: 22px; color:#0000008F; font-size:13px; width:100%;">
		         <p class=col-md-12>* 숙소 주변의 명소(교통, 관광, 쇼핑 등 )와 이동수단, 게스트하우스로부터 소요시간을 기입해주세요.</p>
		         <p class=col-md-12>* [명소 / 이동수단 / 소요시간] 순으로 한줄만 입력이 가능하며 최대 3개까지 작성 가능합니다.</p>
		         <p class=col-md-12>* 예시) 가산디지털단지역 도보 5분</p>
		         <p class=col-md-12>* 예시) 팔당댐 차량 10분</p>
	         </div>
	         <div  style="margin-top: 50px;">
	         	<input type="text" class="form-control col-md-12" placeholder="숙소 주변의 명소를 홍보하여 주세요.교통, 관광, 쇼핑 명소부터 게스트하우스까지의 소요시간을 예시 문구를 참고하여 작성해 주시면게스트들이 예약할 때 큰 도움이 됩니다."/>
	         	<br>
	         	<input type="text" class="form-control col-md-12" placeholder="숙소 주변의 명소를 홍보하여 주세요.교통, 관광, 쇼핑 명소부터 게스트하우스까지의 소요시간을 예시 문구를 참고하여 작성해 주시면게스트들이 예약할 때 큰 도움이 됩니다."/>
	         	<br>
	         	<input type="text" class="form-control col-md-12" placeholder="숙소 주변의 명소를 홍보하여 주세요.교통, 관광, 쇼핑 명소부터 게스트하우스까지의 소요시간을 예시 문구를 참고하여 작성해 주시면게스트들이 예약할 때 큰 도움이 됩니다."/>
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
      			<textarea class="form-control row-6" placeholder="주차장 유/무료 정보 및 시간당 요금을 기재해주세요."></textarea>
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
      			<select class="form-control col-md-6 offset-md-1" style="height: 50px;">
      				<option value="other" selected>유형을 선택해주세요.</option>
      				<option>A타입</option>
      				<option>B타입</option>
      			</select>	
      		</div>
      		<div class="row text-center mt-3"><span class="col-md-2" style="display:inline-block; margin-top:14px; font-size: 14px; font-weight: bold; margin-left:3px;">정상가</span><input type="text" class="form-control col-md-4 input_info" /><span style="display:inline-block; margin-top:14px; font-size: 14px; font-weight: bold; margin-left:3px;">원</span></div>
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
        		<button type="button" class="btn_image">+이미지 추가</button>
        	</div>
      	</td>
      </tr>
    </tbody>
  </table>
  <div class="text-center" style="padding: 20px 0px 20px 0px;">
     <button type="button" class="btn_save">숙소 검수 요청 ></button>
  </div>
  
</div>
	</form>
</div>    