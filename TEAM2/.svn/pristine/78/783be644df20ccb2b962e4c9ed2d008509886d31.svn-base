/**
 * 
 */

 $(document).ready(function(){	 
	 var userId = $('#userId').val();
	 var itemCode = $('#itemCode').val();
	 	 
	 //바로구매
	 $(document).on('click', '#buyBtn' ,function(){
		 var optionsArray = '';
		 var cartNumberCountArray = '';
		 var itemPriceCartArray = '';

		 var itemName = $('#itemName').text();
		 var itemThumbnail = $('#itemThumbnail').attr('data-itemThumbnail');
		 var userId = $('#userId').val();
		 var itemDiscount = $('#itemDiscount').text();
		 var itemInventory = $('#itemInventory').val();
		 
		 $('.cartDIV').each(function(index , element){
			 optionsArray += $(element).attr('data-cartDIV') + ',';
		 });
		 $('.cartNumber').each(function(index , element){
			 cartNumberCountArray += $(element).val() + ',';
		 });
		 $('.itemPriceCart').each(function(index , element){
			 itemPriceCartArray += $(element).text() + ',';
		 });
		 
		 var cartDivSize = $('.cartDIV').size();
		 
		 if (userId != '') {
			 if (cartDivSize != 0) {
				 $.ajax({
						url: 'baroBuy.do',
						type: 'post',
						data: { optionsArray ,cartNumberCountArray ,itemPriceCartArray , itemCode , itemThumbnail , itemDiscount , itemName , userId ,itemInventory},
						success: function(result) {
								alert('구매 되었습니다.');
							location.reload();
						},
						error: function(){
							alert('fail');
						}
					});
				
		 	}else {
		 		alert('옵션을 선택해 주세요.');
		 	}
		} else {
			alert('로그인이 필요 한 기능 입니다.');

		}
	 });
	 //
	 
	 
	 //좋아요 클릭
	 $(document).on('click', '#likeBtn' ,function(){
		 if (userId != '') {
			 $.ajax({
					url: 'insertLike.do',
					type: 'post',
					data: {userId , itemCode},
					success: function(result) {
						var likeState = result.likeState;
						if (likeState == 'Y') {
							$("input:checkbox[id='likeBtn']").prop("checked", true); 
						} else if(likeState == 'N') {
							$("input:checkbox[id='likeBtn']").prop("checked", false); 
						}
					},
					error: function(){
						alert('fail = 좋아요');
					}
				});
		} else {
			alert('로그인이 필요합니다.');
			$("input:checkbox[id='likeBtn']").prop("checked", false); 

		}
	 });
	 
	 //좋아요 페이지 실행시
	 if (userId != '') {
		 $.ajax({
				url: 'selectLike.do',
				type: 'post',
				data: {userId , itemCode},
				success: function(result) {
					 if (result.likeState == 'Y' ) {
						 $("input:checkbox[id='likeBtn']").prop("checked", true); 
						} 
				},
				error: function(){
					alert('fail');
				}
			});
	 }
	
	 
	 //카테고리 옵션 읽기
	 var category03Code  = $('#itemcategory03Code').val();
	 $.ajax({
			url: 'categoryAllList.do',
			type: 'post',
			data: {category03Code},
			success: function(result) {
				var str = '';
				str += '<a href="itemMenuCategory.do?categoryCode=' + result.categoryCode + ' " >' + result.categoryName + '</a> &gt; ' ;
				str += '<a href="itemMenuCategory.do?category02Code=' + result.category02Code + ' " >' + result.category02Name + '</a> &gt; ' ;
				str += '<a href="itemMenuCategory.do?category03Code=' + result.category03Code + ' " >' + result.category03Name + '</a>' ;
				$('#categoryMenu').append(str);	
			},
			error: function(){
				alert('categoryAllList=fail');
			}
		});
	 
	 //아이템 가격 적용
	 var itemPrice = $('#itemPrice').text();
	 var itemDiscount = $('#itemDiscount').text();
	 var itemDiscountPrice =  $('#itemDiscountPrice').text(itemPrice - (itemPrice * itemDiscount /100));
	 
	 //아이템 장바구니 인서트
		 $(document).on('click' , '#cartBtn' ,function(){
			 var optionsArray = '';
			 var cartNumberCountArray = '';
			 var itemPriceCartArray = '';

			 var itemName = $('#itemName').text();
			 var itemThumbnail = $('#itemThumbnail').attr('data-itemThumbnail');
			 var userId = $('#userId').val();
			 var itemDiscount = $('#itemDiscount').text();
			 var itemInventory = $('#itemInventory').val();
			 
			 
			 $('.cartDIV').each(function(index , element){
				 optionsArray += $(element).attr('data-cartDIV') + ',';
			 });
			 
			 $('.cartNumber').each(function(index , element){
				 cartNumberCountArray += $(element).val() + ',';
			 });
			 
			 $('.itemPriceCart').each(function(index , element){
				 itemPriceCartArray += $(element).text() + ',';
			 });
			 
			 var cartDivSize = $('.cartDIV').size();
			 //
			 if (userId != '' ) {
				 if (cartDivSize != 0) {
					 $.ajax({
							url: 'cartInsert.do',
							type: 'post',
							data: { optionsArray ,cartNumberCountArray ,itemPriceCartArray , itemCode , itemThumbnail , itemDiscount , itemName , userId ,itemInventory},
							success: function(result) {
								var isReg = confirm('카트에 보관 되었습니다. 확인 하겠습니까?.')
								if(isReg){
									location.href='cartList.do?userId='+ userId +'';
								}else{
									location.reload();
								}
							},
							error: function(){
								alert('fail');
							}
						});
				}else {
					alert('옵션을 선택해 주세요.');
				}
				 
			} else {
				alert('로그인이 필요 한 기능 입니다.');

			}
			 
			 //

		 });
		 
		 //옵션 추가 후 
		 $(document).on('change', '#optionSelect' ,function(){
			 var itemName = $('#itemName').text();
			 var itemDiscountPrice = $('#itemDiscountPrice').text();
			 var itemInventory = $('#itemInventory').val();
			 var optionSelect = $('#optionSelect :checked').val();
			 var cartDIVLength = $(".cartDIV").length;
			 if (optionSelect != '선택') {
				 
				 if ($('.cartDIV').attr('data-cartDIV') == optionSelect) {
					alert('이미 선택한 옵션입니다.');
				}else {
					var str= '';
					str += '<div align="center" class="cartDIV" id="cartDIV'+cartDIVLength+'" data-cartDIV="'+ optionSelect +'" style=" background-color: #fbfcf5; " >';
					str += '<div style="font-size: medium;" ><label id="cartItemName" class="cartItemName">'+ itemName +'</label> | <label>'+ optionSelect +'</label></div>';
					str += '<input type="number" class="cartNumber" id="cartNumberCount" name="" value="1" min="1" max="'+ itemInventory +'"/>';
					str += '<label class="itemPriceCart" id="cartItemPrice">'+ itemDiscountPrice +'</label> ';
					str += '<label class="cartDelBtn" >X</label> ';
					str += '<div>';
					$('#finalSelect').append(str);
				}
			 }
		 });
		 
		 //옵션 삭제 버튼
		 $(document).on('click','.cartDelBtn', function(){
			 $(this).parent().remove();
		 });
		 
		 //옵션카트 생성 후 수량 조작시
		 $(document).on('click','.cartNumber', function(){
			var cartNumber = $(this).val();
			var itemDiscountPrice = $('#itemDiscountPrice').text();
			$(this).next().text(cartNumber * itemDiscountPrice );
		 });	 		 
		 
 });