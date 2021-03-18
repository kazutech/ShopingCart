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
	div.d_center{
		width: 400px;
		margin: 0 auto;
	}
	th {
		background-color: ffcc00;
	}
	.bar {
		background-color: ffcc00;
	}

</style>
</head>
<body>
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
</body>
</html>