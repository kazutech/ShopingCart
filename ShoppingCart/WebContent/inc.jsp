<%@ page contentType="text/html; charset=UTF-8" %>
<%-- 各種設定 --%>
<%!
String jdbc = "com.mysql.cj.jdbc.Driver";
String sv = "localhost";
String db = "sns";
String user = "root";
String pass = "root";
String url = "jdbc:mysql://" + sv + ":3306/" + db
			+ "?characterEncoding=utf8&useSSL=false&"
			+ "serverTimezone=GMT%2B9:00&rewriteBatchedStatements=true";

// 画面上に表示する項目名
String idDisp = "商品ID";
String pnameDisp = "商品名";
String priceDisp = "値段";
String imgDisp = "画像ファイル名";

int lim = 5;
%>
