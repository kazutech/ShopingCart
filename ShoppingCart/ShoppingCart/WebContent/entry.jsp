<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="inc.jsp" %>
<%@ include file="class.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>入力画面</title>
<style>
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
	<main>
	<div id="sidebar">
	ここにサイドバー
	</div>
	<div id="content">
	<h3>お客様情報入力画面</h3>

	<%
		String namae = request.getParameter("namae");
		if(namae == null) {
			namae = ""; }
		String number = request.getParameter("number");
		if(number == null) {
			number = ""; }
		String address = request.getParameter("address");
		if(address == null) {
			address = ""; }
		String tel = request.getParameter("tel");
		if(tel == null) {
			tel = ""; }
		String mail = request.getParameter("mail");
		if(mail == null) {
			mail = ""; }
		String shopNum = request.getParameter("shopNum");
		if(shopNum == null) {
			shopNum = ""; }
	%>

		<form method="POST" action="conf.jsp">
		<table border="1">

			<tr>
			<td>お名前</td>
			<td><input type="text" name="namae" value="<%=namae%>" required></td>
			</tr>

			<tr>
			<td>郵便番号</td>
			<td><input type="text" name="number" value="<%=number%>" required></td>
			</tr>

			<tr>
			<td>住所</td>
			<td><input type="text" name="address" value="<%=address%>" required></td>
			</tr>

			<tr>
			<td>電話番号</td>
			<td><input type="text" name="tel" value="<%=tel%>" required></td>
			</tr>

			<tr>
			<td>メールアドレス</td>
			<td><input type="text" name="mail" value="<%=mail%>" required></td>
			</tr>
		</table>
		<p>
		<input type="submit" value="確認" name="B1"></p>
		</form>
</div>
</main>
</body>
</html>