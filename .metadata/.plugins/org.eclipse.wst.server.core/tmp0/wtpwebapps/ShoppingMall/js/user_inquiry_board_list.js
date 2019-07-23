/* 페이지 로딩 후  */
$(document).ready(function() {
	
	//모달 창
	$(function() {
		$( "#updateDialog" ).dialog({
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
		$( "#viewDialog" ).dialog({
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

		$(".updateOpener").on("click", function() {
			$("#updateDialog").dialog("open");
			var boardTitle = $(this).attr('data-boardTitle');
			var boardContent = $(this).attr('data-boardContent');
			var boardCode = $(this).attr('data-boardCode');
			$('#updateBoardTitle').val(boardTitle);
			$('#updateBoardContent').val(boardContent);
			$('#updateBoardCode').val(boardCode);
		});
		
		 $( '.viewOpener' ).on( "click", function() {
			$('#viewDialog' ).dialog( "open" );						
			var boardTitle = $(this).attr('data-boardTitle');
			var boardContent = $(this).attr('data-boardContent');
			var boardCode = $(this).attr('data-boardCode');
			var boardReply = $(this).attr('data-boardReply');
			$('#viewBoardTitle').val(boardTitle);
			$('#viewBoardContent').val(boardContent);
			$('#viewBoardCode').val(boardCode);
			$('#viewBoardReply').val(boardReply);			
		});
	});
	
	// 체크박스 : #checkAll 선택 시 체크박스 모두 선택
	$(document).on('click', '#checkAll', function() {
		var isChecked = $('#checkAll').is(':checked');
		$('.cbBox').prop('checked', isChecked);
	});	
	
	//
	$(document).on('click', '.cbBox' ,function(){
		var ckBoxLength = $('.cbBox:checked').length;
		var ckBoxMaxLength = $('.cbBox').length;
		
		if (ckBoxLength == 0) {
			$('#checkAll').prop('checked' , false);         
		}else if (ckBoxLength == ckBoxMaxLength) {
			$('#checkAll').prop('checked' , true);
		}
		
	});

	// 삭제
	$(document).on('click', '#deleteBtn', function() {
	    if(confirm('삭제하시겠습니까?')){ 

		var boardCode = '';

		if ($('.cbBox:checked').length == 0) {
			alert('삭제 할 문의사항을 선택하세요.');
		} else {
			$('.cbBox:checked').each(function(index, element){
				boardCode += $(element).val() + ','; 
			});
		}
	    	
		$.ajax({
			//데이터에 있는 값들을 url로 같이 들고간다.
			url : 'deleteQuestion.do',
			type : 'post',
			data : {
				'boardCodes' : boardCode
			},
			success : function(result) {
				if (result != 0) {
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
	$(document).on('click', '#updateBtn', function() {
		if(confirm('수정하시겠습니까?')){
			
			var boardCode = $('#updateBoardCode').val();
			var boardTitle = $('#updateBoardTitle').val();
			var boardContent = $('#updateBoardContent').val();
						
			$.ajax({
				//데이터에 있는 값들을 url로 같이 들고간다.
				url : 'updateQuestion.do',
				type : 'post',
				data : {
					'boardCode' : boardCode,
					'boardTitle' : boardTitle,
					'boardContent' : boardContent
				},
				success : function(result) {
					if (result != 0) {
						alert('수정이 완료되었습니다.');
						location.reload();
					} else {
						alert('수정실패');
					}
				},
				error : function() {
					alert('수정실패');
				}
			});
		}
	});

});