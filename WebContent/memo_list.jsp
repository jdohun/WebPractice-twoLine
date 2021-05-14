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
<title>MemoList</title>
</head>
<body>
<%
	OnelineDAO dao = new OnelineDAO();
	ArrayList<OnelineDTO> dtos = dao.getList();
%>
	<table id="memoList">
<%
	for(int i = 0; i<dtos.size(); ++i){
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
	<%-- <input class="deleteMemo" type="button" value="X" onClick="location.href='memo_delete.jsp?no="+<%=no%>> --%>
	</table>
	<span style="margin:16px;"><b>DB조회 성공</b></span>
	<a href="memo01.html" class="Write">작성</a>
</body>
</html>
