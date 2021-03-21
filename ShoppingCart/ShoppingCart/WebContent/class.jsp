<%@ page language="java" import="java.text.NumberFormat" %>
<%!

public static String toYenStr(String s) {
/*
	try {
		return new String ("\\" + s);
	}
	catch(Exception e) {
		return null;
	}
*/
	return toYenStr( Integer.parseInt(s) );
}

// カンマ区切り対応（追加：武部）
public static String toYenStr(int num) {
	try {
		return NumberFormat.getCurrencyInstance().format(num);
	}
	catch(Exception e) {
		return null;
	}
}

public static String cnvString(String s) {
	try {
		//return new String(s.getBytes("8859_1"), "JISAutoDetect");
		return new String(s.getBytes("8859_1"), "UTF-8");
	}
	catch(Exception e) {
		return null;
	}

}

%>
