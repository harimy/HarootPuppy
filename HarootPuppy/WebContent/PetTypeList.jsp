<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AjaxTest05.jsp</title>
<link rel="stylesheet" href="<%=cp%>/css/main.css">
<style type="text/css">
#search {
	width: 500px;
}

#list {
	border: 1px solid gray;
	width: 500px;
	position: absolute;
	left: 70px;
	top: 134px;
	display: none;
}

#list.item {
	padding: 3px;
}

#list #footer {
	background-color: #DDD;
	text-align: right;
	padding: 5px;
	font-size: small;
}
</style>

<script type="text/javascript" src="<%=cp%>/js/ajax.js"></script>
<script type="text/javascript">
	request.setCharacterEncoding("UTF-8");
	String
	value = request.getParameter("value");
	JSONArray
	list = new JSONArray();
	JSONObject
	object = null;

	if (value.indexOf("개발") > -1)
	{
		object = new JSONObject();
		object.put("data", "개발자");
		list.add(object);
		object = new JSONObject();
		object.put("data", "개발로짜");
		list.add(object);
		object = new JSONObject();
		object.put("data", "개발이 어려워요");
		list.add(object);
		object = new JSONObject();
		object.put("data", "개발이란?");
		list.add(object);
	} else if (value.indexOf("블로") > -1)
	{
		object = new JSONObject();
		object.put("data", "블로그꾸미기");
		list.add(object);
		object = new JSONObject();
		object.put("data", "블로그누락");
		list.add(object);
		object = new JSONObject();
		object.put("data", "개발로짜의블로그");
		list.add(object);
		object = new JSONObject();
		object.put("data", "블로장생");
		list.add(object);
	}

	PrintWriter
	pw = response.getWriter();
	pw.print(list);
	pw.flush();
	pw.close();

	출처: https://hellogk.tistory.com/74 [IT Code Storage]
</script>
</head>
<body>
</body>
</html>