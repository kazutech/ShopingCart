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
	div.d_center{
		width: 400px;
		margin: 0 auto;
	}
	.bar {
		background-color: ffcc00;
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
case 3:	// 変更モード
	try {
		count = Integer.parseInt(request.getParameter("count"));
	} catch (NumberFormatException e)
	{
%>
		<p>数量に数値以外が指定されました。</p>
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
	String sql = "SELECT * FROM product1 where id = " + id;
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

<h3>カートの商品</h3>
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
					<td><input type="text" name="count" value="<%= items[i].getCount() %>" /></td>
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
		<form method="post" action="buyindex.jsp">
			<td colspan="<%= cspan %>"><input type="submit" value="買い物を続ける" /></td>
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
</body>
</html>