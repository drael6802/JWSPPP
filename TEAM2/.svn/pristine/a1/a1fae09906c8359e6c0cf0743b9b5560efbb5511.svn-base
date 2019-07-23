/* 페이지 로딩 후  */
$(document).ready(function() {
	
	
	$(document).on('click', '#updateNoticeBtn' , function() {
		var boardTitle = $('#updateBoardTitle').val();
		var boardContent = $('#updateBoardContent').val();
		var boardCode =  $('#updateBoardCode').val();
		$.ajax({
			url: 'updateNotice.do',
			type: 'post',
			data: {boardTitle , boardContent , boardCode },
			success: function(result) {
				if (result != 0) {
					location.reload();
				} else {
					alert('수정 실패');
				}
			},
			error: function(){
				alert('fail');
			}
		});
	});
	
	//모달 창
	$(function() {
		$( "#dialog" ).dialog({
			height : "300",
			width : "400",
			autoOpen: false,
      		draggable: false,
      		show: {
        		effect: "fade",
      	 		duration: 100
      		},
      		hide: {
        		effect: "fade",
        		duration: 100
      		}
	});
		$( "#dialogInsert" ).dialog({
			height : "300",
			width : "400",
			autoOpen: false,
			draggable: false,
			show: {
				effect: "fade",
				duration: 100
			},
			hide: {
				effect: "fade",
				duration: 100
			}
		});
		$( "#dialogInquiry" ).dialog({
			height : "300",
			width : "400",
			autoOpen: false,
			draggable: false,
			show: {
				effect: "fade",
				duration: 100
			},
			hide: {
				effect: "fade",
				duration: 100
			}
		});

		$(".opener").on("click", function() {
			$("#dialog").dialog("open");
			var boardTitle = $(this).text();
			var boardContent = $(this).attr('data-boardContent');
			var boardCode = $(this).attr('data-boardCode');
			$('#updateBoardTitle').val(boardTitle);
			$('#updateBoardContent').val(boardContent);
			$('#updateBoardCode').val(boardCode);
		});
		
		 $( '.inquiryOpener' ).on( "click", function() {
			$('#dialogInquiry' ).dialog( "open" );
			
			var boardTitle = $(this).attr('data-boardTitle');
			var boardContent = $(this).attr('data-boardContent');
			var boardCode = $(this).attr('data-boardCode');
			var boardReply = $(this).attr('data-boardReply');
			$('#inquiryBoardTitle').val(boardTitle);
			$('#inquiryBoardContent').val(boardContent);
			$('#inquiryBoardCode').val(boardCode);
			$('#inquiryBoardReply').val(boardReply);
				
		    });
	});
	
	// 체크박스 : #checkAll 선택 시 체크박스 모두 선택
	$(document).on('click', '#checkAll', function() {
		var isChecked = $('#checkAll').is(':checked');
		$('.cbBox').prop('checked', isChecked);
	});
	
	// 공지사항 삭제
	$(document).on('click', '#deleteBtn', function() {
	    if(confirm('삭제하시겠습니까?')){ 

		var boardCode = '';

		if ($('.cbBox:checked').length == 0) {
			alert('삭제 할 공지사항을 선택하세요.');
		} else {
			$('.cbBox:checked').each(function(index, element){
				boardCode += $(element).val() + ',';
			});
		}
	    	
		$.ajax({
			//데이터에 있는 값들을 url로 같이 들고간다.
			url : 'noticeBoardDelete.do',
			type : 'post',
			data : {
				'boardCodes' : boardCode
			},
			success : function(result) {
				if (result) {
					alert('삭제가 완료되었습니다.');
					location.reload();
				}
			},
			error : function() {
				alert('삭제실패');
			}
		});
	    }
	});
	
	// 답변등록
	$(document).on('click', '#inquiryBtn', function() {
		if(confirm('등록하시겠습니까?')){
			
			var boardCode = $('#inquiryBoardCode').val();
			var boardReply = $('#inquiryBoardReply').val();
						
			$.ajax({
				//데이터에 있는 값들을 url로 같이 들고간다.
				url : 'inquiryInsert.do',
				type : 'post',
				data : {
					'boardCode' : boardCode,
					'boardReply' : boardReply
				},
				success : function(result) {
					if (result != 0) {
						alert('등록이 완료되었습니다.');
						location.reload();
					} else {
						alert('등록실패');
					}
				},
				error : function() {
					alert('등록실패');
				}
			});
		}
	});

});