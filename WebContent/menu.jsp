<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String sessionId = (String) session.getAttribute("sessionId");
%>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<script src="./resources/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<style>
.dropbtn {
  background-color: #007BFF;
  color: white;
  padding: 7px;
  font-size: 16px;
  border: none;
}

 
.dropdown-content {
  display: none;
  position: absolute;
  background-color: #007BFF;
  min-width: 160px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}
 
.dropdown-content a {
  color: white;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
}
 
.dropdown-content a:hover {background-color: #007BFF;}
 
.dropdown:hover .dropdown-content {display: block;}
 
.dropdown:hover .dropbtn {background-color: #007BFF;}
</style>
<nav class="navbar navbar-expand bg-primary text-white">
	<div class="container">
		<div class="navbar-header">
			<a class="navbar-brand" style="color: white" href="<c:url value="/welcome.jsp"/>">Yes24</a>
		</div>
		<div>
			<ul class="navbar-nav mr-auto">
				<c:choose>
					<c:when test="${empty sessionId}">
						<li class="nav-item"><a class="nav-link" style="color: white"
							href="<c:url value="/member/loginMember.jsp"/>">로그인</a></li>
						<li class="nav-item"><a class="nav-link" style="color: white"
							href='<c:url value="/member/addMember.jsp"/>'>회원 가입</a></li>
					</c:when>
					<c:otherwise>
						<li style="padding-top: 7px; color: white">[<%=sessionId%>님]</li>
						<li class="nav-item"><a class="nav-link" style="color: white"
							href="<c:url value="/member/logoutMember.jsp"/>">로그아웃</a></li>
						<li class="nav-item"><a class="nav-link" style="color: white"
							href='<c:url value="/member/updateMember.jsp"/>'>회원 수정</a></li>
					</c:otherwise>
				</c:choose>
				<li class="nav-item"><a class="nav-link" style="color: white"
					href="<c:url value="/products.jsp"/>">도서 목록</a></li>
				<li class="nav-item"><a class="nav-link" style="color: white"
					href="<c:url value="/orderpage.jsp"/>">주문 내역</a></li>
				<li class="nav-item dropdown" style="margin-left: 10px;">
					<div class="dropdown">
						<button class="dropbtn">도서 관리</button>
						<div class="dropdown-content">
							<a href='<c:url value="/addProduct.jsp"/>'>도서 등록</a>
							<a href='<c:url value="/updateProducts.jsp"/>'>도서 수정</a>
							<a href='<c:url value="/deleteProduct.jsp"/>'>도서 삭제</a>
						</div>
					</div>
				</li>
			</ul>
		</div>
	</div>
</nav>


<form action="search.jsp" method="GET" class="search-form ml-auto">
	<div class="input-group">
		<select name = "select"> 
  			<option value="p_name" selected>제목</option> 
  			<option value="p_category">분류</option> 
		</select>
		<input type="text" name="query" placeholder="검색어 입력"
			class="form-control">
		<div class="input-group-append">
			<button type="submit" class="btn btn-outline-dark">
				<i class="fas fa-search"></i>
			</button>
		</div>
	</div>
</form>
