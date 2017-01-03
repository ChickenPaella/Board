<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@page import="java.util.regex.Pattern"%>
<%@page import="java.sql.*"%>
<%@ page import="com.board.beans.Board"%>
<%@ page import="java.util.ArrayList"%>
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
<title>�Խ����� ¥��</title>
</head>


<%
	try {

		String driverName = "com.mysql.jdbc.Driver";

		String url = "jdbc:mysql://localhost:3306/board?autoReconnect=true&useSSL=false";

		ResultSet rs = null;

		Class.forName(driverName);

		Connection con = DriverManager.getConnection(url, "root","1234");

		out.println("Oracle Database Connection Success.");

		Statement stmt = con.createStatement();

		String sql = "select * from board order by idx desc";

		rs = stmt.executeQuery(sql);

		ArrayList<Board> articleList = new ArrayList<Board>(); //�� �ڵ�� Board�� �迭�������� �����Ѱ��Դϴ�.

		while (rs.next()) {

			Board article = new Board(); //�����͵��� ������� Board��ü�� �޸𸮸� �Ҵ��ϴ� �ڵ��Դϴ�.

			article.setIdx(rs.getInt("idx")); // Integer.parseInt�� String���� int�������� ����ȯ

			article.setTitle(rs.getString("title"));

			article.setWriter(rs.getString("writer"));

			article.setRegdate(rs.getString("regdate"));

			article.setCount(rs.getInt("count"));

			articleList.add(article); // ���õ� ���� ����Ʈ�� �߰��մϴ�.

		}

		request.setAttribute("articleList", articleList); // ���õ� ����Ʈ�� �信 �������մϴ�.

		con.close();

	} catch (Exception e) {

		out.println("Oracle Database Connection Something Problem. <hr>");

		out.println(e.getMessage());

		e.printStackTrace();

	}
%>
<body>
	<h1>�Խ��� ¥��</h1>

	<table>
		<tr>
			<th>��ȣ</th>
			<th>����</th>
			<th>�ۼ���</th>
			<th>��¥</th>
			<th>��ȸ��</th>
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

	<a href="write.jsp">�۾���</a>

</body>
</html>