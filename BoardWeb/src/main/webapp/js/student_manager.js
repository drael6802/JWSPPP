/*$
  ('#a').val(),
		id 값이 'a' 인 태그의 value의 값을 가져 온다. 
		.val('aa'),
		id 값이 'a' 인 태그의 value의 값에 'aa'값을 삽입 한다. 		
		.attr('id'),
		'a' 태그의 id의 값을 가져온다. 				
		.attr('id' , 'aa')
		'a' 태그의 id의 값에 'aa'값을 삽입한다. 	

		.prev(); 선택자 이전 노드를 가르킨다.
		.before(''); 선택자 이전 노드에 ()을 삽입한다.
		.apter(); 선택자 앞 노드 다음에 에 ()을 삽입한다.
		.append(); 선택자의 맨위 자식노트에 ()을 삽입한다.
		.preaappend(); 선택자의 자식노드 사이에 ()을 삽입한다.
		.remove(); 선택자 포함 하위 태그를 모두 지운다.
		.empty(); 선택자 하위 태그만 모두 지운다.
 */

	//셀렉트 박스 클릭시 실행
$(document).ready(function(){
	
	$('#띵').on('click ', function(){
		alert('띵');
		$('#selectUserDiv').empty();
		selectStudentList();
	});
	
	$('#ClassSelecter').on('change ', function(){
		$('#selectUserDiv').empty();
		selectStudentList();
	});
	
	//학생 이름 클릭시
	$(document).on('click ', '.studentName' , function(){
		selectUserInfo($(this));
	});
	
	//학생 추가 인서트 프로세스
	$(document).on('click ', '#insertProcBtn' , function(){
		studentInsetProc();
	});
	
	//학생 추가 버튼 누루면
	$('#insertBtn').on('click ', function(){
		studentInset();
	});
	
	//전체 체크 박스 누루면 
//	$('#checkAll').on('click', function(){
//		var isChecked = $('#checkAll').is(':checked');
//		
//		if(isChecked){
//			$('.cbBox').prop('checked' , true);
//		}
//		else{
//			$('.cbBox').prop('checked' , false);			
//		}
//	});
	
	//전체 체크 박스 누루면 
	$(document).on('click', '#checkAll' , function(){
		var isChecked = $('#checkAll').is(':checked');
		//alert(isChecked);
		if(isChecked){
		$(document).prop('checked', '.cbBox' , true);
		$('.cbBox').prop('checked' , true);
		}else{
		$(document).prop('checked' , '.cbBox' , false);		
		$('.cbBox').prop('checked' , false);			
		}
	});
	
	//학생 삭제 버튼 누루면
	$('#deleteBtn').on('click ', function(){
		if($('.cbBox:checked').length == 0){
			alert('삭제할 학생을 체크하세요.');
		}else{
			alert('학생을 삭제합니다.');	
			var studentNums = '';
			$('.cbBox:checked').each(function (index , element){
				studentNums += $(element).parent().next().text() + "," ;
			});
			$.ajax({
		         url: 'studentDelete.do',
		          type: 'post',
		          data: {studentNums},
		          success: function(result) {
		        	  selectStudentList();
		          },
		          error: function(){
		             alert('fail');
		          }
		     });
		};		
	});
	
	//학생 정보 변경
	$(document).on('click ', '#updateBtn' , function(){
		updateBtn();
	});
});

/*함수선언*/
/*	
	(function($){
		updateBtn = function(){
	};
	})(jQuery);
*/
// 학생 셀렉트 박스 작동후 폼
(function($){
	selectStudentList = function(){
		var index = $("#ClassSelecter option").index($("#ClassSelecter option:selected"));
		var selectOptionId = $('#ClassSelecter').children().eq(index).attr('id');
		var selectOptionName = $('#ClassSelecter').children().eq(index).val();
		var classCode = $('#ClassSelecter').val();
		var allOption
		if(classCode == '전체선택'){
			
		}
		//alert(' 옵션의 index값 == ' + index + '\n 옵션의 ID 값 == ' + selectOptionId + '\n 옵션의 NAME 값 == ' + selectOptionName + '\n 옵션의 classCode 값 == ' + classCode);

		$.ajax({
			url: 'studentClassSelecter.do',
			type: 'post',
			data: {classCode : selectOptionId , allOption},
			success: function(result) {
				$('#studentListDiv').empty();
				var str = '';
				str += '<table>';
				str += '<tr>';
				str += '<td><input class="cbBox" type="checkbox" id="checkAll"></td>';
				str += '<td>학번</td>';
				str += '<td>이름</td>';
				str += '<td>클래스</td>';
				str += '</tr>';
				$.each(result, function(index, element){	       			
					str += '<tr>';
					str += '<td><input class="cbBox" type="checkbox" id=""></td>'
					str += '<td>'+ result[index].studentNum +'</td>';
					str += '<td><a class="btn btn-outline-secondary studentName" id="'+ result[index].studentNum +'" style="cursor: pointer;" >' +result[index].studentName + '</a></td>';
					str += '<td>'+ element.className +'</td>';
					str += '</tr>';
				});
				str += '</table>';
				$('#studentListDiv').append(str);
			},
			error: function(){
				alert('fail');
			}
		});
	};
})(jQuery);

