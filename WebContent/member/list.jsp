<%@page import="kr.co.acorn.dao.MemberDao"%>
<%@page import="kr.co.acorn.dto.MemberDto"%>
<%@ page import="kr.co.acorn.dto.EmpDto"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="kr.co.acorn.dao.EmpDao"%>
<%@ page pageEncoding="utf-8" %>
<%@ include file="../inc/header.jsp" %> 
  <%
    int len = 5;
    int pageLength = 4;
	int start = 0;
	int totalRows = 0;
	int totalPage = 0;
	int startPage = 0;
	int endPage = 0;
	int pageNum = 0;
	int cPage = 0;
	
  	String tempPage = request.getParameter("page");
    if(tempPage == null || tempPage.length()==0){
    	cPage = 1;
    }
    try{
    	cPage = Integer.parseInt(tempPage);
    }catch(NumberFormatException e){
    	cPage = 1;
    }
    //An = a1 + (n-1)*d
    MemberDao dao = MemberDao.getInstance();//얘바꾸기	
   	totalRows = dao.getTotalRows();	
   	totalPage = totalRows % len == 0 ? totalRows/len : totalRows/len+1;
  	if(totalPage == 0){
  		totalPage = 1;
  	}
  	
  	if(cPage>totalPage){
  		response.sendRedirect("list.jsp?page=1");
  		return;
  	}
  	
  	start = (cPage - 1) * len; 
  	pageNum = totalRows + (cPage -1)*(-len);
  	ArrayList<MemberDto> list = dao.select(start,len);//
  	
  	/*
  		totalRows = 132;
  		len = 5;
  		pageLength = 10;
  					startPage    endPage
  		cPage = 1      1            10
  		cPage = 5      1            10
  		cPage = 14     11           20
  		cPage = 18     11           20
  		cPage = 22     21           27
  		
  		cPage = 1-10   n=>1   n=>currentBlock
  		cPage = 11-20  n=>2   n=>currentBlock
  		
  		startPage = 1 + (currentBlock-1) * pageLength
  		endPage = pageLength + (currentBlock-1) * pageLength
  	*/
  	
  	int currentBlock = cPage % pageLength == 0 ? 
  			(cPage/pageLength) : (cPage/pageLength+1) ;
  			
  	int totalBlock = totalPage % pageLength == 0 ? 
  			(totalPage/pageLength) : (totalPage/pageLength+1) ;
  	
  	startPage = 1 + (currentBlock-1) * pageLength;
  	endPage = pageLength + (currentBlock-1) * pageLength;	
  
  	if(currentBlock == totalBlock){
  		endPage = totalPage;
  	}
  	
  	
  	
  	
  	
  	
  %> 
  <!-- breadcrumb start-->
  <nav aria-label="breadcrumb">
    <ol class="breadcrumb">
      <li class="breadcrumb-item"><a href="/index.jsp">Home</a></li>
      <li class="breadcrumb-item active" aria-current="page">회원관리</li>
    </ol>
  </nav>
  <!-- breadcrumb end-->
	
  <!-- main start-->
  <div class="container">
    <div class="row">
      <div class="col-lg-12">
        
		<h3>회원리스트(<%=totalRows %>)</h3>
		<div class="table-responsive-lg">
			<table class="table table-hover">
	          <colgroup>
	           
	          	<col width="10%"/>
	          	<col width="15%"/>
	          	<col width="25%"/>
	          	<col width="25%"/>
	          	<col width="25%"/>
	          </colgroup>
			  <thead>
			    <tr>
			      <th scope="col">#</th>
			      <th scope="col">이름</th>
			      <th scope="col">이메일</th>
			      <th scope="col">휴대폰번호</th>
			      <th scope="col">등록일</th>
			     
			    </tr>
			  </thead>
			  <tbody>
			 <!--  데이터뿌리는부분 -->
			    <tr>
			      <td><%=pageNum-- %></td>
			      <td></td>
			      <td></td>
			      <td></td>
			      <td></td>
			      <td> </a></td>
			     
			    </tr>
			    
			    <tr>
			      <td colspan="7">데이터가 존재하지 않습니다.</td>
			    </tr>
			  
			   
			  </tbody>
			</table>
		</div>
        <nav aria-label="Page navigation example">
		  <ul class="pagination justify-content-center">
		  	<%if(currentBlock == 1){ %>
		  	<li class="page-item disabled">
		      <a class="page-link" href="#" tabindex="-1" aria-disabled="true">Previous</a>
		    </li>
		    <%}else{ %>
		    <li class="page-item">
		      <a class="page-link" href="list.jsp?page=<%=startPage-1%>">Previous</a>
		    </li>
		    <%} %>
		    <%for(int i = startPage;i<=endPage;i++){ %>
		    <li class="page-item <%if(cPage==i){ %>active<%}%>"><a class="page-link" href="list.jsp?page=<%=i%>"><%=i %></a></li>
		    <%} %>
		    <%if(currentBlock == totalBlock){ %>  
		    <li class="page-item disabled">
		      <a class="page-link" href="#" tabindex="-1" aria-disabled="true">Next</a>
		    </li>
		    <%}else{ %>
		    <li class="page-item">
		      <a class="page-link" href="list.jsp?page=<%=endPage+1%>">Next</a>
		    </li>
		    <%} %>
		  </ul>
		</nav>
        
        <div class="text-right">
			<a href="write.jsp?page=<%=cPage %>" class="btn btn-outline-secondary">회원등록</a>
		</div>
        
      </div>
    </div>
  </div>
  <!-- main end-->
  <%@ include file="../inc/footer.jsp" %> 
  
  
  
  
  