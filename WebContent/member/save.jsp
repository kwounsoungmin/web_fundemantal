<%@page import="kr.co.acorn.dao.MemberDao"%>
<%@page import="kr.co.acorn.dto.EmpDto"%>
<%@page import="kr.co.acorn.dao.EmpDao"%>
<%@page import="kr.co.acorn.dto.MemberDto"%>
<%@ page pageEncoding="utf-8" %>

<%
	request.setCharacterEncoding("utf-8");
	int no = Integer.parseInt(request.getParameter("no"));
	String email = request.getParameter("m_email");
	String name = request.getParameter("m_name");
	String password = request.getParameter("m_pwd");
	String phone = request.getParameter("m_phone");
	String regdate = request.getParameter("m_regdate");
	
	
	
	MemberDto dto = new MemberDto(email,name,password,phone,regdate);
	MemberDao dao = MemberDao.getInstance();
	boolean isSuccess = dao.insert(dto);
	
	if(isSuccess){
%>
<script>
	alert('회원이 등록 되었습니다.');
	location.href="list.jsp?page=1";
</script>
<%}else{ %>
<script>
	alert('DB Error');
	history.back(-1);
</script>
<%} %>

  
  
  
  
  