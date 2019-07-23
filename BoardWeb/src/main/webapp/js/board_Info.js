/*

*/

/* 페이지 로딩 후  */
$(document).ready(function(){
	$('#updateBtn').on('click', function(){
		var writer = $('#writerInfo').text();
		$("#writerInfo").children().eq(0).remove();
		$("#writerInfo").html('<input class="btn btn-dark" id="writer" name="writer" type="text" value="" readonly />');
		$('#writer').val(writer);
		
		var title = $('#titleInfo').text();
		$("#titleInfo").children().eq(0).remove();
		$("#titleInfo").html('<input class="btn btn-dark" id="title" name="title" type="text" value="" />');
		$('#title').val(title);
		
		var content = $('#contentInfo').text();
		$("#contentInfo").children().eq(0).remove();
		$("#contentInfo").html('<input class="btn btn-dark" id="content" name="content" type="text" value="" />');
		$('#content').val(content);
		
		$("#Btn").children().eq(0).remove();
		$("#Btn").children().eq(1).remove();
		$("#Btn").html('<button class="btn btn-dark" id="updateFormBtn" >확인</button>');
		
		/*alert('변경합니다.');*/
	});			
});

