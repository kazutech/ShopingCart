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
	body{
		background-color: #ffff99;
	}

	#img {
		background-image: url("images/shoutengai.jpg");
	}


	@media screen and (max-width: 519px) {

	.container {
		width: 96vw;
		margin: 0 auto;
	}

	header div{
		height:75px;
		display: flex;
		align-items: center;
		justify-content: center;
		background-color: lightgray;
		color:yellow;
		font-size:150%;
		font-weight:bold;
		line-height:75px;
		width:100%;
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

	header div{
		height:150px;
		display: flex;
		align-items: center;
		justify-content: center;
		background-color: lightgray;
		color:yellow;
		font-size:200%;
		font-weight:bold;
		line-height:150px;
		width:100%;
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

	header div {
		height:150px;
		display: flex;
		align-items: center;
		justify-content: center;
		background-color: lightgray;
		color:yellow;
		font-size:250%;
		font-weight:bold;
		line-height:150px;
		width:100%;
	}
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
	<div id="img" style="">
		<form name="top" action="index.jsp" method="post">
			<a href="index.jsp" onclick="document.top.submit();return false;"
			style="text-decoration:none;color:yellow;
			display: block;">○○商店街オンラインストア
			</a>
		</form>
	</div>
	</header>
	<navbar>
	<ul>
		<li>
		<div style="height:50px;line-height: 50px; width:100%; text-align:center;">
		<form name="seiniku1" action="shop.jsp" method="post">
			<input type="hidden" name="shopNum" value=1>
			<a href="shop.jsp" onclick="document.seiniku1.submit();return false;"
			style="text-decoration:none; color:white;
			display: block;">○○精肉店</a>
		</form>
		</div>
		</li>

		<li>
		<div style="height:50px;line-height: 50px; width:100%; text-align:center;">
		<form name="sengyo1" action="shop.jsp" method="post">
			<input type="hidden" name="shopNum" value=2>
			<a href="shop.jsp" onclick="document.sengyo1.submit();return false;"
			style="text-decoration:none; color:white;
			display: block;">■■鮮魚店</a>
		</form>
		</div>
		</li>

		<li>
		<div style="height:50px;line-height: 50px; width:100%; text-align:center;">
		<form name="sengyo2" action="shop.jsp" method="post">
			<input type="hidden" name="shopNum" value=3>
			<a href="shop.jsp" onclick="document.sengyo2.submit();return false;"
			style="text-decoration:none; color:white;
			display: block;">▲▲鮮魚店</a>
		</form>
		</div>
		</li>

		<li>
		<div style="height:50px;line-height: 50px; width:100%; text-align:center;">
		<form name="yaoya1" action="shop.jsp" method="post">
			<input type="hidden" name="shopNum" value=4>
			<a href="shop.jsp" onclick="document.yaoya1.submit();return false;"
			style="text-decoration:none; color:white;
			display: block;">☆☆八百屋</a>
		</form>
		</div>
		</li>

		<li>
		<div style="height:50px;line-height: 50px; width:100%; text-align:center;">
		<form name="kissa1" action="shop.jsp" method="post">
			<input type="hidden" name="shopNum" value=5>
			<a href="shop.jsp" onclick="document.kissa1.submit();return false;"
			style="text-decoration:none; color:white;
			display: block;">◆◆喫茶店</a>
		</form>
		</div>
		</li>
	</ul>
	</navbar>
	<div id="news">
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
		Statement st;
		String sql1;
		String sql2;
		String sql3;
		String sql4;
		String sql;
		String sql_new;
		String sql_fvr;
		String sql_hot;
		ResultSet rs1;
		ResultSet rs2;
		ResultSet rs3;
		ResultSet rs4;
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

		st1 = conn.createStatement();
		st2 = conn.createStatement();
		st3 = conn.createStatement();
		st4 = conn.createStatement();
		st = conn.createStatement();
		sql1 = "SELECT COUNT(*) FROM seiniku1";
		sql2 = "SELECT COUNT(*) FROM sengyo1";
		sql3 = "SELECT COUNT(*) FROM sengyo2";
		sql4 = "SELECT COUNT(*) FROM yaoya1";
		sql = "SELECT COUNT(*) FROM shoutengai";

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
			sql	+=	" WHERE pname LIKE '%" + cnvString(key) + "%'";
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

		st = conn.createStatement();

		sql = "SELECT id,pname,price,img FROM shoutengai ";

		//Navbarでクエリ
		String shopNum = request.getParameter("shopNum");

		sql	+=	"WHERE shopNum = " + shopNum;

		sql += " ORDER BY id ASC";

		rs = st.executeQuery(sql);


		%>

		<h2>商品一覧</h2>

		<div class="products">

			<%

			while( rs.next() ) {
			String id = rs.getString("id");
			%>

			<div class="products">
				<div class="product">
			<%
					String imgPath = rs.getString("img");
					if( imgPath == null || imgPath.equals("") ) {
						imgPath = "print.gif";
					}
			%>
					<img src="images/<%= imgPath %>" width="150" height="150" />

					<%=rs.getString("pname")%> <br>
					<%=toYenStr(rs.getInt("price"))%> <br>
					<form method="post" action="detail.jsp">
						<input type="submit" value="商品ページへ">
						<input type="hidden" name="id" value="<%=id%>">
					</form>
					<br>
				</div>
			</div>
			<% } %>

		</div>

	</div>
	<% conn.close(); %>
	</main>
</div>
<footer>

</footer>
</body>
</html>