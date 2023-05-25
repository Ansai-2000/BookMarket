<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="/dbconn.jsp"%>
<%
	String id = (String) session.getAttribute("sessionId");
	String productId = request.getParameter("productId");
	
	String sql = "select * from orders";
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
	if(rs.next()){
		sql = "delete from orders where p_id = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, productId);
		pstmt.executeUpdate();
	}else
		out.println("일치하는 도서가 없습니다.");
	
	if(rs!=null)
		rs.close();
	if(pstmt!=null)
		pstmt.close();
	if(conn!=null)
		conn.close();
	response.sendRedirect("orderpage.jsp");
%>
