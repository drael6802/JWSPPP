/**
 * 
 */

 $(document).ready(function(){
	 
	 //썸네일 미리보기
     var sel_file;
     $(document).ready(function() {
         $("#itemThumbnail").on("change", handleImgFileSelect);
     }); 
     function handleImgFileSelect(e) {
         var files = e.target.files;
         var filesArr = Array.prototype.slice.call(files);
         filesArr.forEach(function(f) {
             if(!f.type.match("image.*")) {
                 alert("확장자는 이미지 확장자만 가능합니다.");
                 return;
             }
             sel_file = f;
             var reader = new FileReader();
             reader.onload = function(e) {
                 $("#PreviewImg").attr("src", e.target.result);
             }
             reader.readAsDataURL(f);
         });
     }
	 
	 //옵션 추가 버튼
	 $(document).on("click", "#optionBtn", function(){
		 var num = $(".optionName").length;
		 if(num<5){
			var str= '';
		 	str += '<div class="optionDIV"><input type="text" class="optionName" id="options0'+ ($('.optionName').length+1) +'" name="options0'+ ($('.optionName').length+1) +'" style="width: 60%;" /><input type="button" class="optionBtn" value="삭제" /><div>';
		 	$('#optionDIV').append(str);
		 }else {
			 alert('싫어');
		 }
	 });
	 
	 //옵션 삭제 버튼
	 $(document).on('click','.optionBtn', function(){
		 $(this).parent().remove();
	 });
	 
	 //카테고리 셀렉트 박스 2  Change
	 $(document).on("change", "#categorySelectBox", function(){
		 var categorySelectBox = $('#categorySelectBox').val();
		 $('#category02SelectBox').empty();
		 if (categorySelectBox != '카테고리') {
			
			
			 var categoryCode = $('#categorySelectBox option:selected').attr('id');
			 $.ajax({
					url: 'category02.do',
					type: 'post',
					data: {categoryCode},
					success: function(result) {
						var str= '';
						str += '<option id="">카테고리2</option>';
						$.each(result, function(index, element){	       	
							str += '<option id="'+ result[index].category02Code +'" name="'+ result[index].category02Name +'">'+ result[index].category02Name +'</option>';
						});
						$('#category02SelectBox').append(str);
					},
					error: function(){
						alert('fail');
					}
			});
		 }else{
			 	var str = '';
			 	str += '<option id="">카테고리2</option>';
			 	$('#category02SelectBox').append(str);
			 	
			 	$('#category03SelectBox').empty();
				var str2 = '';
				str2 += '<option id="">카테고리3</option>';
				$('#category03SelectBox').append(str2);
		 }
	 });
	 //카테고리 셀렉트 박스 3  Change	 
	 $(document).on("change", "#category02SelectBox", function(){
		 var category02SelectBox = $('#category02SelectBox').val();
		 $('#category03SelectBox').empty();
		
		 if (category02SelectBox == '카테고리2') {
				$('#category03SelectBox').empty();
				
				var str2 = '';
				str2 += '<option id="">카테고리3</option>';
				$('#category03SelectBox').append(str2);
				
		 }else if($('#category03SelectBox').val() == undefined ) {
			 var category02Code = $('#category02SelectBox option:selected').attr('id');
			 $.ajax({
					url: 'category03.do',
					type: 'post',
					data: {category02Code},
					success: function(result) {
						var str= '';
						str += '<option id="">카테고리3</option>';
						$.each(result, function(index, element){	       	
							str += '<option id="'+ result[index].category03Code +'" name="'+ result[index].category03Code +'" >'+ result[index].category03Name +'</option>';
						});
						$('#category03SelectBox').append(str);  
						 
					},
					error: function(){
						alert('fail');
					}
			});
		}
	 });
	 
	 
	 //아이템 추가 버튼 작동
	 $(document).on('click','#submitBtn',function(){
		 var itemName = $('#itemName').val();
		 var itemPrice = $('#itemPrice').val();
		 var itemInventory = $('#itemInventory').val();
		 var itemImage = $('#itemImage').val();
		 var itemThumbnail = $('#itemThumbnail').val();
		 var itemDiscount = $('#itemDiscount').val();
		 var itemContent = $('#itemContent').val();
		 var category03Code = $('#category03SelectBox option:selected').attr('id');
		 var category02Code = $('#category02SelectBox option:selected').attr('id');
		 var categoryCode = $('#categorySelectBox option:selected').attr('id');
		 
		 var options01 = $('#options01').val();
		 var options02 = $('#options02').val();
		 var options03 = $('#options03').val();
		 var options04 = $('#options04').val();
		 var options05 = $('#options05').val();
		 
		 if(category03Code == null){
			 alert('분류를 선택하세요.');
		 }else {
			 var isReg = confirm('등록 하시겠습니까?.');
			 
			 if (isReg) {
				 $('#itemRegistrationForm').submit();
			}
		}
		
	 });
	 
 });