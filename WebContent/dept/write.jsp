<%@ page pageEncoding="utf-8"%>
<%@ include file="../inc/header.jsp"%>
<!--  항목경로 시작 -->
<nav aria-label="breadcrumb">

	<ol class="breadcrumb">
		<li class="breadcrumb-item"><a href="list.jsp">Home</a></li>
		<li class="breadcrumb-item active" aria-current="page">DEPT</li>
	</ol>
</nav>
<!--  항목경로 끝 -->
<%
int cPage = 0;
String tempPage = request.getParameter("page");
if (tempPage == null || tempPage.length() == 0) {
	cPage = 1;//아무것도 안쳤을때, 페이지 =다음 아무것도 안쳤을때
}
try {
	cPage = Integer.parseInt(tempPage);
} catch (NumberFormatException e) {
	cPage = 1;
}
%>
<!-- main 시작 -->
<div class="container">
	<div class="row">
		<div class="col-lg-12">
			<p class="h3">부서등록</p>

			<form name="f" method="post" action="save.jsp">
				<div class="form-group row">
					<label for="no" class="col-sm-2 col-form-label">부서번호</label>
					<div class="col-sm-10">
						<input type="number" class="form-control" id="no" name="no">
					</div>
				</div>
				<div class="form-group row">
					<label for="name" class="col-sm-2 col-form-label">부서이름</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="name" name="name">
					</div>
				</div>
				<div class="form-group row">
					<label for="loc" class="col-sm-2 col-form-label">부서위치</label>
					<div class="col-sm-10">
						<input type="rext" class="form-control" id="loc" name="loc">
					</div>
				</div>
			</form>
			<div class="text-right">
				<a href="list.jsp?page=<%=cPage %>>" class="btn btn-outline-secondary">목록</a>
				<button type="button" id="saveDept" class="btn btn-outline-success">저장</button>
			</div>
		</div>
	</div>
</div>
<!-- main끝 -->
<%@ include file="../inc/footer.jsp"%>
<script>
$(function(){
	$("#no").focus();
	$("#saveDept").click(function(){
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
	f.submit();
	});
});
</script>



