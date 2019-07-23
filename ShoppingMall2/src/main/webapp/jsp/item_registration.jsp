<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이템 등록 폼</title>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script type="text/javascript" src="../js/item_registration.js?ver=19"></script>
	<style type="text/css">
		#ItemDIV{
			margin: 0;
			padding: 0;
		}
        #ItemDIV table{
        	margin: 0;
			padding: 0;
        }
        #ItemDIV img{
        	max-width: 200px;
        	max-height: 250px;
        }
        #ItemDIV td{
        	padding-left: 10%;
        	height: 30px;
        }
        #ItemDIV tr{
        }
        
        select {
			width: 100px;	
		}

	</style>
	<script type="text/javascript">
   
    </script>
</head>
<body>
<div align="center">
	<form action="itemRegistrationProc.do" id="itemRegistrationForm" method="post" enctype="multipart/form-data">
		<div id="ItemDIV" align="center">
			<table>
				<tr>
					<th colspan="2"><h1>상품 추가</h1></th>
				</tr>
				<tr>
					<td rowspan="3">카테고리</td>
					<td>
						<select id="categorySelectBox" >
							<option id="categoryCode">카테고리</option>
							<c:forEach items="${categoryList }" var="list">
							<option id="${list.categoryCode } " >${list.categoryName }</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<td>
						<select id="category02SelectBox">
							<option>카테고리02</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>
						<select id="category03SelectBox">
							<option>카테고리03</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>아이템_이름</td>
					<td><input type="text" id="itemName" name="itemName" required></td>
				</tr>
				<tr>
					<td>아이템_가격</td>
					<td><input type="text" id="itemPrice" name="itemPrice" value="0" required></td>
				</tr>
				<tr>
					<td>재고수량</td>
					<td><input type="text" id="itemInventory" name="itemInventory" value="0" required></td>
				</tr>
				<tr>
					<td>아이템_이미지</td>
					<td><input type="file" id="itemImage" name="itemImageFile" required></td>
				</tr>
				<tr>
					<td>아이템_이미지 썸네일</td>
					<td><input type="file" id="itemThumbnail" name="itemThumbnailFile" required></td>
				</tr>
				<tr>
					<td colspan="2">
						<div align="center" >
							<img id="PreviewImg" style="width: 80%; height: 80%;"/>
						</div>
					</td>
				</tr>
				<tr>
					<td>아이템_할인</td>
					<td>
						<select id="itemDiscount" name="itemDiscount">
							<option>0</option>
							<option>5</option>
							<option>10</option>
							<option>20</option>
							<option>25</option>
							<option>30</option>
							<option>40</option>
							<option>50</option>
							<option>60</option>
							<option>70</option>
							<option>80</option>
							<option>90</option>
						</select>
						%
					</td>
				</tr>
				<tr>
					<td>아이템_설명</td>
					<td><input type="text" id="itemContent" name="itemContent" required></td>
				</tr>
				<tr>
					<td>옵션 추가</td>
					<td>
						<div id="optionDIV">
							<input type="text" class="optionName" id="options01" name="options01" value="옵션" style="width: 60%;"  />
							<input type="button" class="" id="optionBtn" value="추가"  ><br>
						</div>
					</td>
				</tr>
			</table>
			<div style="height: 30px;">
				<input type="button" id="submitBtn" value="등록">
			</div>
		</div>
	</form>
</div>
</body>
</html>