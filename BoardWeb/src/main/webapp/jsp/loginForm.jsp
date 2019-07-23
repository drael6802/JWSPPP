<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
	<link rel="stylesheet" href="css/bootstrap.css" >
</head>
<body>
<div class="container" style=" height: 300px;"></div>
	<div align="center">
		<div class="card-body" align="center" style="width: 500px; height: 500px;">
			<form class="btn btn-light" action="login.do" method="post">
				<table class="table table-hover">
					<thead class="">
						<tr>
							<th scope="col" colspan="2">L O G I N</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row">ID</th>
							<td><input class="btn btn-dark" type="text" id="id" name="id" placeholder="I D" required></td>
						</tr>
						<tr>
							<th scope="row">PASSWORD</th>
							<td><input class="btn btn-dark" type="password" id="password" name="password" placeholder="P A S S W O R D" required></td>
						</tr>
						<tr>
							<th scope="row" colspan="2">
								<div align="center">
									<input class="form-control btn btn-light" type="submit" value="LOGIN" />
									<input type="button" class="form-control btn btn-light" value="학생" onclick="location.href='studentManager.do'">
									<input type="button" class="form-control btn btn-light" value="네이버로그인" onclick="location.href='naverLogin.do'">
								</div>
							</th>
						</tr>
					</tbody>
				</table>
			</form>
			<br>
		</div>
	</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>cs
<script type="text/javascript" src="js/bootstrap.js"></script>
</body>
</html>