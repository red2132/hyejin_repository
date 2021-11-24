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
		<form method=get action="list.do">
			<select name=category class="input-sm">
	          <option value="가정">가정</option>
	          <option value="여가">여가</option>
	          <option value="학문">학문</option>
	          <option value="교육">교육</option>
	          <option value="문학">문학</option>
	          <option value="해외">해외</option>
	          <option value="기타">기타</option>
	        </select>
	        <button class="btn btn-sm btn-info">카테고리 이동</button>
		</form>
	</div>
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
	      <div class="thumbnail" style="height:300px">
	        <a href="detail.do?isbn=${vo.isbn }&category=${vo.category}&page=${curpage}"><!-- 매개변수 int -->
	          <img src="${vo.poster }" alt="Lights" style="height:200px">
	          <div class="caption">
	            <p>${vo.title }</p>
	            <p>by&nbsp;${vo.writer }</p>
	          </div>
	        </a>
	      </div>
	    </div>
     </c:forEach>
    </div>
    <div class="row">
      <div class="text-center">
        <ul class="pagination pagination-lg">
          <c:if test="${startPage>1 }">
           <li><a href="list.do?page=${startPage-1 }">&lt;</a></li>
          </c:if>
          <c:forEach var="i" begin="${startPage }" end="${endPage }">
           
           <c:if test="${i==curpage }">
            <c:set var="style" value="class=active"/>
           </c:if>
           <c:if test="${i!=curpage }">
            <c:set var="style" value=""/>
           </c:if>
           
            <li ${style }><a href="list.do?page=${i }">${i }</a></li>
          </c:forEach>
		  
		  <c:if test="${endPage<totalpage }">
		   <li><a href="list.do?page=${endPage+1 }">&gt;</a></li>
		  </c:if>
		</ul>
      </div>
    </div>
   </div>
</body>
</html>

