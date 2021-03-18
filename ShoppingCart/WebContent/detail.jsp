<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<%@ include file="inc.jsp" %>
<%@ include file="class.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<title>商品詳細表示</title>
<style>
	div.d_center{
		width: 400px;
		margin: 0 auto;
	}

	#detail {
		display: grid;
  		grid-template-columns: 3fr 2fr;
  		padding-left: 0;
  		margin:0;
	}

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
	<main>
	<div id="sidebar">
	ここにサイドバー
	</div>
	<div id="content">

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


		Statement st_getlim;
		String sql_getlim;
		ResultSet rs_getlim;
		sql_getlim = "Select amount from shoutengai where id =" + id;
		st_getlim = conn.createStatement();
		rs_getlim = st_getlim.executeQuery(sql_getlim);

	%>
<%
		if( img==null || img.equals("") ){
			img = "print.gif";
		}
%>

		<div id="detail">
			<div id="detail_image">
				<img src="<%=img%>" alt="<%=img%>" width="150" height="150">
				<p></p>
			</div>
			<div id="detail_content">
				<form method="post" action="cart.jsp">
				<%=pname%></br>
				<p>価格: <%= toYenStr(price) %></p>
				<p>数量<input type="text" name="count" value="1" size="1" max="<%=rs_getlim%>"><br><input type="submit" value="カートに入れる" name=""></p>
				<input type="hidden" name="mode" value="1" />
				<input type="hidden" name="id" value="<%=id%>">
				<input type="submit" value="カートの中身を表示" name="sub1">
				<input type="hidden" name="mode" value="0" />
			</form>
			</div>
		</div>


	<% conn.close(); %>

	</div>
	</main>
	<a href="index.jsp">トップページへ</a>
</div>
<footer>

</footer>
</body>
</html>