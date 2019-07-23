/**
 * 
 * 	 $.ajax({
			url: '',
			type: 'post',
			data: {},
			success: function(result) {
		             
			},
			error: function(){
				alert('fail');
			}
		});
 * 
 */

 $(document).ready(function(){
	 
	 //첫번째 카테고리 클릭시에 
	  $(document).on('click' ,'.categoryBtn',function(){
		  var categoryCode = $(this).attr('data-categoryCode');
		  var categoryThis = $(this)
		  $('#category02DIV').empty();
		  $('#category03DIV').empty();
		  var table = $('table').size();
		  if (table < 3) {
			  
			  $.ajax({
					url : 'category02.do',
					type : 'post',
					data : {categoryCode},
					success : function(result) {
						var str = '';
						str += '<table border="1">';
						$.each(result, function(index, element){	
							str += '<tr><td>';
							str += '<div id="input" class="category02Btn" data-category02Code="' + element.category02Code +'" >'+ element.category02Name  +'</div>';
							str += '</td></tr>';
						});
						str += '<tr><td><input type="button" id="insertBtn2" value="추가" /></td></tr>';
						str += '</table>';
						$('#category02DIV').append(str);
					},
					error : function() {
						alert('fail');
					}
				});
		  }
	  });
	  //두번쨰 카테고리 클릭시에
	  $(document).on('click' , '.category02Btn',function(){
		  var category02Code = $(this).attr('data-category02Code');
		  var categoryThis = $(this)
		  $('#category03DIV').empty();
		  var table = $('table').size();
		  if (table < 4) {
			  
			  $.ajax({
					url : 'category03.do',
					type : 'post',
					data : {category02Code},
					success : function(result) {
						var str = '';
						str += '<table border="1">';
						$.each(result, function(index, element){	
							str += '<tr><td>';
							str += '<div id="input" class="category03Btn" data-category03Code="' + element.category03Code +'" >'+ element.category03Name  +'</div>';
							str += '</td></tr>';
						});
						str += '<tr><td><input type="button" id="insertBtn3" value="추가" /></td></tr>';
						str += '</table>';
						$('#category03DIV').append(str);
					},
					error : function() {
						alert('fail');
					}
				});
		  }
	  });
	  
	  //추가 버튼1 누루면 
	  $(document).on('click' , '#insertBtn' ,function(){
		  var categoryInsertBtnSize = $('#categoryInsertBtn1').size();
		  if (categoryInsertBtnSize < 1) {
			  $(this).parent().parent().parent().append('<tr><td><input type="test" id=""  /><input type="button" class="" id="categoryInsertBtn1" value="등록"  /></td></tr>');
		}
		  
	  });
	  //추가 버튼2 누루면 
	  $(document).on('click' , '#insertBtn2' ,function(){
		  var categoryInsertBtnSize = $('#categoryInsertBtn2').size();
		  if (categoryInsertBtnSize < 1) {
			  $(this).parent().parent().parent().append('<tr><td><input type="test" id=""  /><input type="button" class="" id="categoryInsertBtn2" value="등록"  /></td></tr>');
		  }
		  
	  });
	  //추가 버튼3 누루면 
	  $(document).on('click' , '#insertBtn3' ,function(){
		  var categoryInsertBtnSize = $('#categoryInsertBtn3').size();
		  if (categoryInsertBtnSize < 1) {
			  $(this).parent().parent().parent().append('<tr><td><input type="test" id=""  /><input type="button" class="" id="categoryInsertBtn3" value="등록"  /></td></tr>');
		  }
		  
	  });
	  
	  //등록 버튼1 누루면 
	  $(document).on('click' , '#categoryInsertBtn1' ,function(){
		  var newCategoryName =   $(this).prev().val();
		  $.ajax({
				url: '',
				type: 'post',
				data: {},
				success: function(result) {
			             
				},
				error: function(){
					alert('fail');
				}
			});
		  
	  });
	  //등록 버튼1 누루면 
	  $(document).on('click' , '#categoryInsertBtn2' ,function(){
		  var newCategoryName =   $(this).prev().val();
		  $.ajax({
				url: '',
				type: 'post',
				data: {},
				success: function(result) {
			             
				},
				error: function(){
					alert('fail');
				}
			});
	  });
	  //등록 버튼1 누루면 
	  $(document).on('click' , '#categoryInsertBtn3' ,function(){
		  var newCategoryName =   $(this).prev().val();
		  $.ajax({
				url: '',
				type: 'post',
				data: {},
				success: function(result) {
			             
				},
				error: function(){
					alert('fail');
				}
			});
	  });
 });