<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@page import="twoline.OnelineDAO"%>
<%@page import="twoline.OnelineDTO"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	String memo = request.getParameter("memo");
	
	OnelineDTO dto = new OnelineDTO();
	dto.setMemo(memo);
	OnelineDAO dao = new OnelineDAO();
	dao.insert(dto);
	
	response.sendRedirect("memo_list.jsp");
%>
</body>
</html>