<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.container{
   margin-top: 50px;
}
.row{
  margin: 0px auto;
  width: 900px;
}
</style>
</head>
<body>
<div class="container">
    <div class="row">
    <h1>수정하기</h1>
	<form method="post" action="../comm/update_ok.do">
		<table class="table">
			<tr>
				<th width=25%>작성자</th>
				<td width=75%>
					<input type=text name=name size=15 class="input-sm" value="${vo.name }" id="name">
					<input type=hidden name=no value="${vo.no }" id="no">
					<input type=hidden name=page value="${page }" id="page">
				</td> 
			</tr>
			<tr>
				<th width=25%>제목</th>
				<td width=75%>
					<input type=text name=subject size=55 class="input-sm" value="${vo.subject }" id="subject">
				</td> 
			</tr>
			<tr>
			<th width=25%>내용</th>
			<td width=75%>
				<textarea rows="10" cols="55" name="content" id="content">${vo.content }</textarea>
			</td> 
			</tr>
			<tr>
				<th width=25%>비밀번호</th>
				<td width=75%>
					<input type="password" name=pwd size=10 class="input-sm" id="pwd">
				</td> 
			</tr>
			<tr>
				<td colspan="2" class="text-center">
					<button class="btn btn-sm btn-success">수정</button>
					<input type=button value="취소" class="btn btn-sm btn-danger"
						onclick="javascript:history.back()">
				</td>
			</tr>
		</table>
	</form>
    </div>
</div>
</body>
</html>