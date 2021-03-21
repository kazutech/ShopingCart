<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*,bean.*"%>
<jsp:useBean id="cart" scope="session" class="bean.Cart" />
<%@ include file="inc.jsp" %>
<%@ include file="class.jsp" %>

<%-- カートを表示、数量変更、削除 --%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>カートの商品を表示</title>
<style>
	body{
		background-color: #ffff99;
	}

	#img {
		background-image: url("images/shoutengai.jpg");
	}
	#detail {
		display: grid;
  		grid-template-columns: 3fr 2fr;
  		padding-left: 0;
  		margin:0;
	}
	#detail_image {
		display: flex;
		align-items: center;
		justify-content: center;
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
		font-size:75%;
	}

	#img {
		background-image: url("images/shoutengai.jpg");
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
		font-size:120%;
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
		color:yellow;
		font-size:150%;
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
<%
// モードの取得
int mode = 0;
try {
	mode = Integer.parseInt(request.getParameter("mode"));
}
catch ( Exception e ) {
	mode = 0;
}
if( mode < 0 || 3 < mode ) {
	mode = 0;
}

// ID の取得
int id = 0;
switch( mode ) {
case 1:	// 追加モード
case 2: // 削除モード
case 3:	// 変更モード
	id = Integer.parseInt(request.getParameter("id"));
}

// 数量の取得
int count = 0;
switch( mode ) {
case 1:	// 追加モード
	try {
		count = Integer.parseInt(request.getParameter("count"));
	} catch (NumberFormatException e){
		mode = 0;
	}


case 3:	// 変更モード
	try {
		count = Integer.parseInt(request.getParameter("count"));
	} catch (NumberFormatException e)
	{
%>
<%
		mode = 0;	// 表示モードに切り替え
	}
}

// 事前処理（追加）
if( mode == 1 ) {

	// データベースからデータを取得
	Class.forName(jdbc);
	Connection conn = DriverManager.getConnection(url,user,pass);
	Statement st = conn.createStatement();
	String sql = "SELECT * FROM shoutengai where id = " + id;
	ResultSet rs = st.executeQuery(sql);

	// アイテムの追加
	if( rs.next() ) {
		MyItem item = new MyItem();
		item.setId(id);
		item.setName( rs.getString("pname") );
		item.setPrice( Integer.parseInt( rs.getString("price") ) );
		item.setCount( count );

		cart.add(item);

		rs.close();
		st.close();
		conn.close();
	}
}

// 事前処理（削除）
if( mode == 2 ) {
	cart.delete(id);
}

// 事前処理（変更）
if( mode == 3 ) {
	cart.change(id,count);
}
%>

<%
		Connection conn;
		Statement st;
		String sql;
		ResultSet rs;

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
		int shopNum = rs.getInt("shopNum");
		int amount = rs.getInt("amount");

	%>
<div class="container">
	<header>
	<div id="img" style="height:100%; width:100%;">
	<h1>○○商店街オンラインストア</h1>
	</div>
	</header>
	<main>
	<div id="sidebar">
	ここにサイドバー
	</div>
	<div id="content">
	<table border="1">
	<tr class="bar">
		<th colspan="2">商品名</th>
		<th colspan="2">数量</th>
		<th>金額</th>
	</tr>
<%
	int totalPrice = 0;

	MyItem[] items = cart.getStat();
	if( items == null ) {
%>
		<tr>
			<td colspan="5">カートは空です。</td>
		</tr>
<%
	} else
	{
		for(int i=0;i<items.length;i++) {
			int subPrice = items[i].getPrice() * items[i].getCount();
			totalPrice += subPrice;
%>
			<tr>
				<form method="post" action="<%= request.getRequestURI() %>">
					<td><input type="submit" value="削除" /></td>
					<input type="hidden" name="mode" value="2" />
					<input type="hidden" name="id" value="<%= items[i].getId() %>" />
				</form>
				<td><%= items[i].getName() %></td>
				<form method="post" action="<%= request.getRequestURI() %>">
					<td>
					<input type="text" name="count" value="<%= items[i].getCount() %>" />
					</td>
					<td><input type="submit" value="数量変更" /></td>
					<input type="hidden" name="mode" value="3" />
					<input type="hidden" name="id" value="<%= items[i].getId() %>" />
				</form>
				<td><%= toYenStr(subPrice) %></td>
			</tr>
<%
		}
	}
%>
	<tr class="bar">
		<td colspan="2">&nbsp;</td>
		<td colspan="2">合計</td>
		<td><%= toYenStr(totalPrice) %></td>
	</tr>
	<tr>
<%
		int cspan;
		if( items == null )
			cspan = 5;
		else
			cspan = 2;
%>
		<form method="post" action="index.jsp">
			<td colspan="<%= cspan %>"><input type="submit" value="買い物を続ける" /></td>
			<input type="hidden" name="shopNum" value=<%= shopNum %>/>
		</form>
<%
		if( items != null ) {
%>
			<form method="post" action="entry.jsp">
				<td colspan="3"><input type="submit" value="レジに進む" /></td>
			</form>
<%
		}
%>
	</tr>
</table>
</div>
</main>
</div>
</body>
</html>