<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="dto.Product"%>
<%@ page import="dao.ProductRepository"%>
<%@ include file="/dbconn.jsp"%>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<title>도서 상세 정보</title>

</head>
<body>
	<jsp:include page="menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">도서 정보</h1>
		</div>
	</div>
	<%
	String id = request.getParameter("id");
	String sql = "select * from product where p_id = '" + id + "'";
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
	rs.next();
	%>
	<div class="container">
		<div class="row">
			<div class="col-md-5">
				<img src="/upload/<%=rs.getString("p_fileName")%>"
					style="width: 100%" />
			</div>
			<div class="col-md-6">
				<h3><%=rs.getString("p_name")%></h3>
				<p><%=rs.getString("p_description")%>
				<p>
					<b>도서 코드 : </b><span class="badge badge-danger"> <%=rs.getString("p_id")%></span>
				<p>
					<b>출판사</b> :
					<%=rs.getString("p_manufacturer")%>
				<p>
					<b>분류</b> :
					<%=rs.getString("p_category")%>
				<p>
					<b>재고 수</b> :
					<%=rs.getString("p_unitsInStock")%>
				<h4><%=rs.getString("p_unitPrice")%>원
				</h4>
				<form name="addForm" method="post" action="./orders.jsp">
					<label for="quantity">수량:</label>
					<div class="input-group">
						<span class="input-group-btn">
							<button type="button" class="btn btn-default"
								onclick="decreaseQuantity()">-</button>
						</span> <input name="quantity" id="quantity" min="1" value="1"
							class="form-control" required> <span
							class="input-group-btn">
							<button type="button" class="btn btn-default"
								onclick="increaseQuantity()">+</button>
						</span>
					</div>
					<br> <input type="hidden" name="id"
						value="<%=rs.getString("p_id")%>">
					<button type="submit" class="btn btn-info">도서 주문 &raquo;</button>
				</form>

				<script>
					function decreaseQuantity() {
						var quantityInput = document.getElementById("quantity");
						var currentValue = parseInt(quantityInput.value);

						if (!isNaN(currentValue) && currentValue > 1) {
							quantityInput.value = currentValue - 1;
						}
					}

					function increaseQuantity() {
						var quantityInput = document.getElementById("quantity");
						var currentValue = parseInt(quantityInput.value);

						if (!isNaN(currentValue)) {
							quantityInput.value = currentValue + 1;
						}
					}
				</script>

			</div>
		</div>
		<hr>
	</div>
</body>
</html>
