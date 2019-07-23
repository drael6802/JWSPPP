<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>리뷰 모달창</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
	$( function() {
		
		
		$( "#dialog" ).dialog({
			height : "400",
			width : "600",
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
		
		
 
		$( ".opener" ).on( "click", function() {
			
			var idResult = $(this).attr('id');
			
			if (idResult == 'reviewInset') {
				
				var itemCode = $(this).attr('data-itemCode');
				var itemName = $(this).attr('data-itemName');
				var itemPrice = $(this).attr('data-itemPrice');			
				var options = $(this).attr('data-options');
				var itemCount = $(this).attr('data-itemCount');
				var itemThumbnail = $(this).attr('data-itemThumbnail');
				var buyCode = $(this).attr('data-buyCode');
				
				$('#buyCode').val(buyCode);
				$('#itemCode').val(itemCode);
				$('#itemName').text(itemName);
				$('#itemPrice').text(itemPrice + '원');
				$('#options').text(options);
				$('#itemCount').text(itemCount + '개');
				$('#itemThumbnail').prop( 'src' , '../img/'+ itemThumbnail +'' );
				
				$('#btnDiv').empty();
				var str = '';
				str += '<button id="reviewInsertBtn">등록</button>' ;
				$('#btnDiv').append(str);
				
				$( "#dialog" ).dialog( "open" );
				
			}else if (idResult == 'reviewUpdate') {
				
				var boardCode = $(this).attr('data-boardCode');
				var boardTitle = $(this).attr('data-boardTitle');
				var boardContent = $(this).attr('data-boardContent');
				var boardScore = $(this).attr('data-boardScore');
				var itemName = $(this).attr('data-itemName');
				
				$('#itemPrice').text('');
				$('#options').text('');
				$('#itemCount').text('');
				$('#itemThumbnail').prop('src' , '');
				$('#itemCode').val('');
				
				$('#'+boardScore+'').parent().children('span').removeClass('on');
				$('#'+boardScore+'').addClass('on').prevAll('span').addClass('on');
				$('input[value="'+ boardTitle +'"]').prop('checked' , true);
				$('#boardCode').val(boardCode);
				$('#boardContent').val(boardContent);
				$('#itemName').text(itemName);
				
				$('#btnDiv').empty();
				var str = '';
				str += '<button id="reviewUpdateBtn">수정</button>' ;
				$('#btnDiv').append(str);
				
				$( "#dialog" ).dialog( "open" );
				
				
			}
 		});
 	
		var star = 1;
	$('.starRev span').click(function(){
		  $(this).parent().children('span').removeClass('on');
		  $(this).addClass('on').prevAll('span').addClass('on');
		  star = $(this).attr('id');
		});
	
	//리뷰 인서트 버튼 작동
	$(document).on('click' , '#reviewInsertBtn' ,function(){
		var boardContent = $('#boardContent').val();
		var boardTitle =$('input[name="radio"]:checked').val();
		var itemCode = $('#itemCode').val();
		var buyCode = $('#buyCode').val();
		var boardScore = star;
		var boardCategoryCode = 3;
		
		if (boardContent != '') {
			
			$.ajax({
				url: 'boardInset.do',
				type: 'post',
				data: {boardContent , boardTitle , itemCode , boardScore , boardCategoryCode , buyCode},
				success: function(result) {
						$( "#dialog" ).dialog( "close" );
						location.reload();
				},
				error: function(){
					alert('fail');
				}
			});
			
		}else {
			alert('상품평을 입력해 주세요.');
		}
		
	});
	
	//리뷰 업데이트 버튼 작동
	$(document).on('click' , '#reviewUpdateBtn' ,function(){
		var boardContent = $('#boardContent').val();
		var boardTitle =$('input[name="radio"]:checked').val();
		var boardCode = $('#boardCode').val();
		var boardScore = $('.on').length;
		
		$.ajax({
			url: 'reviewUpdate.do',
			type: 'post',
			data: {boardContent ,boardTitle ,boardCode ,boardScore },
			success: function(result) {
				$( "#dialog" ).dialog( "close" );
				location.reload();
			},
			error: function(){
				alert('fail');
			}
		});
	});


} );
  </script>
  
<style type="text/css">

.starR{
  background: url('http://miuu227.godohosting.com/images/icon/ico_review.png') no-repeat right 0;
  background-size: auto 100%;
  width: 30px;
  height: 30px;
  display: inline-block;
  text-indent: -9999px;
  cursor: pointer;
}
.starR.on{background-position:0 0;}

</style>
</head>
<body>
 
<div align="center" id="dialog" title="상품 리뷰 쓰기">
	<div>
		<input type="hidden" id="itemCode">
		<input type="hidden" id="buyCode">
		<input type="hidden" id="boardCode">
		<img alt="" id="itemThumbnail" src="" style="width: 50px; height: 50px;">
		<label id="itemName"></label><br>
		<label id="itemPrice"></label> /
		<label id="itemCount"></label> /
		<label id="options"></label>
	</div>
	<div>
		<table>
			<tr>
				<td>
					상품
				</td>
				<td>
					<div align="center">
						<input type="radio" class="radioReview" id="radio1" name="radio" value="만족" checked><label for="radio1">만족</label>
						<input type="radio" class="radioReview" id="radio2" name="radio" value="보통"><label for="radio2" >보통</label>
						<input type="radio" class="radioReview" id="radio3" name="radio" value="불만"><label for="radio3" >불만</label>
					</div>
				</td>
			</tr>
			<tr>
				<td>만족도</td>
				<td>
					<div class="starRev">
					  <span class="starR on" id="1">별1</span>
					  <span class="starR" id="2">별2</span>
					  <span class="starR" id="3">별3</span>
					  <span class="starR" id="4">별4</span>
					  <span class="starR" id="5">별5</span>
					</div>
				</td>
			</tr>
			<tr>
				<td>상품평</td>
				<td><input type="text" id="boardContent"></td>
			</tr>
		</table><br>
		<div id="btnDiv">
			<button id="reviewInsertBtn">확인</button>
		</div>
	</div>
</div>
 
 
</body>
</html>