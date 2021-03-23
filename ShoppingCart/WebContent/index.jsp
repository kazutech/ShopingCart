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


	.search {
		display:flex;
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
	.search {
		display: flex;
		flex-direction: row;
		flex-wrap: wrap;
	}

	.search div {
		margin-right: 10px;
	}
	}
</style>
</head>
<body>
<%

		//変数定義

		Connection conn;
		Statement st;
		Statement st1;
		Statement st2;
		Statement st3;
		String sql;
		String sql_new;
		String sql_fvr;
		String sql_hot;
		ResultSet rs;
		ResultSet rs1;
		ResultSet rs2;
		ResultSet rs3;

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
		sql = "SELECT COUNT(*) FROM shoutengai";

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
		st1 = conn.createStatement();
		st2 = conn.createStatement();
		st3 = conn.createStatement();

		sql = "SELECT id,pname,price,img  FROM shoutengai ";

		sql_new = sql + "order by lasttime desc limit 3";

		sql_fvr = sql + "order by rate asc limit 3";

		sql_hot = sql + "order by amount asc limit 3";

		//Navbarでクエリ
		String shopNum = request.getParameter("shopNum");

		if( key.equals("") == false ) {
			sql	+=	" WHERE pname LIKE '%" + cnvString(key) + "%'";
		}

		sql += " ORDER BY id DESC";
		sql += " LIMIT " + s + "," + lim;



		rs = st.executeQuery(sql);
		rs1 = st1.executeQuery(sql_new);
		rs2 = st2.executeQuery(sql_fvr);
		rs3 = st3.executeQuery(sql_hot);


		%>
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
	<h2>新着情報</h2>
	</div>
	<main>
	<div id="sidebar">
		<%-- 検索キーワード用テキストボックス --%>

	<table>
	<tr>
		<form method="post" action="<%=request.getRequestURI()%>">
			<td><input type="text" size="12" name="key" value="<%=cnvString(key)%>"></td>
			<td><input type="submit" value="検索" name="sub1"></td>
		</form>
	</tr>
	</table>
	<br>
	</div>
	<div id="content">

		<%
			if(request.getParameter("sub1") == null) {
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
						<input type="submit" value="商品ページへ">
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
						<input type="submit" value="商品ページへ">
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
						<input type="submit" value="商品ページへ">
						<input type="hidden" name="id" value="<%=id3%>">
					</form>
					<br>
				</div>
			</div>
			<% }
			%>

		</div>
		<%
			} else {
		%>
			<div class="search">

				<%
				while( rs.next() ) {
				String id = rs.getString("id");
				%>
					<div>
						<div class="product">
				<%
						String imgPath = rs.getString("img");
						if( imgPath == null || imgPath.equals("") ) {
							imgPath = "print.gif";
						}
				%>
						<img src="images/<%= imgPath %>" width="150" height="150" /><br>

						<%=rs.getString("pname")%> <br>
						<%=toYenStr(rs.getInt("price"))%> <br>
						<form method="post" action="detail.jsp">
							<input type="submit" value="商品ページへ">
							<input type="hidden" name="id" value="<%=id%>">
						</form>
						<br>
						</div>
					</div>
					<%
				}
					%>
			</div>
		<%
			}
		%>
	</div>
	<% conn.close(); %>
	</main>
	<br>
	<a href="index.jsp">トップページへ</a>
</div>
<footer>

</footer>
</body>
</html>