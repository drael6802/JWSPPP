/**
 * 
 */

/* 페이지 로딩 후  */
$(document).ready(function(){
	
	
	//카트 리스트 수량변경
	$(document).on('change' ,'.itemCount' , function(){
		var itemPrice = $(this).attr('data-itemPrice');
		var itemCount = $(this).val();
		var itemPrice = $(this).parent().next().next().children().eq(0).text(itemPrice * itemCount);
	});
	
	var totalPriceAll = 0;
	$('.afterPrice').each(function(index, element){
		totalPriceAll += $(element).text() * 1;
	});
	$('#totalPrice').text(totalPriceAll + '원');
	
	$(document).on('change' , function(){
		 totalPriceAll = 0;
		$('.afterPrice').each(function(index, element){
			totalPriceAll += $(element).text() * 1;
		});
		$('#totalPrice').text(totalPriceAll + '원');
	});
	
	//변경 버튼 클릭시에
	$(document).on('click', '.countUpateBtn' , function(){
		var itemCount = $(this).prev().val();
		var cartCode = $(this).attr('data-cartCode');
		var userId = $(this).attr('data-userId');
		alert('변경합니다.'	);
		$.ajax({
			url: 'cartCountUpate.do',
			type: 'post',
			data: {itemCount , cartCode ,userId },
			success: function(result) {
				if (result != 0) {
					alert('변경 되었습니다.');
					location.reload();
				}else {
					alert('변경 실패되었습니다.');
				}
			},
			error: function(){
				alert('fail');
			}
		});	
		
		
	});	
	
	//카트 리스트 All 체크 
	$('#cartDIV').button('dispose');
	$('#checkAll').on('click', function(){
		var isChecked = $('#checkAll').is(':checked');
		if(isChecked){
			$('.ckBox').prop('checked' , true);
		}
		else{
			$('.ckBox').prop('checked' , false);			
		}
	});
	
	//
	$(document).on('click', '.ckBox' ,function(){
		var ckBoxLength = $('.ckBox:checked').length;
		var ckBoxMaxLength = $('.ckBox').length;
		if (ckBoxLength == 0) {
			$('#checkAll').prop('checked' , false);			
		}else if (ckBoxLength == ckBoxMaxLength) {
			$('#checkAll').prop('checked' , true);
		}
	});
	
	// 체크 목록 삭제 
	$(document).on('click', '#ckDelBtn' ,function(){
		var cartCodeList = '';
		
		if ($('.ckBox:checked').length != 0) {
			$('.ckBox:checked').each(function(index , element){
				cartCodeList += $(element).attr('data-cartCode') + ',';
			});	
			$.ajax({
				url: 'cartDel.do',
				type: 'post',
				data: {cartCodeList},
				success: function(result) {
					if (result != 0) {
						alert('삭제 되었습니다.');
						location.reload();
					}else {
						alert('삭제 실패되었습니다.');
					}
				},
				error: function(){
					alert('fail');
				}
			});	
		}else{
			alert('삭제할 목록을 체크해주세요.');
		}
	});
	
	//체크 리스트 구매 
	$(document).on('click', '#buyBtn' ,function(){
		var cartCodeList = '';
		var itemCodeList = '';
		if ($('.ckBox:checked').length != 0) {
			$('.ckBox:checked').each(function(index , element){
				cartCodeList += $(element).attr('data-cartCode') + ',';
				itemCodeList += $(element).attr('data-itemCode') + ',';
				//alert(cartCodeList +'\n'+ itemCodeList);
			});	
			
			$.ajax({
				url: 'buyListInsert.do',
				type: 'post',
				data: {cartCodeList , itemCodeList},
				success: function(result) {
					if (result != 0) {
						alert('구매 되었습니다.');
						location.reload();
					}else {
						alert('구매 실패되었습니다.');
					}
				},
				error: function(){
					alert('fail');
				}
			});
		}else{
			alert('구매할 목록을 체크해주세요.');
		}
	});
});