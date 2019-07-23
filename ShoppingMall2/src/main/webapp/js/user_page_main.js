/**
 * 
 */

$(document).ready(function(){
	//관심상품 삭제
	$(document).on('click', '.likeDelBtn' ,function(){
		var itemCode = $(this).attr('data-itemCode');
		
		$.ajax({
			url: 'insertLike.do',
			type: 'post',
			data: {itemCode},
			success: function(result) {
				location.reload();
			},
			error: function(){
				alert('fail');
			}
		});
	});
});