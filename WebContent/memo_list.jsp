<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="twoline.OnelineDTO" %>
<%@ page import="twoline.OnelineDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/memo01.css">
<title>메모장</title>
</head>
<body>
<%
	OnelineDAO dao = new OnelineDAO();
	ArrayList<OnelineDTO> dtos = dao.getList();
%>
	<div id="contents">
		<h3 id="title">MEMO</h3>
		<form class="memoInputForm" method="post" action="memo_write.jsp">
			<input id="memoInput" type="text" name="memo"><br>
			<input id="memoSubmit" type="submit" value="등록">
		</form>
		<hr>
		<table id="memoList">
<%
	/* for(OnelineDTO dto : dtos){ */
	for(int i = 0; i < dtos.size(); ++i){
		OnelineDTO dto = dtos.get(i);
%>
		<tr>
			<th class="memoNumber">일련번호 <%=dto.getNo()%></th>
			<td class="memoContents">
				<span><%=dto.getMemo()%></span>
				<form action="memo_delete.jsp" method="post" class="memoDeleteForm">
					<input type="hidden" value="<%=dto.getNo()%>" name="deleteNo">
					<input type="submit" class="delete" value="X" class="deleteMemo">
				</form>
			</td>
			<td class="wdate">(<%=dto.getWdate()%>)</td>
		</tr>
<%
	}
%>
		</table>
</body>
</html>
