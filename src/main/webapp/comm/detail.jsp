<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		<table class="table">
			<tr>
				<th width="20%" class="text-center">번호</th>
				<td width="30%" class="text-center">${vo.no }</td>
				<th width="20%" class="text-center">작성일</th>
				<td width="30%" class="text-center">${vo.dbday }</td>
			</tr>
			<tr>
				<th width="20%" class="text-center">이름</th>
				<td width="30%" class="text-center">${vo.name }</td>
				<th width="20%" class="text-center">조회수</th>
				<td width="30%" class="text-center">${vo.hit }</td>
			</tr>
			<tr>
				<th width="20%" class="text-center">제목</th>
				<td colspan="3">${vo.subject }</td>
			</tr>
			<tr>
				<td colspan="4" class="text-left" valign="top" height="200">
					<pre style="white-space:pre-wrap;background-color:white;border:none">${vo.content }</pre>
				</td>
			</tr>
			<tr>
				<td colspan="4" class="text-right">
					<a href="../comm/update.do?no=${vo.no }&page=${page }" class="btn btn-xs btn-info">수정</a>
					<a href="../comm/delete.do?no=${vo.no }&page=${page }" class="btn btn-xs btn-danger">삭제</a>
					<a href="../comm/list.do?page=${page }" class="btn btn-xs btn-primary">목록</a>
				</td>
			</tr>
		</table>
	</div>
</div>
</body>
</html>