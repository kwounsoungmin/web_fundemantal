<%@ page import="kr.co.acorn.dto.DeptDto"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="kr.co.acorn.dao.DeptDao"%>
<%@ page pageEncoding="utf-8"%>
<%@ include file="../inc/header.jsp"%>
<%
	String tempPage = request.getParameter("page");
	String tempNo = request.getParameter("no");
	if (tempPage == null || tempPage.length() == 0) {
		tempPage = "1";
	}
	
	if (tempNo == null || tempNo.length() == 0) {
		response.sendRedirect("list.jsp?page=" + tempPage);//이전페이지로 이동시킴.
		return;
	}
	
	int cPage = 0; 
	int no = 0;
	
	try {
		cPage = Integer.parseInt(tempPage);

	} catch (NumberFormatException e) {
		cPage = 1;
	}
	try {
		no = Integer.parseInt(tempNo);

	} catch (NumberFormatException e) {
		response.sendRedirect("list.jsp?page=" + tempPage);
		return;
	}
	
	
	DeptDao dao = DeptDao.getInstance();
	DeptDto dto = dao.select(no);
	if(dto== null){
		response.sendRedirect("list.jsp?page=" + tempPage);//이전페이지로 이동시킴 이상한 문자 넣었을때.
		return;
	}
	String name = dto.getName();
	String loc =dto.getLoc();
	
	
	
	
	
%>
<!--  항목경로 시작 -->
<nav aria-label="breadcrumb">
	<ol class="breadcrumb">
		<li class="breadcrumb-item"><a href="/index.jsp">Home</a></li>
		<li class="breadcrumb-item active" aria-current="page">DEPT</li>
	</ol>
</nav>
<!--  항목경로 끝 -->
<!-- main 시작 -->
<div class="container">
	<div class="row">
		<div class="col-lg-12">
			<p class="h3">부서 상세보기</p>

			<form name="f" method="post">
				<div class="form-group row">
					<label for="no" class="col-sm-2 col-form-label">부서번호</label>
					<div class="col-sm-10">
						<input type="number" class="form-control" id="no" readonly="readonly" name="no"
							value="<%=no %>">
					</div>
				</div>
				<div class="form-group row">
					<label for="name" class="col-sm-2 col-form-label">부서이름</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="name" name="name"
							value="<%=name %>">
					</div>
				</div>
				<div class="form-group row">
					<label for="loc" class="col-sm-2 col-form-label">부서위치</label>
					<div class="col-sm-10">
						<input type="rext" class="form-control" id="loc" name="loc"
							value="<%=loc %>">
					</div>
				</div>
				<input type ="hidden" name="page" value="<%=cPage %>">
			</form>
			<div class="text-right">
				<a href="list.jsp?page=<%=cPage %>" class="btn btn-outline-secondary">목록</a>
				<button type="button" id="updateDept" class="btn btn-outline-success" >수정</button>
				<button type="button" id="deleteDept" class="btn btn-outline-danger">삭제</button>
			
			</div>
		</div>
	</div>
</div>
<!-- main끝 -->

<%@ include file="../inc/footer.jsp"%>
<script>
$(function(){
	$("#no").focus();
	$("#updateDept").click(function(){
	//자바스크립트 유효성 검사
		if($("#no").val().length==0){
		alert("부서번호를 입력하세요.");
		$("#no").focus();
		return;
		}
		if($("#name").val().length==0){
		alert("부서이름을 입력하세요.");
		$("#name").focus();
		return;
		}
		if($("#loc").val().length==0){
		alert("부서위치를 입력하세요.");
		$("#loc").focus();
		return;
		}
	f.action="update.jsp";
	f.submit();
	});
	$("#deleteDept").click(function(){
		f.action="delete.jsp";
		f.submit();
		
	});
	
});
</script>



