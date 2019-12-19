<%@page import="kr.co.acorn.dao.DeptDao"%>
<%@page import="kr.co.acorn.dto.DeptDto"%>
<%@ page pageEncoding="utf-8"%>
<%
	String tempPage = request.getParameter("page");
	request.setCharacterEncoding("utf-8");
	int no = Integer.parseInt(request.getParameter("no"));
	String name = request.getParameter("name");
	String loc = request.getParameter("loc");
	out.println(no + name + loc);
	DeptDto dto = new DeptDto(no, name, loc);
	DeptDao dao = DeptDao.getInstance();
	boolean isSuccess = dao.update(dto);
	if (isSuccess) {
%>
<script>
	alert("부서정보가 수정되었습니다.");
	location.href="view.jsp?page=<%=tempPage%>&no=<%=no%>";
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