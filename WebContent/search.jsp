<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/dbconn.jsp"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>Search Results</title>
</head>
<body>
<%@ include file="menu.jsp" %>
<%
    // 검색 로직
    String query = request.getParameter("query");
    String select = request.getParameter("select");
    String sql = "select * from product where " + select + " like '%" + query + "%'";
    pstmt = conn.prepareStatement(sql);
    rs = pstmt.executeQuery();
    
    if (rs.next()) {
        do {
%>
<div class="col-md-4">
    <img src="/upload/<%=rs.getString("p_fileName")%>" style="width: 100%">
    <h3><%=rs.getString("p_name")%></h3>
    <p><%=rs.getString("p_description")%></p>
    <p><%=rs.getString("p_UnitPrice")%>원</p>
    <p>
        <a href="./product.jsp?id=<%=rs.getString("p_id")%>"
            class="btn btn-secondary" role="button"> 주문 하기 &raquo;</a>
    </p>
</div>
<%
        } while (rs.next());
    } else {
%>
<p>"<%=query%>"에 대한 검색결과가 없습니다.</p>
<%
    }
    
    if (rs != null)
        rs.close();
    if (pstmt != null)
        pstmt.close();
    if (conn != null)
        conn.close();
%>
</body>
</html>
