<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<style type="text/css">
table, td, th {
	border: 1px solid red;
}

th {
	background-color: red;
	color: white;
}
</style>
<title>게시판을 짜자</title>
</head>

<body>
	<h1>게시판 짜기</h1>

	<table>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>날짜</th>
			<th>조회수</th>
		</tr>

		<c:forEach items="${articleList}" var="article">

			<tr>
				<td>${article.idx}</td>
				<td><a href="content.jsp?idx=${article.idx}">${article.title}</a></td>
				<td>${article.writer}</td>
				<td>${article.regdate}</td>
				<td>${article.count}</td>
			</tr>
		</c:forEach>
	</table>

	<a href="write.jsp">글쓰기</a>

</body>
</html>