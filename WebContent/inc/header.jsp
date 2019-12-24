<%@page import="kr.co.acorn.dto.MemberDto"%>
<%@ page pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>site.html</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<script src="../js/jquery-3.4.1.js"></script>
<style>
.container, .container-fluid {
	background-color: none;
}

.fixed, .fluid {
	background-color: blue;
	height: 100px;
	text-align: center;
	color: white;
}
</style>
</head>

<body>

	<!-- naver start -->
	<nav class="navbar navbar-expand-lg navbar-dark"
		style="background-color: blueviolet">
		<a class="navbar-brand" href="/index.jsp">Home</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<%
			String uri = request.getRequestURI(); // 패스만 리턴해줌, 해더 부분에 클릭한거 굵게 만듬
		%>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li
					class="nav-item <%if (uri.startsWith("/dept,")) {%> active<%}%>">
					<a class="nav-link" href="/dept/list.jsp">부서관리 <span
						class="sr-only">(current)</span></a>

				</li>
				<li class="nav-item<%if (uri.startsWith("/dept,")) {%> active<%}%>">
					<a class="nav-link" href="/dept/list.jsp">사원관리 <span
						class="sr-only">(current)</span></a>

				</li>
				<li
					class="nav-item <%if (uri.startsWith("/dept,")) {%> active<%}%>">
					<a class="nav-link" href="/member/list.jsp">공지사항</a>
				</li>
				<li
					class="nav-item <%if (uri.startsWith("/file,")) {%> active<%}%>">
					<a class="nav-link" href="/file/index.jsp">파일업로드</a>
				</li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> Dropdown </a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="#">Action</a> <a
							class="dropdown-item" href="#">Another action</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#">Something else here</a>
					</div></li>
			</ul>
			<!--  <form class="form-inline my-2 my-lg-0">
                <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
            </form> -->
			<ul class="navbar-nav">
			<%
				MemberDto memberDto = (MemberDto)session.getAttribute("member");
				if(memberDto==null){
					%>
				
				<li class="nav-item"><a class="nav-link"
					href="/member/write.jsp">회원가입</a></li>
				<li class="nav-item"><a class="nav-link"
					href="/member/login.jsp">로그인</a>
					</li>
					<%}else{ %>
					<li class="nav-item"><a class="nav-link"
					href="#"><%=memberDto.getName() %>님 환영한다.</a>
					</li>
					<li class="nav-item">
					<a class="nav-link" href="/member/logout.jsp">로그아웃</a>
					</li>
					<%} %>
			</ul>
		</div>
	</nav>
	<!-- naver end -->