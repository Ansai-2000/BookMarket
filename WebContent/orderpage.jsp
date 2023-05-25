<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/dbconn.jsp"%>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<%
String id = (String) session.getAttribute("sessionId");
%>
<title>주문내역</title>
</head>
<body>
	<jsp:include page="/menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">주문내역</h1>
		</div>
	</div>
	<div class="container">
		<div style="padding-top: 50px">
			<table class="table table-hover">
				<tr>
					<th>상품</th>
					<th>가격</th>
					<th>수량</th>
					<th>소계</th>
				</tr>
				<div class="row">
			
		</div>
				<% 
				String sql = "SELECT orders.*, product.p_name FROM orders JOIN product ON orders.p_id = product.p_id WHERE member_id = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();

				int sum = 0;
				while (rs.next()) {
					int price = rs.getInt("price");
					int quantity = rs.getInt("quantity");
					int total = price * quantity;
					String p_id = rs.getString("p_id");
					sum += total;
				%>
				<tr>
						<td><%=rs.getString("p_name")%></td>
						<td><%=price%></td>
						<td><%=quantity%></td>
						<td><%=total%></td>
						<td align="left"><a href="./deleteorder.jsp?productId=<%=p_id%>" class="btn btn-danger">주문 취소</a></td>
				</tr>
				<% } %>

				<tr>
					<th></th>
					<th></th>
					<th>총액</th>
					<th><%=sum%></th>
					<th></th>
				</tr>
			</table>

			<a href="./products.jsp" class="btn btn-secondary"> &laquo; 쇼핑 계속하기</a>
		</div>
		<hr>
	</div>


</body>
</html>
