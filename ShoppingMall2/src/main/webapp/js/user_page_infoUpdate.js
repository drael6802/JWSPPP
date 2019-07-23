/**
 * 
 */
$(document).ready(function(){
	
	
	//
	var passwordCheck = 'N';
	$('#userUpdateBtn').on('click',function(){
		if (passwordCheck == 'Y') {
			var userPassword = $('#originUserPassword').val();
			$.ajax({
				url: 'PasswordCheck.do',
				type: 'post',
				data: {userPassword},
				success: function(result) {
					if (result == 0 ) {
						userPassword = $('#userPasswordCheck').val();
						$.ajax({
							url: 'PasswordUpdate.do',
							type: 'post',
							data: {userPassword},
							success: function(result) {
								alert('변경 완료');
								location.reload();
							},
							error: function(){
								alert('fail 변경 실패');
							}
						});
						
					}else {
						alert('비밀번호가 틀립니다.');
					}
				},
				error: function(){
					alert('fail');
				}
			});
		}else {
			alert('비밀번호 적어');
		}

	});
	
	
	$(function() {
		$("#dialog").dialog({
			autoOpen : false,
			height : "200",
			width : "300",
      		draggable: false,
			show : {
				effect : "blind",
				duration : 1000
			},
			hide : {
				effect : "explode",
				duration : 1000
			}
		});
	
		$("#opener").on("click", function() {
			$("#dialog").dialog("open");
		});
	});
	
	$(function() {
		$("#userDelDialog").dialog({
			autoOpen : false,
			height : "200",
			width : "300",
			draggable: false,
			show : {
				effect : "blind",
				duration : 1000
			},
			hide : {
				effect : "explode",
				duration : 1000
			}
		});
		
		$("#userDelBtnFrom").on("click", function() {
			$("#userDelDialog").dialog("open");
		});
	});
	
	//userDelDialog
	$("#userDelBtn").on("click", function() {
		var userPassword = $('#delPassword').val();
		if (userPassword != '') {
			$.ajax({
				url: 'userDel.do',
				type: 'post',
				data: {userPassword},
				success: function(result) {
						alert('회원 탈퇴 되었습니다.');
						location.href="index.jsp";
				},
				error: function(){
					alert('fail');
				}
			});
			
		} else {
			alert('비밀번호를 입력해주세요');
		}
		
		
	});
	
	// 주소변경
	$('#addressBtn').on( 'click ',function(){
		var userAddress  = $('#sample6_postcode').val();
		userAddress += ' '+ $('#sample6_address').val();
		userAddress += ' '+ $('#sample6_detailAddress').val();
		userAddress += ' '+ $('#sample6_extraAddress').val();

		$.ajax({
			url: 'addressUpdate.do',
			type: 'post',
			data: {userAddress},
			success: function(result) {
				$( "#dialog" ).dialog( "close" );
				location.reload();
			},
			error: function(){
				alert('fail');
			}
		});
		
		
	});
	
	//비밀번호 확인 
	$("#success").hide();
	$("#danger").hide();
	$("input").keyup(function(){

	var userPassword = $("#updatePassword").val();
	var userPasswordCheck = $("#userPasswordCheck").val();
	if(userPassword != "" || userPasswordCheck != ""){
		if(userPassword == userPasswordCheck){
			$("#success").show();
			$("#danger").hide();
			passwordCheck = 'Y';
		}else{
			$("#success").hide();
			$("#danger").show();
			passwordCheck = 'N';
		}
		if (userPassword == null || userPassword == '' || userPasswordCheck == null || userPasswordCheck == '') {
			$("#danger").hide();
			$("#success").hide();
		}
	}
		return passwordCheck;
	});
	

});
// 주소 카카오 api js
function sample6_execDaumPostcode() {
	new daum.Postcode({
		oncomplete: function(data) {
			// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

			// 각 주소의 노출 규칙에 따라 주소를 조합한다.
			// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
			var addr = ''; // 주소 변수
			var extraAddr = ''; // 참고항목 변수

			// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
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
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
		}
	}).open();
}