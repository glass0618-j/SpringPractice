<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../includes/h2.jsp"%>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
function sample4_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 참고 항목 변수
            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if(data.buildingName !== '' && data.apartment === 'Y'){
               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }
            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample4_postcode').value = data.zonecode;
            document.getElementById("sample4_roadAddress").value = roadAddr;
            document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
            
            // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
            if(roadAddr !== ''){
                document.getElementById("sample4_extraAddress").value = extraRoadAddr;
            } else {
                document.getElementById("sample4_extraAddress").value = '';
            }
            var guideTextBox = document.getElementById("guide");
            // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
            if(data.autoRoadAddress) {
                var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                guideTextBox.style.display = 'block';
            } else if(data.autoJibunAddress) {
                var expJibunAddr = data.autoJibunAddress;
                guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                guideTextBox.style.display = 'block';
            } else {
                guideTextBox.innerHTML = '';
                guideTextBox.style.display = 'none';
            }
        }
    }).open();
}
	
	function checkUserIdExist() {
		console.log("-------------------");
		var user_id = $("#user_id").val();
		
		if(user_id.length == 0){
			alert('아이디를 입력해주세요!');
			return;
		}
		$.ajax({
			url : '/user/join2?user_id='+user_id,
			type : 'get',
			success : function(result) {
				if(result) {
					alert('사용할 수 있는 아이디입니다.');
					//$("#userIdExist").val('true');
				}else {
					alert('사용할 수 없는 아이디입니다.');
					//$("#userIdExist").val('false');
				}
			}
		});
	}
	function resetUserIdExist() {
		$("#userIdExist").val('false')
	}

	function check_pw(){
		var user_pw = document.getElementById('user_pw').value;
		
		 if(document.getElementById('user_pw').value !='' && document.getElementById('user_pw_confirm').value!=''){
             if(document.getElementById('user_pw').value==document.getElementById('user_pw_confirm').value){
                 document.getElementById('check').innerHTML='비밀번호가 일치합니다.'
                 document.getElementById('check').style.color='blue';
             }
             else{
                 document.getElementById('check').innerHTML='비밀번호가 일치하지 않습니다.';
                 document.getElementById('check').style.color='red';
             }
		 }
	}
</script>

