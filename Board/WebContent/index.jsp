<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@page import="java.util.regex.Pattern"%>
<%@page import="java.sql.*"%>
<%@ page import="com.board.beans.Board" %> 
<%@ page import="java.util.ArrayList" %>
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

<%
	try {

		String driverName = "com.mysql.jdbc.Driver";

		String url = "jdbc:mysql://localhost:3306/board?autoReconnect=true&useSSL=false";

		ResultSet rs = null;

		Class.forName(driverName);

		Connection con = DriverManager.getConnection(url, "root", "1234");

		out.println("Oracle Database Connection Success.");

		Statement stmt = con.createStatement();

		String sql = "select * from board order by idx desc";

		rs = stmt.executeQuery(sql);
		
		ArrayList<Board> articleList = new ArrayList<Board>();
		
		while(rs.next()) {
			Board article = new Board();
			article.setIdx(rs.getInt("idx"));
			article.setTitle(rs.getString("title"));
			article.setWriter(rs.getString("writer"));
			article.setRegdate(rs.getString("regdate"));
			article.setCount(rs.getInt("count"));
			articleList.add(article);
		}
		
		request.setAttribute("articleList", articleList);
		
		con.close();

	} catch (Exception e) {

		e.printStackTrace();

	}
%>
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
				<td><a href='content.jsp?idx=${article.idx}'>${article.title}</a>a></td>
				<td>${article.writer}</td>
				<td>${article.regdate}</td>
				<td>${article.count}</td>
			</tr>
		</c:forEach>
	</table>

	<a href="write.jsp">글쓰기</a>
	
</body>
</html>