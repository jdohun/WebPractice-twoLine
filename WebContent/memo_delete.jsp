<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@page import="twoline.OnelineDAO"%>
<%@page import="twoline.OnelineDTO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		int deleteNo = Integer.parseInt(request.getParameter("deleteNo"));
		OnelineDAO dao = new OnelineDAO();
		dao.delete(deleteNo); 	
	
		/*
		OnelineDTO dto = new OnelineDTO();
		dto.setNo(deleteNo);
		dao.delete(dto);
		*/
		
		response.sendRedirect("memo_list.jsp"); 
	%>
</body>
</html>