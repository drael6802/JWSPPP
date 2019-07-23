/**
 * 
 */
$(document).ready(function(){
	//탭 메뉴 
	$(function() {
		$("#tabs").tabs();
	});
	
	//모달 창 열기
	$(function() {
		$("#dialog").dialog({
			height : "auto",
			width : "auto",
			autoOpen : false,
			show : {
				effect : "bounce",
				duration : 10
			},
			hide : {
				effect : "bounce",
				duration : 10
			}
		});

		$("#opener").on("click", function() {
			$("#dialog").dialog("open");
		});
	});
	
	//아이디 찾기 프로세스
	$(document).on('click', '#findIdBtn', function(){
		var userEmail = $('#userEmail').val();
		if (userEmail != null && userEmail != '' ) {
			$.ajax({
				url: 'idFindProc.do',
				type: 'post',
				data: {userEmail },
				success: function(result) {
					if (result.userEmail != null) {
						$('#findFromDIV').empty();   
						var str = '';
						str += '<label>'+ result.userEmail +'</label><br>';
						str += '<label>'+ result.userId +'</label><br>';
						str += '<label>'+ result.userPassword +'</label><br>';
						$('#findFromDIV').append(str); 
					}else {
						alert('일치하는 이메일이없습니다.');
					}
				},
				error: function(){
					alert('fail');
				}
			});
		}else {
			alert('이메일일 입력해주세요');
		}
	});
	
});