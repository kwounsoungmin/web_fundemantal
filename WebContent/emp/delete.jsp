<%@page import="kr.co.acorn.dao.DeptDao"%>
<%@page import="kr.co.acorn.dto.DeptDto"%>
<%@ page pageEncoding="utf-8"%>
<%
	String tempPage = request.getParameter("page");
	request.setCharacterEncoding("utf-8");
	int no = Integer.parseInt(request.getParameter("no"));
	
	DeptDao dao = DeptDao.getInstance();
	boolean isSuccess = dao.delete(no);
	if (isSuccess) {
%>
<script>
	alert("부서정보가 삭제되었습니다.");
	location.href="list.jsp?page=<%=tempPage%>";
</script>
<%
	} else {
%>
<script>
	alert("DB에러.");
	history.back(-1);
</script>
<%
	}
%>