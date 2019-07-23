/**
 * 
 */

$(document).ready(function(){

	$(document).on('click ' , '#Btn' , function(){
		var itemName = $('#itemName').val();
		var itemPrice = $('#itemPrice').val();
		var itemAmount = $('#itemAmount').val();
		
		$.ajax({
			url: '../itemProc.do',
			type: 'post',
			data: {itemName, itemPrice ,itemAmount },
			success: function(result) {
		    	if (result != 0) {
					alert('등록 되었습니다.');
					location.href = '../javatest.do';
				}
			},
			error: function(){
				alert('fail');
			}
		});
	    
	});
})