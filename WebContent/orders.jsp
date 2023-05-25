<%@page import="java.util.Date"%>
<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ include file="/dbconn.jsp"%>
<%

	String sessionId = (String) session.getAttribute("sessionId");
	request.setCharacterEncoding("UTF-8");
	String p_id = request.getParameter("id");
	Date day = new Date();
	String date = day.toString();
	String quantity = request.getParameter("quantity");

	// 이미 주문이 존재하는 경우, 수량을 업데이트합니다.
	String selectSql = "SELECT * FROM orders WHERE member_id = ? AND p_id = ?";
	String p_sql = "select * from product where p_id=?";
	PreparedStatement p_pstmt = conn.prepareStatement(p_sql);
	p_pstmt.setString(1,p_id);
	pstmt = conn.prepareStatement(selectSql);
	pstmt.setString(1, sessionId);
	pstmt.setString(2, p_id);
	rs = pstmt.executeQuery();
	
	ResultSet p_rs = p_pstmt.executeQuery();
	p_rs.next();
	String price = p_rs.getString("p_unitPrice");
	
	if (rs.next()) {
		int existingQuantity = rs.getInt("quantity");
		quantity = String.valueOf(Integer.parseInt(quantity) + existingQuantity);

		String updateSql = "UPDATE orders SET quantity = ? WHERE member_id = ? AND p_id = ?";
		pstmt = conn.prepareStatement(updateSql);
		pstmt.setString(1, quantity);
		pstmt.setString(2, sessionId);
		pstmt.setString(3, p_id);
		pstmt.executeUpdate();
	} else {
		// 새로운 주문을 추가합니다.
		String ordersid = p_id + sessionId;
		String sql = "INSERT INTO orders VALUES (?, ?, ?, ?, ?, ?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, ordersid);
		pstmt.setString(2, sessionId);
		pstmt.setString(3, p_id);
		pstmt.setString(4, price);
		pstmt.setString(5, quantity);
		pstmt.setString(6, date);
		pstmt.executeUpdate();
	}

	if (rs != null)
		rs.close();

	if (pstmt != null)
		pstmt.close();
	
	if (p_rs != null)
		rs.close();

	if (p_pstmt != null)
		pstmt.close();
	
	if (conn != null)
		conn.close();

	response.sendRedirect("orderpage.jsp");
%>