//학생 상세보기 테이블 폼 
(function($){
	selectUserInfo = function(selectedElement){
		$('.studentName').css('font-weight' , 'normal');
		$(selectedElement).css('font-weight' , 'bold');

		var studentNameAttr = $(selectedElement).attr('id');
		
		$.ajax({
			url: 'studentInfoSelecter.do',
			type: 'post',
			data: {"StudentNum" : studentNameAttr},
			success: function(result) {
				var studentAddr = ''; 
				var studentAge = '';
				var birthDay = '';
				
				if(result.studentInfoVO != null){
					studentAddr = result.studentInfoVO.studentAddr;
					studentAge = result.studentInfoVO.studentAge;
					birthDay = result.studentInfoVO.birthDay;
				}
				
				$('#selectUserDiv').empty();
				var str = '';
				str += '<table class="table table-hover">';
				str += '<tr>';
				str += '<td>학번</td>';
				str += '<td>이름</td>';
				str += '<td>국어점수</td>';
				str += '<td>영어점수</td>';
				str += '<td>수학점수</td>';
				str += '</tr>';
				str += '<tr>';
				str += '<td><a id="studentNum">'+ result.studentNum +'</a></td>';
				str += '<td>'+ result.studentName +'</td>';
				str += '<td><input class="btn btn-outline-secondary" id="korScore" type="text" value="'+ result.korScore +'" /></td>';
				str += '<td><input class="btn btn-outline-secondary" id="engScore" type="text" value="'+ result.engScore +'" /></td>';
				str += '<td><input class="btn btn-outline-secondary" id="mathScore" type="text" value="'+ result.mathScore +'" /></td>';
				str += '</tr>';
				str += '</table>';
				str += '<br>';
				str += '<table class="table table-hover">';
				str += '<tr>';
				str += '<td>주소</td>';
				str += '<td><input class="btn btn-outline-secondary" id="studentAddr" type="text" value="'+ studentAddr +'" /></td>';
				str += '</tr>';
				str += '<tr>';
				str += '<td>나이</td>';
				str += '<td><input class="btn btn-outline-secondary" id="studentAge" type="text" value="'+ studentAge +'"/></td>';
				str += '<td>생일</td>';
				str += '<td><input class="btn btn-outline-secondary" id="birthDay" type="date" value="'+ birthDay+'"/></td>';
				str += '</tr>';
				str += '</table>';
				str += '<div><button class="btn btn-outline-secondary" id="updateBtn" type="button">변경</button></div>';
				$('#selectUserDiv').append(str);
				//$('#birthDay').val(result.studentInfoVO.birthDay);
			},
			error: function(){
				alert('fail');
			}
		});
	};
})(jQuery);

//학생 추가 인서트 프로세스
(function($){
	studentInsetProc = function(){
		var isReg = confirm('등록하시겠습니까?');
		if(isReg){
			var studentName = $('#insertStudentName').val();
			var classCode = $('#ClassSelecter').children().attr("id");
			//alert('안녕 == \n'  + studentName + '\n' + classCode);
			$.ajax({
		        url: 'studentClassInsert.do',
		         type: 'post',
		         data: { studentName , classCode , studentNum : classCode},
		         success: function(result) {
		        	 selectStudentList();
		         },
		         error: function(){
		            alert('fail');
		         }
		     });	
		}
	};
})(jQuery);

//학생 추가 버튼 작동시 추가 폼
(function($){
	studentInset = function(){
		var className = $('#ClassSelecter option:selected').text();
		var classNum =  $('#ClassSelecter option:selected').attr('id');
		var str = '';	
		str += '<tr>'
		str += '<td colspan="2" ><input class="btn btn-outline-secondary" type="button" id="insertProcBtn" value="등록"></td>'
		str += '<td><input class="btn btn-outline-secondary" type="text" id="insertStudentName" /></td>'
		str += '<td><input class="btn btn-outline-secondary" type="text" id="insertClassName" readonly value="'+ className +'" data-classNum="'+ classNum +'" /></td>'
		str += '</tr>'
		$('#studentListDiv').children(':last').append(str);
	
		/*
		 * 부모 노드찾기
		 * $('#studentListDiv').parent();
		 * 
		 * $('#studentListDiv').children().eq(0)
		 * $('#studentListDiv').children().eq(':first')
		 * 
		 * $('#studentListDiv').children().eq(2)
		 * $('#studentListDiv').children().eq(':last')
		 */
	};
})(jQuery);

//학생 정보 업데이트
(function($){
	updateBtn = function(){
		var isUpdate = confirm('변경하시겠습니까?')
		if(isUpdate){
			//alert($('#selectUserDiv').children().length);
			if($('#selectUserDiv').children().length != 0){
				var studentNum = $('#studentNum').text();
				var korScore = $('#korScore').val();
				var engScore = $('#engScore').val();
				var mathScore = $('#mathScore').val();
				var studentAddr = $('#studentAddr').val();
				var studentAge = $('#studentAge').val();
				var birthDay = $('#birthDay').val();
				//alert( studentNum + "\n" + korScore + "\n" + engScore + "\n" + mathScore + "\n" + studentAddr + "\n" + studentAge + "\n" + birthDay);
				$.ajax({
			         url: 'studentUpdate.do',
			          type: 'post',
			          data: {studentNum , korScore , engScore , mathScore , studentAddr , studentAge , birthDay},
			          success: function(result) {
			        	  //alert('업데이트');
			        	  if(result){
			        		  alert('수정완료');
			        	  }
			          },
			          error: function(){
			             alert('fail');
			          }
			   	});
			} else{
				alert('상제보기를 눌러주세요.');
			};
		};
	};
})(jQuery);