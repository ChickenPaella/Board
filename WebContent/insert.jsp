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

			String driverName = "com.mysql.jdbc.Driver"; //�����ͺ��̽��� �����ϱ����� ����̹��� �ε��մϴ�.

			String url = "jdbc:mysql://localhost:3306/board?autoReconnect=true&useSSL=false"; //���� URL������ ��Ʈ��ȣ(oracle��Ʈ), sid(oracle����)

			Class.forName(driverName);

			Connection con = DriverManager.getConnection(url, "root", "1234"); // getCo... : �������� url, id, pw

			out.println("db�� ���������� �����߽��ϴ�");
			
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