<%@ page pageEncoding="utf-8" %>
<%@ include file="../inc/header.jsp" %>  
<%
	/*
	httpSession 체를 종료하는 방법
	1.브라우저를 종료했을 경우.
	2.해당 페이지의 시간이 세션만료 시간을 경과했을 경우
	3.inclidate() 매서드 를 호출하는 경우
	
	세션이란 그페이지에 머무는동안 정보를 유지하는시간 은행권의 경우 세션은 10분정도로 지나면 로그아웃되는거있다.
	새션이 만료됬다는것은 제이섹션 아이디값이 1234였던걸 그객체를 날려서 1236으로바꾸어 못팢게함.
	*/
	//session.removeAttribute("member");// 섹션 객체를 유지하고 그안에 값만나림 장바구니비우기.
	session.invalidate();
	response.sendRedirect("index.jsp");
%>