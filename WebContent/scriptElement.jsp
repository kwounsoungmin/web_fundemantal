<%-- scrpitelement.jsp --%>
<%@ page pageEncoding= "utf-8" %>
l<%--클래스안이라 자바변수 선언이가능함.  --%>
<%!
private String name;
private String id;
private int plus(int a, int b){
	return a+b;
}

%>

<%
out.println("1+2="+plus(1,2)+"<br>");

%>
1+2 = <%= plus(1,2)%>
<br>