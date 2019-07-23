/* 페이지 로딩 후  */
$(document).ready(function() {
	
		$('.delBtn').on('click', function(){
			var itemCode =  $(this).attr('data-itemCode');
			location.href='deleteItem.do?itemCode='+itemCode+'';
	    }); 
		
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

		$(".opener").on("click", function() {
			var itemPrice = $(this).attr('data-itemPrice');
			var itemInventory = $(this).attr('data-itemInventory');
			var itemDiscount = $(this).attr('data-itemDiscount');
			var itemCode = $(this).attr('data-itemCode');
			var itemName = $(this).text();
			
			$('#itemName').text(itemName);
			$('#itemCode').val(itemCode);
			$('#itemPrice').val(itemPrice);
			$('#itemInventory').val(itemInventory);
			$('#itemDiscount').val(itemDiscount);
			$("#dialog").dialog("open");
			
		});
	});
		
	$("#updateBtn").on("click", function() {
		var itemPrice = $('#itemPrice').val();
		var itemInventory = $('#itemInventory').val();
		var itemDiscount = $('#itemDiscount').val();
		var itemCode = $('#itemCode').val();
		
		$.ajax({
			url: 'itemUpdate.do',
			type: 'post',
			data: {itemPrice ,itemInventory ,itemDiscount ,itemCode},
			success: function(result) {
				$( "#dialog" ).dialog( "close" );
				location.reload();
			},
			error: function(){
				alert('fail');
			}
		});
	});
});