<main>
<form id="actionForm" action="/user/join_success" method="post">
	<div class="joinBox" style="padding: 150px 150px; line-height: 1.7;">
		 <h2 style="padding: 5px">회원가입</h2>
		<div class="boardWrite" >
			<table >
				<tr >
					<th scope="row">아이디</th>
					<td><input id="user_id" name="user_id" 
						fw-filter="isFill&amp;isFill&amp;isMin[4]&amp;isMax[16]&amp;isIdentity"
						fw-label="아이디" fw-msg="" class="inputTypeText" placeholder=""
						value="" type="text"> <a href="#none" title="새창 열기"
						onclick="checkUserIdExist()" ><img
							src="/web/upload/btn_overlap_id.jpg" alt="아이디 중복확인"></a>
						(영문소문자/숫자, 4~16자)</td>
				</tr>
				<tr>
					<th scope="row">비밀번호</th>
					<td><input id="user_pw" name="user_pw" onchange="check_pw()"
						fw-filter="isFill&amp;isMin[4]&amp;isMax[16]" fw-label="비밀번호"
						fw-msg="" autocomplete="off" maxlength="16" 0="disabled" value=""
						type="password"> (영문 대소문자/숫자 4자~16자)</td>
				</tr>
				<tr>
					<th scope="row">비밀번호 확인</th>
					<td><input id="user_pw_confirm" name="user_pw_confirm" onchange="check_pw()"
						fw-filter="isFill&amp;isMatch[passwd]" fw-label="비밀번호 확인"
						fw-msg="비밀번호가 일치하지 않습니다." autocomplete="off" maxlength="16"
						0="disabled" value="" type="password">&nbsp;<span id="check"></span></td>
				</tr>

				<tr>
					<th scope="row" id="nameTitle">이름</th>
					<td><span id="nameContents"><input type="text"
							name="user_name" id="user_name" maxlength="20"></span> <span
						id="under14Msg" class="displaynone">14세 미만 사용자는 법정대리인 동의가
							필요합니다.</span></td>
				</tr>
				<tr>
					<th scope="row">주소</th>
					<td>
					<input type="text" name="user_zipcode"
						id="sample4_postcode" placeholder="우편번호"> 
						<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
						<input type="text" name="user_roadAddress" id="sample4_roadAddress" placeholder="도로명주소"> 
						<input type="text" name="user_jibunAddress" id="sample4_jibunAddress" placeholder="지번주소"> 
						<span id="guide" style="color: #999; display: none"></span> 
						<input type="text" name="user_namujiAddress" id="sample4_detailAddress" placeholder="상세주소">
						</td>
					</tr>
						
				<tr class="">
					<th scope="row">생년월일</th>
					<td><input id="user_birthY" name="user_birthY"
						class="inputTypeText" placeholder="" maxlength="4" value=""
						type="text"> 년 <input id="user_birthM" name="user_birthM"
						class="inputTypeText" placeholder="" maxlength="2" value=""
						type="text"> 월 <input id="user_birthD" name="user_birthD"
						class="inputTypeText" placeholder="" maxlength="2" value=""
						type="text"> 일</td>

				</tr>
				<tr>
					<th scope="row">휴대전화</th>
					<td><select id="user_hp1" name="user_hp1"
						fw-filter="isNumber&amp;isFill" fw-label="휴대전화" fw-alone="N"
						fw-msg="">
							<option value="010">010</option>
							<option value="011">011</option>
							<option value="016">016</option>
							<option value="017">017</option>
							<option value="018">018</option>
							<option value="019">019</option>
					</select>-<input id="user_hp2" name="user_hp2" maxlength="4"
						fw-filter="isNumber&amp;isFill" fw-label="휴대전화" fw-alone="N"
						fw-msg="" value="" type="text">-<input id="user_hp3"
						name="user_hp3" maxlength="4" fw-filter="isNumber&amp;isFill"
						fw-label="휴대전화" fw-alone="N" fw-msg="" value="" type="text"></td>
				</tr>
				<tr class="">
					<th scope="row">SMS 수신여부</th>
					<td><input id="is_sms0" name="is_sms" fw-label="is_sms"
						fw-msg="" class="ec-base-chk" value="T" type="checkbox"><label
						for="is_sms0">동의함</label>
						<p>쇼핑몰에서 제공하는 유익한 이벤트 소식을 SMS로 받으실 수 있습니다.</p></td>
				</tr>
				<tr>
					<th scope="row">이메일</th>
					<td><input id="user_email" name="user_email"
						fw-filter="isFill&amp;isEmail" fw-label="이메일" fw-alone="N"
						fw-msg="" value="" type="text"> <input id="is_news_mail0"
						name="is_news_mail" fw-label="is_news_mail" fw-msg=""
						class="ec-base-chk" value="T" type="checkbox"><label
						for="is_news_mail0">동의함</label> <br> <span id="emailMsg"></span></td>
				</tr>
			</table>
				<button id="joinBtn" class="btn btn-outline-success btn-lg" style="float: right"></button>		
		</div>
	</div>
</form>
</main>
<div class="modal" tabindex="-1" id="board_modal">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">Alert</h5>
				<button type="button" class="btn-close" data-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body" id="board_modal_body">
				<p>Modal body text goes here.</p>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" data-dismiss="modal"
					id="btn2">Remove</button>
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
$(document).ready(function() {
	var actionForm = $("#actionForm");
	
	$('#btn1').click(function(e) {
		e.preventDefault();
		$('#board_modal_body').html("join?")
		$('#board_modal').modal("show");
	});

	$('#btn2').click(function(e) {
		actionForm.attr("action", "/board/remove").attr("method", "post");
		actionForm.submit();
	});
	
}
</script>
<%@ include file="../includes/f2.jsp"%>