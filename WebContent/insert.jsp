<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.util.regex.Pattern"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<%
		String title = request.getParameter("title");
		String writer = request.getParameter("writer");
		String regdate = request.getParameter("regdate");
		String content = request.getParameter("content");
		
		try {

			String driverName = "com.mysql.jdbc.Driver"; //데이터베이스에 접속하기위한 드라이버를 로드합니다.

			String url = "jdbc:mysql://localhost:3306/board?autoReconnect=true&useSSL=false"; //접속 URL정보와 포트번호(oracle포트), sid(oracle버전)

			Class.forName(driverName);

			Connection con = DriverManager.getConnection(url, "root", "1234"); // getCo... : 계정정보 url, id, pw

			out.println("db에 성공적으로 접속했습니다");
			
			Statement stmt = con.createStatement();
			
			String sql = "insert into board (title,writer,regdate,count,content) " + 
					"VALUES ('"+title+"', '"+writer+"', '"+regdate+"', '1', '"+content+"')";
			
			stmt.executeUpdate(sql);
			
			con.close();

		} catch (Exception e) {

			e.printStackTrace();

		} finally {
			out.print("<script>location.href='list.jsp';</script>");
		}
	%>
</body>
</html>