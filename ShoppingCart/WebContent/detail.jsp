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
	body{
		background-color: #ffff99;
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
		font-size:75%;
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

	header div{
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
		int shopNum = rs.getInt("shopNum");
		int amount = rs.getInt("amount");

	%>
<div class="container">
	<header>
	<div id="img" style="height:100%; width:100%;">
	<h1>○○商店街オンラインストア</h1>
	</div>
	</header>
	<navbar>
	<%


		switch(shopNum) {
			case 1:
				out.println("<div style=\"background-color:red;\ndisplay:flex;\nalign-items:center;\njustify-content:center;\ncolor:white;\nheight:50px;\"><a>○○精肉店</a></div>");
				break;
			case 2:
				out.println("<div style=\"background-color:blue;\ndisplay:flex;\nalign-items:center;\njustify-content:center;\ncolor:white;\nheight:50px;\"><a>■■鮮魚店</a></div>");
				break;
			case 3:
				out.println("<div style=\"background-color:purple;\ndisplay:flex;\nalign-items:center;\njustify-content:center;\ncolor:white;\nheight:50px;\"><a>▲▲鮮魚店</a></div>");
				break;
			case 4:
				out.println("<div style=\"background-color:green;\ndisplay:flex;\nalign-items:center;\njustify-content:center;\ncolor:white;\nheight:50px;\"><a>☆☆八百屋</a></div>");
				break;
			case 5:
				out.println("<div style=\"background-color:yellow;\ndisplay:flex;\nalign-items:center;\njustify-content:center;\ncolor:black;\nheight:50px;\"><a>◆◆喫茶店</a></div>");
				break;
			default:
				out.println("");
				break;
		}
	%>
	</navbar>
	<main>
	<div id="sidebar">
	ここにサイドバー
	</div>
	<div id="content">

<%--	<h3>商品詳細表示</h3> --%>


<%
		if( img==null || img.equals("") ){
			img = "print.gif";
		}
%>

		<div id="detail">
			<div id="detail_image">
				<img src="images/<%=img%>" alt="<%=img%>" width="150" height="150">
				<p></p>
			</div>
			<div id="detail_content">
				<form method="post" action="cart.jsp">
					<%=pname%><br>
					<p>価格: <%= toYenStr(price) %></p>
					<p>数量
					<select name="count">
					<%
						for(int i=1; i<= amount; i++) {
							out.println("<option value=\""+i+"\" >"+i+"</option>");
						}
					%>
					</select>
					<br><input type="submit" value="カートに入れる" name=""></p>
					<input type="hidden" name="mode" value="1" />
					<input type="hidden" name="id" value="<%=id%>">
				</form>
				<form method="post" action="cart.jsp">
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