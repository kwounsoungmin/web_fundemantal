<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>
jsp comment
</h1>
<!-- html주석  소스보기로 다보여 -->
<%--jsp주석 소스보기로해도 안보임. --%>
<ul>
<%
for(int i=0;i<100;i++){
	out.println("<li>"+i+"</li>");
}
%>
<li>

</ul>
</body>
</html>