<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<%@ include file="inc.jsp" %>
<%@ include file="class.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<title>Insert title here</title>
<style>
	@media screen and (max-width: 519px) {

	.container {
		width: 96vw;
		margin: 0 auto;
	}

	header {
		height:75px;
		display: flex;
		align-items: center;
		justify-content: center;
		background-color: lightgray;
	}

	navbar ul {
		display: grid;
  		grid-template-columns: 1fr 1fr;
  		padding-left: 0;
  		margin:0;
	}

	navbar ul li{
		box-sizing: border-box;
		list-style-type: none;
		height: 40px;
		display: flex;
		align-items: center;
		justify-content: center;
		color: white;
	}

	navbar ul li:nth-of-type(1){
		background-color: red;
	}
	navbar ul li:nth-of-type(2){
		background-color: blue;
	}
	navbar ul li:nth-of-type(3){
		background-color: purple;
	}
	navbar ul li:nth-of-type(4){
		background-color: green;
	}
	navbar ul li:nth-of-type(5){
		background-color: orange;
	}

	#news {
		height: 100px;
	}

	#sidebar {
		display: none;
	}

	.products {
		display: grid;
  		grid-template-columns: 1fr 1fr 1fr;
	}

	}

	@media screen and (min-width: 520px) and (max-width: 959px) {

	.container {
		width:96vw;
		margin: 0 auto;
	}

	header {
		height:150px;
		display: flex;
		align-items: center;
		justify-content: center;
		background-color: lightgray;
	}
	navbar ul {
		display: grid;
  		grid-template-columns: 1fr 1fr 1fr 1fr 1fr;
  		padding-left: 0;
  		margin:0;

	}
	navbar ul li{
		box-sizing: border-box;
		list-style-type: none;
		height:50px;
		display: flex;
		align-items: center;
		justify-content: center;
		color: white;
	}

	navbar ul li:nth-of-type(1){
		background-color: red;
	}
	navbar ul li:nth-of-type(2){
		background-color: blue;
	}
	navbar ul li:nth-of-type(3){
		background-color: purple;
	}
	navbar ul li:nth-of-type(4){
		background-color: green;
	}
	navbar ul li:nth-of-type(5){
		background-color: orange;
	}

	main {
		display: grid;
  		grid-template-columns: 1fr 3fr;
	}

	#news {
		height:150px;
		display: flex;
		align-items: center;
		justify-content: center;
	}

	#sidebar {
		display: flex;
		align-items: center;
		justify-content: center;
	}

	#content {

	}

	.products {
		display: grid;
  		grid-template-columns: 1fr 1fr 1fr;
	}

	}

	@media screen and (min-width:960px) {

	.container {
		width:96vw;
		margin: 0 auto;
	}

	header {
		height:150px;
		display: flex;
		align-items: center;
		justify-content: center;
		background-color: lightgray;
	}
	navbar ul {
		display: grid;
  		grid-template-columns: 1fr 1fr 1fr 1fr 1fr;
  		padding-left: 0;
  		margin:0;

	}
	navbar ul li{
		box-sizing: border-box;
		list-style-type: none;
		height:50px;
		display: flex;
		align-items: center;
		justify-content: center;
		color: white;
	}

	navbar ul li:nth-of-type(1){
		background-color: red;
	}
	navbar ul li:nth-of-type(2){
		background-color: blue;
	}
	navbar ul li:nth-of-type(3){
		background-color: purple;
	}
	navbar ul li:nth-of-type(4){
		background-color: green;
	}
	navbar ul li:nth-of-type(5){
		background-color: orange;
	}

	main {
		display: grid;
  		grid-template-columns: 1fr 3fr;
	}

	#news {
		height:150px;
		display: flex;
		align-items: center;
		justify-content: center;
	}

	#sidebar {
		display: flex;
		align-items: center;
		justify-content: center;
	}

	#content {

	}

	.products {
		display: grid;
  		grid-template-columns: 1fr 1fr 1fr;
	}

	}
