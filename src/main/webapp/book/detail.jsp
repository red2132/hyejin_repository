<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.container{
   margin-top: 30px;
}
.row {
   margin: 0px auto;
   width:960px;
}
</style>
</head>
<body>
		<div class="container">
			<div class="row">
				<div class="col-lg-8 col-12">
					<div class="blog-single-main">
						<div class="row">
							<div class="col-12">
								<!--<div class="image">-->
									<img src="${vo.poster }">
								

								<div class="blog-detail">
									<h2>${vo.title }</h2>
									<h4>${vo.subtitle }</h4>
									<div>
									<span>
										작가 :
											${vo.writer } / 출판사 : ${vo.publisher } <br>정가 :
											${vo.price } / <br>제원 :
											${vo.etcinfo } 출판일 : ${vo.publicactionday}
											<br>ISBN(도서번호) : ${vo.isbn }
											</span>
										
									</div>
								</div>
								<div class="share-social">
									<div class="row">
										<div class="col-12">
											<div class="content-tags">
												<h5>Tags</h5>
												<ul class="tag-inner">
													<c:forTokens var="tag" items="${vo.tags }" delims="#">
														<li>#${tag }</li>
													</c:forTokens>
												</ul>
												<br><hr>
											</div>
										</div>
										<input type=button value="목록" class="btn btn-sm btn-success"
					             onclick="javascript:history.back()">
									</div>
								</div>
							</div>
						</div>	
					</div>
				</div>
			</div>
		</div>				
</body>
</html>



