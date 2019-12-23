<%@page import="kr.co.acorn.dao.MemberDao"%>
<%@page import="kr.co.acorn.dto.MemberDto"%>
<%@page import="kr.co.acorn.dto.DeptDto"%>
<%@page import="kr.co.acorn.dto.EmpDto"%>
<%@page import="kr.co.acorn.dao.EmpDao"%>
<%@ page pageEncoding="utf-8" %>
<%
	request.setCharacterEncoding("utf-8");

int no = Integer.parseInt(request.getParameter("no"));
String email = request.getParameter("m_email");
String name = request.getParameter("m_name");
String password = request.getParameter("m_pwd");
String phone = request.getParameter("m_phone");
String regdate = request.getParameter("m_regdate");
	String tempPage = request.getParameter("page");
	
	//MemberDto MemberDto = new MemberDto(email,null,null);
	
	MemberDao dao = MemberDao.getInstance();
	MemberDto dto = new MemberDto(email,name,password,phone,regdate);
	boolean isSuccess = dao.update(dto);
	if(isSuccess){
%>
	<script>
	alert('회원정보가 수정되었습니다.');
	location.href="view.jsp?page=<%=tempPage%>&no=<%=no%>";
	</script>
<%	}else{ %>
	<script>
	alert('DB Error');
	history.back(-1);
	</script>
<%	} %>


