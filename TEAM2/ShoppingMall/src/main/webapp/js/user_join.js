/**
 * 
 */

	$(document).ready(function(){
		$(document).on('click ' , '#chcekBtn' , function(){
			location.href='userJoinSuccess.do';
		});
		
	//아이디 중복체크
	var idCheck = 'N';
	$(document).on('click ' , '#idCheckBtn' , function(){
		idCheck = userIdCheck();
	});
	//체크된 아이디 다시작성 버튼  reIdCheckBtn
	$(document).on('click' ,"#reIdCheckBtn" , function(){
		reIdCheck();
		idCheck = 'N'
	});
	//비밀번호 확인 
	var passwordCheck = 'N';
	$("#success").hide();
	$("#danger").hide();
	$("input").keyup(function(){
		passwordCheck = userPasswordCheck();
	});
	
/*	//전화번호 숫자키 입력
	$(document).on('.userPhone',"focus", function() {
	    var x = $(this).val();
	    x = removeCommas(x);
	    $('.userPhone').val(x);
	}).on("focusout", function() {
	    var x = $('.userPhone').val();
	    if(x && x.length > 0) {
	        if(!$.isNumeric(x)) {
	            x = x.replace(/[^0-9]/g,"");
	        }
	        //x = addCommas(x);
	        $('.userPhone').val(x);
	    }
	}).on("keyup", function() {
	    $('.userPhone').val($('.userPhone').val().replace(/[^0-9]/g,""));
	});*/
	
	//조인 버튼 누룰시 중복체크 확인
	$(document).on('click' ,"#joinBtn" , function(){
		var userId = $('#userId').val();
		var userPassword = $('#userPassword').val();
		var userName = $('#userName').val();
		var userAddress = '' ;
		var userAddressInfo =  '';
		var userBirth =  $('#userBirth').val();
		var userPhone =  $('#userPhone1').val();
		userPhone += '-' + $('#userPhone2').val();		
		userPhone += '-' + $('#userPhone3').val();		
		var userEmail = '';
		var userEmail1 = $('#userEmail1').val();
		
		if ($('#sample6_postcode').val() != '') {
			userAddress = $('#sample6_postcode').val() + ' ' + $('#sample6_address').val() + ' ' +$('#sample6_detailAddress').val() + ' ' +$('#sample6_extraAddress').val();
		}

		
		if ($('#userEmail1').val() != '') {
			var emailSelecter = $('#emailSelecter option:selected').text();
			if (emailSelecter == '직접입력') {
				userEmail = $('#userEmail1').val() + '@' + $('#userEmail2').val();
			}else {
				userEmail = $('#userEmail1').val() + '@' + emailSelecter;
			}
		}
		
		if ($('#userEmail1').val() != null || $('#userEmail1').val() != '') {
			
		}
		
		if(idCheck != 'Y'){
			alert('ID 중복체크 해주세요');
		}else if(passwordCheck != 'Y'){
			alert('PASSWORD를 확인 해주세요');
		}else if(userName == null || userName == ''){
			alert('이름을 입력 해주세요');
		}else if(userAddress == ''){
			alert('주소를 입력 해주세요');
		}else if($('#userPhone2').val() == '' || $('#userPhone3').val() == ''){
			alert('전화번호를 입력 해주세요');
		}else if(userEmail1 == ''){
			alert('이메일 입력 해주세요');
		}else{
			
			alert('폰번호 : '+userPhone);
			
			$.ajax({
				url: 'emailChcek.do',
				type: 'post',
				data: {userEmail},
				success: function(result) {
					if (result != 0) {
						
						var isBtn = false;
						if (isBtn == true) {
							alert('업로드중');
						} else if(isBtn == false) {
							$.ajax({
								url: 'userJoinProc.do',
								type: 'post',
								data: {userId , userPassword , userName , userAddress , userBirth , userPhone , userEmail},
								success: function(result) {
									if (result == 0 ) {
										alert('회원가입에 실패 하셧습니다.');
										isBtn = false;
									}else {
										alert('회원가입에 성공 하셧습니다');
										location.href='userJoinSuccess.do';
										isBtn = false;
									}
								},
								error: function(){
									alert('fail');
								}
							});
							
						}
						
					}else {
						alert('중복된 이메일 입니다.');
					}
				},
				error: function(){
					alert('fail 이메일');
				}
			});
			

		}
		
	});

	//이메일 선택
	$('#emailSelecter').on('change ', function(){
		var emailSelecter = $('#emailSelecter option:selected').text();
		if (emailSelecter == '직접입력') {
			$("#userEmail2").prop("disabled",false); 
		}
		else {
			$("#userEmail2").prop("disabled",true); 
		}
	});
	
});

//함수
/*(function($){
	test = function(){
	
	};
})(jQuery);*/

//아이디 중복체크
(function($){
	userIdCheck = function(){
		var idCheck = '';
		var userId = $('#userId').val();
		
		var pattern_num = /[0-9]/;	// 숫자 
    	var pattern_eng = /[a-zA-Z]/;	// 문자 
    	var pattern_spc = /[~!@#$%^&*()_+|<>?:{}]/; // 특수문자
    	var pattern_kor = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/; // 한글체크
		
		if(userId == null || userId == ''){
			alert('ID를 입력해주세요.');
			idCheck = '아이디를 입력을 리턴';
		}else if( (pattern_spc.test(userId)) || (pattern_kor.test(userId)) ){
			alert("영문과 숫자만 입력 가능합니다.")
		}else{
			 $.ajax({
				url: 'idCheck.do',
				type: 'post',
				data: {userId},
				async: false,
				success: function(result) {
					if(userId == result){
						alert('이미사용중인 ID 입니다.');
						idCheck = 'N';
					}else{
						var isReg = confirm(' 사용가능한 아이디 입니다. \n 등록하시겠습니까?')
						if(isReg){
							//alert('사용가능한 아이디 입니다.');
							$('#idContentDIV').empty();
							var str = '';
							str += '<input type="text" id="userId" name="userId" value="' + userId + '" readonly />';
							str += '<input type="button" id="reIdCheckBtn" name="" value="다시작성">';
							$('#idContentDIV').append(str);
							idCheck = 'Y';
						}
					}
				},
				error: function(){
					alert('이미사용중인 ID 입니다. \n e');
				}
			});
		}
		return idCheck;
	};
})(jQuery);

//체크된 아이디 다시작성 버튼  reIdCheckBtn
(function($){ 
	reIdCheck = function(){
		$('#idContentDIV').empty();
		var str = '';
		str += '<input type="text" id="userId" name="userId" required />'
		str += '<input type="button" id="idCheckBtn" name="" value="중복체크">'
		$('#idContentDIV').append(str);
		
	};
})(jQuery);

//비밀번호 확인 
(function($){
	userPasswordCheck = function(){
		var passwordCheck = '';
		var userPassword = $("#userPassword").val();
		var userPasswordCheck = $("#userPasswordCheck").val();
		if(userPassword != "" || userPasswordCheck != ""){
			if(userPassword == userPasswordCheck){
				$("#success").show();
				$("#danger").hide();
				$("#submit").removeAttr("disabled");
				passwordCheck = 'Y';
			}else{
				$("#success").hide();
				$("#danger").show();
				$("#submit").attr("disabled", "disabled");
				passwordCheck = 'N';
			}
			if (userPassword == null || userPassword == '' || userPasswordCheck == null || userPasswordCheck == '') {
				$("#danger").hide();
				$("#success").hide();
			}
		}
		return passwordCheck;
	};
})(jQuery);