</style>
</head>
<body>
<div class="container">
	<header>
	<h1>○○商店街オンラインストア</h1>
	</header>
	<div id="img" style="height: 250px">
		<h2 style="text-align: center;">商品イメージ画像</h2>
	</div>
	<navbar>
	<ul>
		<li><div><a>○○精肉店</a></div></li>
		<li><div><a>■■鮮魚店</a></div></li>
		<li><div><a>▲▲鮮魚店</a></div></li>
		<li><div><a>☆☆八百屋</a></div></li>
		<li><div><a>◆◆喫茶店</a></div></li>
	</ul>
	</navbar>
	<div id="news">
	<h2>新着情報</h2>
	</div>
	<main>
	<div id="sidebar">
	ここにサイドバー
	</div>
	<div id="content">
		<%

		//変数定義

		Connection conn;
		Statement st1;
		Statement st2;
		Statement st3;
		Statement st4;
		Statement st5;
		String sql1;
		String sql2;
		String sql3;
		String sql4;
		String sql5;
		String sql_new;
		String sql_fvr;
		String sql_hot;
		ResultSet rs1;
		ResultSet rs2;
		ResultSet rs3;
		ResultSet rs4;
		ResultSet rs5;

		//検索キーワードを取得する

		String key = request.getParameter("key");
		if( key == null ) {
			key = "";
		}

		//データベースに接続する

		Class.forName(jdbc);
		conn = DriverManager.getConnection(url,user,pass);

		// 全データ件数を取得する

		st1 = conn.createStatement();
		st2 = conn.createStatement();
		st3 = conn.createStatement();
		st4 = conn.createStatement();
		st5 = conn.createStatement();
		sql1 = "SELECT COUNT(*) FROM seiniku1";
		sql2 = "SELECT COUNT(*) FROM sengyo1";
		sql3 = "SELECT COUNT(*) FROM sengyo2";
		sql4 = "SELECT COUNT(*) FROM yaoya1";
		sql5 = "SELECT COUNT(*) FROM kissa1";

		Statement st_new;
		Statement st_fvr;
		Statement st_hot;
		st_new = conn.createStatement();
		st_fvr = conn.createStatement();
		st_hot = conn.createStatement();
		sql_new = "SELECT COUNT(*) FROM shoutengai";
		sql_fvr = "SELECT COUNT(*) FROM shoutengai";
		sql_hot = "SELECT COUNT(*) FROM shoutengai";


		if( key.equals("") == false ) {
			sql1	+=	" WHERE pname LIKE '%" + cnvString(key) + "%'";
		}
		if( key.equals("") == false ) {
			sql2	+=	" WHERE pname LIKE '%" + cnvString(key) + "%'";
		}
		if( key.equals("") == false ) {
			sql3	+=	" WHERE pname LIKE '%" + cnvString(key) + "%'";
		}
		if( key.equals("") == false ) {
			sql4	+=	" WHERE pname LIKE '%" + cnvString(key) + "%'";
		}
		if( key.equals("") == false ) {
			sql5	+=	" WHERE pname LIKE '%" + cnvString(key) + "%'";
		}
		rs1 = st1.executeQuery(sql_new);
		rs2 = st2.executeQuery(sql_fvr);
		rs3 = st3.executeQuery(sql_hot);
		rs1.next();
		rs2.next();
		rs3.next();
		int dtcnt1 = rs1.getInt(1);
		int dtcnt2 = rs2.getInt(1);
		int dtcnt3 = rs3.getInt(1);

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

		st1 = conn.createStatement();
		st2 = conn.createStatement();
		st3 = conn.createStatement();
		st4 = conn.createStatement();
		st5 = conn.createStatement();

		sql1 = "SELECT id,pname,price,img  FROM seiniku1 ";

		sql2 = "SELECT id,pname,price,img  FROM sengyo1 ";

		sql3 = "SELECT id,pname,price,img  FROM sengyo2 ";

		sql4 = "SELECT id,pname,price,img  FROM yaoya1 ";

		sql5 = "SELECT id,pname,price,img  FROM kissa1 ";


		sql_new = "SELECT id,pname,price,img FROM shoutengai order by lasttime desc limit 3";


		sql_fvr = "SELECT id,pname,price,img FROM shoutengai order by rate asc limit 3";


		sql_hot = "SELECT id,pname,price,img FROM shoutengai order by amount asc limit 3";



		if( key.equals("") == false ) {
			sql1	+=	" WHERE pname LIKE '%" + cnvString(key) + "%'";
		}
		if( key.equals("") == false ) {
			sql2	+=	" WHERE pname LIKE '%" + cnvString(key) + "%'";
		}
		if( key.equals("") == false ) {
			sql3	+=	" WHERE pname LIKE '%" + cnvString(key) + "%'";
		}
		if( key.equals("") == false ) {
			sql4	+=	" WHERE pname LIKE '%" + cnvString(key) + "%'";
		}
		if( key.equals("") == false ) {
			sql5	+=	" WHERE pname LIKE '%" + cnvString(key) + "%'";
		}

		sql1 += " ORDER BY id DESC";
		sql2 += " ORDER BY id DESC";
		sql3 += " ORDER BY id DESC";
		sql4 += " ORDER BY id DESC";
		sql5 += " ORDER BY id DESC";
		sql1 += " LIMIT " + s + "," + lim;
		sql2 += " LIMIT " + s + "," + lim;
		sql3 += " LIMIT " + s + "," + lim;
		sql4 += " LIMIT " + s + "," + lim;
		sql5 += " LIMIT " + s + "," + lim;



		rs1 = st1.executeQuery(sql_new);
		rs2 = st2.executeQuery(sql_fvr);
		rs3 = st3.executeQuery(sql_hot);
		%>

		<h2>新着商品</h2>

		<div class="products">

			<%
			while( rs1.next() ) {
			String id1 = rs1.getString("id");
			%>

			<div class="products">
				<div class="product">
			<%
					String imgPath1 = rs1.getString("img");
					if( imgPath1 == null || imgPath1.equals("") ) {
						imgPath1 = "print.gif";
					}
			%>
					<img src="images/<%= imgPath1 %>" width="150" height="150" />

					<%=rs1.getString("pname")%> <br>
					<%=toYenStr(rs1.getInt("price"))%> <br>
					<form method="post" action="detail.jsp">
						<input type="submit" value="詳細">
						<input type="hidden" name="id" value="<%=id1%>">
					</form>
					<br>
				</div>
			</div>
			<% } %>

		</div>

		<h2>オススメ商品</h2>

		<div class="products">

			<%
			while( rs2.next() ) {
			String id2 = rs2.getString("id");
			%>

			<div class="products">
				<div class="product">
			<%
					String imgPath2 = rs2.getString("img");
					if( imgPath2 == null || imgPath2.equals("") ) {
						imgPath2 = "print.gif";
					}
			%>
					<img src="images/<%= imgPath2 %>" width="150" height="150" />

					<%=rs2.getString("pname")%> <br>
					<%=toYenStr(rs2.getInt("price"))%> <br>
					<form method="post" action="detail.jsp">
						<input type="submit" value="詳細">
						<input type="hidden" name="id" value="<%=id2%>">
					</form>
					<br>
				</div>
			</div>
			<% } %>

		</div>

		<h2>売れ筋商品</h2>

		<div class="products">

			<%
			while( rs3.next() ) {
			String id3 = rs3.getString("id");
			%>

			<div class="products">
				<div class="product">
			<%
					String imgPath3 = rs3.getString("img");
					if( imgPath3 == null || imgPath3.equals("") ) {
						imgPath3 = "print.gif";
					}
			%>
					<img src="images/<%= imgPath3 %>" width="150" height="150" />

					<%=rs3.getString("pname")%> <br>
					<%=toYenStr(rs3.getInt("price"))%> <br>
					<form method="post" action="detail.jsp">
						<input type="submit" value="詳細">
						<input type="hidden" name="id" value="<%=id3%>">
					</form>
					<br>
				</div>
			</div>
			<% } %>

		</div>

	</div>
	<% conn.close(); %>
	</main>
	<a href="buyindex.jsp">商品一覧へ</a>
</div>
<footer>

</footer>
</body>
</html>