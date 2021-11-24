<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
				<td colspan="5" class="text-right">
					<a href="../comm/insert.do" class="btn btn-xs btn-info">글 작성하기</a>
				</td>
			</tr>
    	<tr>
			<th class="text-center" width=10%>번호</th>
			<th class="text-center" width=45%>제목</th>
			<th class="text-center" width=15%>작성자</th>
			<th class="text-center" width=20%>작성일</th>
			<th class="text-center" width=10%>조회수</th>
		</tr>
	<c:forEach var="vo" items="${cList }">
		<tr>
			<td class="text-center" width=10%>${vo.no }</td>
			<td width=45%>
				<a href="../comm/detail.do?no=${vo.no }&page=${curpage}">${vo.subject }</a>
			</td>
			<td class="text-center" width=15%>${vo.name }</td>
			<td class="text-center" width=20%>${vo.dbday }</td>
			<td class="text-center" width=10%>${vo.hit }</td>			
		</tr>
	</c:forEach>
		</table>
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