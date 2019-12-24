<%@page import="kr.co.acorn.dto.MemberDto"%>
<%@page import="kr.co.acorn.dao.MemberDao"%>
<%@ page pageEncoding="utf-8" %>
<%
	request.setCharacterEncoding("utf-8");
	String email = request.getParameter("email");
	String password = request.getParameter("password");
	
			MemberDao dao = MemberDao.getInstance();
			MemberDto dto =new MemberDto(email,null,password,null,null);
			 dto =dao.getMember(dto);
			 if(dto !=null){
				 //세션시간 기본 30분으로 설정한다.
				 session.setMaxInactiveInterval(60*60*24);
				 //세션에 dto정보를 저장한다.
				 session.setAttribute("member",dto);
				 %>
				 <script>
				 alert("로그인 성공");
				 location.href = "/index.jsp";
				 </script>
				 <%
			 } else{
				  %>
				 <script>
				 alert("로그인  정보가 잘못됬어요");
				 history.back(-1);
				 </script>
				 <%
			 }

%>