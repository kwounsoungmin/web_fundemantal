<%@ page pageEncoding="utf-8"%>
<%@ include file="../inc/header.jsp"%>
<!-- breadcrumb start-->
<nav aria-label="breadcrumb">
	<ol class="breadcrumb">
		<li class="breadcrumb-item"><a href="#">Home</a></li>
		<li class="breadcrumb-item active" aria-current="page"></li>
	</ol>
</nav>
<!-- breadcrumb end-->

<!-- main start-->
<div class="container">
	<div class="row">
		<div class="col-lg-12">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<p class="h3">파일업로드</p>
						<!-- 	파일 업로드할때 폼 엘리먼트에 enctype속성을 반드시 추가해야한다. -->
						<form name="f" method="post" enctype="multipart/form-data"
							action="upload.jsp">
							<div class="custom-file">
								<input type="file" class="custom-file-input"
									id="validatedCustomFile" name="file" required> <label
									class="custom-file-label" for="validatedCustomFile">Choose
									file...</label>
								<div class="invalid-feedback">Example invalid custom file
									feedback</div>
							</div>
							
							<div class="form-group row">
								<label for="name" class="col-sm-2 col-form-label">NAME</label>
								<div class="col-sm-5">
							<input type="text" class="form-control" placeholder="이름을 입력하세요" name="name">
								</div>
							</div>
						</form>
						<div class="text-right">
							<button type="button" id="uploadFile"
								class="btn btn-outline-success">저장</button>
						</div>
					</div>
				</div>
			</div>


		</div>
	</div>
</div>
<!-- main end-->
<%@ include file="../inc/footer.jsp"%>

<script>
	$(function(){
		$("#uploadFile").click(function(){
			f.submit();
		});
		
	});
</script>




