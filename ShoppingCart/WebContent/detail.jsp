<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<%@ include file="inc.jsp" %>
<%@ include file="class.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>商品詳細表示</title>
<style>
	body{
		background-color: #ffff99;
	}
	div.d_center{
		width: 400px;
		margin: 0 auto;
	}
</style>
</head>
<body>

<%--	<h3>商品詳細表示</h3> --%>

	<%
		Connection conn;
		Statement st;
		String sql;
		ResultSet rs;

		String id = request.getParameter("id");

		Class.forName(jdbc);
		conn = DriverManager.getConnection(url,user,pass);

		st = conn.createStatement();
		sql = "SELECT * FROM shoutengai WHERE id = " + id;
		rs = st.executeQuery(sql);
		rs.next();

//		String id = rs.getString("id");
		String pname = rs.getString("pname");
		String price = rs.getString("price");
		String img = rs.getString("img");
		String d;
	%>
<%
		if( img==null || img.equals("") ){
			img = "print.gif";
		}
%>
		<table border="0">
		<tr>
		<tr>
		<td>
		<img src="<%=img%>" alt="<%=img%>" width="150" height="150"> </td>

		<td>
			<form method="post" action="cart.jsp">
				<%=pname%></br>
				<p>価格: <%= toYenStr(price) %></p>
				<p><input type="submit" value="購入する" name="">　数量<input type="text" name="count" value="1" size="5"></p>
				<input type="hidden" name="mode" value="1" />
				<input type="hidden" name="id" value="<%=id%>">
			</form>
			<form method="post" action="buyindex.jsp">
				<p><input type="submit" value="商品検索" name=""></p>
			</form>
		</td>
		</tr>
		<tr>
		<td></td>
		</tr>
		</tr>
		</table>

	<form method="POST" action="cart.jsp">
		<input type="submit" value="カートの中身を表示" name="sub1">
		<input type="hidden" name="mode" value="0" />
	</form>
	<% conn.close(); %>
</body>
</html>