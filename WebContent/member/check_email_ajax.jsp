<%@page import="org.json.simple.JSONObject"%>
<%@page import="kr.co.acorn.dao.MemberDao"%>
<%@ page contentType="application/json; charset=utf-8" %>

<%
	String email = request.getParameter("email");
	MemberDao dao = MemberDao.getInstance();
	boolean isExisted = dao.isEmail(email);			// 이미 있으면 true
	JSONObject obj = new JSONObject();
	if(isExisted) {
		obj.put("result","fail");
	}else {
		obj.put("result","ok");
	}
	out.print(obj.toString());
%>