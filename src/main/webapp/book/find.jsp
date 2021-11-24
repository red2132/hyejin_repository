<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
  width: 1300px;
}
</style>
</head>
<body>
<div class="container">
    <div class="row">
    <table class="table">
      <tr>
        <td>
        <form method=post action="find.do">
	        Search:
	        <select name=fs class="input-sm">
	          <option value="N">제목</option>
	          <option value="W">저자</option>
	          <option value="T">태그</option>
	        </select>
	        <input type=text name=ss size=15 class="input-sm">
	        <button class="btn btn-sm btn-danger">검색</button>
        </form>
        </td>
      </tr>
    </table>
     <c:forEach var="vo" items="${list }">
       <div class="col-md-3">
	      <div class="thumbnail">
	        <a href="detail.do?isbn=${vo.isbn }&page=1"><!-- 매개변수 int -->
	          <img src="${vo.poster }" alt="Lights" style="height:200px" style="width:200px">
	          <div class="caption">
	            <p>${vo.title }</p>
	            <p>by&nbsp;${vo.writer }</p>
	          </div>
	        </a>
	      </div>
	    </div>
     </c:forEach>
    </div>
  </div>
</body>
</html>