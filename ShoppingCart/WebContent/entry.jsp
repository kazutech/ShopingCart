<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="inc.jsp" %>
<%@ include file="class.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>入力画面</title>
</head>
<body>
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
	%>

		<form method="POST" action="conf.jsp">
		<table border="1">

			<tr>
			<td>お名前</td>
			<td><input type="text" name="namae" value="<%=namae%>"></td>
			</tr>

			<tr>
			<td>郵便番号</td>
			<td><input type="text" name="number" value="<%=number%>"></td>
			</tr>

			<tr>
			<td>住所</td>
			<td><input type="text" name="address" value="<%=address%>"></td>
			</tr>

			<tr>
			<td>電話番号</td>
			<td><input type="text" name="tel" value="<%=tel%>"></td>
			</tr>

			<tr>
			<td>メールアドレス</td>
			<td><input type="text" name="mail" value="<%=mail%>"></td>
			</tr>
		</table>
		<p><input type="submit" value="確認" name="B1"></p>
		</form>


</body>
</html>