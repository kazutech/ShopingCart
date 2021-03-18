<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "java.io.*"
	import = "javax.servlet.*"
	import = "javax.servlet.http.*"
	import = "java.text.SimpleDateFormat"
	import = "java.util.Date"
	import = "javax.servlet.http.HttpServletRequest"
	import = "bean.MyItem"
%>
<%@ include file="inc.jsp" %>
<%@ include file="class.jsp" %>

<jsp:useBean id="cart" scope="session" class="bean.Cart" />

	<%--注文完了--%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	body{
		background-color: #ffff99;
	}
	div.d_center{
		width: 400px;
		margin: 0 auto;
	}
</style>
<title>注文完了</title>
</head>
<body>
			<div class="d_center">
				ご注文を承りました。<br><br>
				ご利用ありがとうございました。<br>
				またのご利用を心よりお待ちしております。<br>


			<%
				try{
					Date d = new Date();
					SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
					sdf.format(d);

					FileWriter txt = new FileWriter("C:\\ショッピング課題サーブレットJSP\\" + sdf.format(d) + ".txt");

/*
					//商品
					String id       = request.getParameter("id");            //ＩＤ
					String name     = request.getParameter("name");          //商品名
					int price       = Integer.parseInt(request.getParameter("id"));      //単価
					int count       = Integer.parseInt(request.getParameter("count"));   //数量
*/
					//お客様情報
					String namae    = cnvString( request.getParameter("namae") );	//名前
					String number   = cnvString( request.getParameter("number") );	//郵便番号
					String address  = cnvString( request.getParameter("address") );	//住所
					String tel      = cnvString( request.getParameter("tel") );		//電話番号
					String mail     = cnvString( request.getParameter("mail") );	//メールアドレス

					int totalPrice = 0;

					MyItem[] items = cart.getStat();
					for(int i=0;i<items.length;i++) {

						int subTotal = items[i].getCount() * items[i].getPrice();
						totalPrice += subTotal;

						txt.write("商品ID：");
						txt.write(items[i].getId() + "\n");

						txt.write("商品名：");
						txt.write(items[i].getName() + "\n");

						txt.write("価　格：");
						txt.write(items[i].getPrice() + "\n");

						txt.write("数　量：");
						txt.write(items[i].getCount() + "\n");

						txt.write("-------------------"+ "\n" + "小　計：");
						txt.write(subTotal + "\n" + "-------------------");

						txt.write("\n");
					}

					txt.write("===================" + "\n" + "合計金額：");

					txt.write(totalPrice + "\n" + "===================");

					txt.write("\n");

					txt.write("お客様名：");
					txt.write(namae + "\n");

					txt.write("郵便番号：");
					txt.write(number + "\n");

					txt.write("住　　所：");
					txt.write(address + "\n");

					txt.write("電話番号：");
					txt.write(tel + "\n");

					txt.write("メールアドレス：");
					txt.write(mail + "\n");

					txt.close();

					cart.clearAll();	// カートの中身を空に
			   }
		   		catch(Exception e){
					System.out.println(e);
		      }



			%>



			<br><br>
			<table border="0">
			<tr>
			<form method="POST" action="buyindex.jsp">
			<td><input type="submit" value="買い物トップページへ" name="top"></td>
			</form>
			</tr>
			</table>
			</div>
</body>
</html>