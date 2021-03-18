<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<%@ include file="inc.jsp" %>
<%@ include file="class.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ショッピングカート</title>
<style>
	/*
	body{
		background-color: #ffff99;
	}
	*/
	div.d_center{
		width: 400px;
		margin: 0 auto;
	}


	.container {
		width: 960px;
		margin: 0 auto;
	}

	main {
		display: grid;
  		grid-template-columns: 1fr 1fr 1fr;
	}
</style>
</head>
<body>
<div class="container">
<header>
<h1>○○商店街オンラインストア</h1>
</header>
<div id="news">
ここに最新情報
</div>
<main>
<div id="leftmenu">

</div>
<div id="search">
<form method="post" action="buyindex.jsp">
<p><input type="submit" value="商品一覧表示 >>TOP" name=""></p>
</form>

	今なら5,000円以上で送料無料
	<div class="d_center">
	<%

	//変数定義

	Connection conn;
	Statement st;
	String sql;
	ResultSet rs;

	//検索キーワードを取得する

	String key = request.getParameter("key");
	if( key == null ) {
		key = "";
	}

	//データベースに接続する

	Class.forName(jdbc);
	conn = DriverManager.getConnection(url,user,pass);

	// 全データ件数を取得する

	st = conn.createStatement();
	sql = "SELECT COUNT(*) FROM product1";

	if( key.equals("") == false ) {
		sql	+=	" WHERE pname LIKE '%" + cnvString(key) + "%'";
	}
	rs = st.executeQuery(sql);
	rs.next();
	int dtcnt = rs.getInt(1);

	//表示するページ位置を取得する

	int p;
	try {
		p = Integer.parseInt(request.getParameter("p"));
	}
	catch (Exception e) {
		p = 1;
	}
	if( p < 1 ) {
		p = 1;
	}

	//前後のページ番号を取得する

	int prev = p - 1;
	if( prev < 1 ) {
		prev = 1;
	}
	int next = p + 1;

	//表示するデータの位置を取得する

	int s = (p - 1) * lim;

	//データを取り出す

	st = conn.createStatement();
	sql = "SELECT id,pname,price,img  FROM product1 ";

	if( key.equals("") == false ) {
		sql	+=	" WHERE pname LIKE '%" + cnvString(key) + "%'";
	}

	sql += " ORDER BY id DESC";
	sql += " LIMIT " + s + "," + lim;
	rs = st.executeQuery(sql);
	%>


	<%-- 検索キーワード用テキストボックス --%>

	<table>
	<tr>
		<form method="post" action="<%=request.getRequestURI()%>">
			<td><input type="text" name="key" value="<%=cnvString(key)%>"></td>
			<td><input type="submit" value="検索" name="sub1"></td>
		</form>
		<form method="POST" action="cart.jsp">	<%-- カゴの中身を表示 --%>
			<td><input type="submit" value="カゴの中身を表示" name="sub1"></td>
		</form>

	</tr>
	</table><br>



	<table>
		<tr>
		<% if( p > 1 ) { %>

			<form method="post" action="<%=request.getRequestURI()%>">
			<td>
			<input type="submit" value="&lt; 前のページ">
			<input type="hidden" name="p" value="<%=prev%>">
			<input type="hidden" name="key" value="<%=cnvString(key)%>">
			</td>
			</form>

		<% } %>

		<% if( (next-1) * lim < dtcnt ) { %>
			<form method="post" action="<%=request.getRequestURI()%>">
			<td>
			<input type="submit" value="次のページ &gt;">
			<input type="hidden" name="p" value="<%=next%>">
			<input type="hidden" name="key" value="<%=cnvString(key)%>">
			</td>
			</form>

		<% } %>

		</tr>
	</table>
	<br>



	<%-- ショッピングカート --%>

	<table>

		<%
		while( rs.next() ) {
		String id = rs.getString("id");
		%>

		<tr>
			<td>
<%
				String imgPath = rs.getString("img");
				if( imgPath == null || imgPath.equals("") ) {
					imgPath = "print.gif";
				}
%>
				<img src="images/<%= imgPath %>" width="150" height="150" />
			</td>
			<td>
				<%=rs.getString("pname")%> <br>
				<%=toYenStr(rs.getInt("price"))%> <br>
				<form method="post" action="detail.jsp">
					<input type="submit" value="詳細">
					<input type="hidden" name="id" value="<%=id%>">
				</form>
				<br>
			</td>
		</tr>

		<% } %>

	</table>


	<%-- 前後ページへのリンク --%>

	<table>
		<tr>
		<% if( p > 1 ) { %>

			<form method="post" action="<%=request.getRequestURI()%>">
			<td>
			<input type="submit" value="&lt; 前のページ">
			<input type="hidden" name="p" value="<%=prev%>">
			<input type="hidden" name="key" value="<%=cnvString(key)%>">
			</td>
			</form>

		<% } %>

		<% if( (next-1) * lim < dtcnt ) { %>
			<form method="post" action="<%=request.getRequestURI()%>">
			<td>
			<input type="submit" value="次のページ &gt;">
			<input type="hidden" name="p" value="<%=next%>">
			<input type="hidden" name="key" value="<%=cnvString(key)%>">
			</td>
			</form>

		<% } %>

		</tr>
	</table>

	<%-- データベース接続を閉じる --%>
	<% conn.close(); %>

	</div>
	</div>
	<div id="rightbar">

	</div>
	</main>
	<footer>

	</footer>
</div>
</body>
</html>