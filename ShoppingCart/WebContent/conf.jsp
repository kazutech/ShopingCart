<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="bean.*"%>
<jsp:useBean id="cart" scope="session" type="bean.Cart" />
<%@ include file="class.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>注文内容確認画面</title>
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
	}"

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
<h3>注文内容確認画面</h3>
<%
	boolean isError = false;	// 入力に問題があったら true

	// パラメータの読み込み
	String namae = request.getParameter("namae");
	if( namae == null || namae.equals("") ) {
		isError = true;
		namae = "入力されていません";
	} else {
		namae = cnvString(namae);
	}

	String number = request.getParameter("number");
	if( number == null || number.equals("") ) {
		isError = true;
		number = "入力されていません";
	} else {
		number = cnvString(number);
	}

	String address = request.getParameter("address");
	if( address == null || address.equals("") ) {
		isError = true;
		address = "入力されていません";
	} else {
		address = cnvString(address);
	}

	String tel = request.getParameter("tel");
	if( tel == null || tel.equals("") ) {
		isError = true;
		tel = "入力されていません";
	} else {
		tel = cnvString(tel);
	}

	String mail = request.getParameter("mail");
	if( mail == null || mail.equals("") ) {
		isError = true;
		mail = "入力されていません";
	} else {
		mail = cnvString(mail);
	}
%>
<table border="1">
	<tr>
		<th>お名前</th>
		<td><%=namae%></td>
	</tr>
	<tr>
		<th>郵便番号</th>
		<td><%=number%></td>
	</tr>
	<tr>
		<th>住所</th>
		<td><%=address%></td>
	</tr>
	<tr>
		<th>電話番号</th>
		<td><%=tel%></td>
	</tr>
	<tr>
		<th>メールアドレス</th>
		<td><%=mail%></td>
	</tr>
</table>
<table border="1">
	<tr class="bar">
		<th>商品名</th>
		<th>数量</th>
		<th>金額</th>
	</tr>
<%
	int totalPrice = 0;

	MyItem[] items = cart.getStat();
	if( items == null ) {
		isError = true;
	} else {
		for(int i=0;i<items.length;i++) {
			int subPrice = items[i].getPrice() * items[i].getCount();
			totalPrice += subPrice;
%>
			<tr>
				<td><%= items[i].getName() %></td>
				<td><%= items[i].getCount() %></td>
				<td><%= toYenStr(subPrice) %></td>
			</tr>
<%
		}
	}
%>
	<tr class="bar">
		<td>&nbsp;</td>
		<td>合計</td>
		<td><%= toYenStr(totalPrice) %></td>
	</tr>
</table>
<%
if( isError ) {
%>
	<p>入力が異常です。</p>
<%
} else {
%>
	<form method="post" action="order.jsp">
		<input type="submit" value="注文する">
		<input type="hidden" name="namae" value="<%=namae%>"></td>
		<input type="hidden" name="number" value="<%=number%>"></td>
		<input type="hidden" name="address" value="<%=address%>"></td>
		<input type="hidden" name="tel" value="<%=tel%>"></td>
		<input type="hidden" name="mail" value="<%=mail%>"></td>
	</form>
<%
}
%>

</div>
</main>
</body>
</html>