<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Calendar"%>
<%@ page pageEncoding="utf-8"%>
<% 
	String path =request.getRealPath("/upload/file");
	Calendar c = Calendar.getInstance();
	int year = c.get(Calendar.YEAR);
	int month = c.get(Calendar.MONTH)+1;
	path +=File.separator+year +File.separator +month;
	
	File f =new File(path);
	if(!f.exists()){
		f.mkdirs();
	}
	MultipartRequest multi = null;
	try{
		multi = new MultipartRequest(
		request,
		path,//업로드할 기렉초리
		10*1024*1024,//업로드할 파일 크기
		"utf-8",
		new DefaultFileRenamePolicy()
		);
		}catch(Exception e){
		e.printStackTrace();
		}
		String name =multi.getParameter("name");
		String fileName = multi.getFilesystemName("file");
		String uploadName = multi.getOriginalFileName("file");
		File f1 = new File(f,fileName);
		long fileSize =f1.length()/1024;
		%>
		
		name: <%=name %><br>
		<img src="/upload/file/<%=year %>/<%=month %>/<%=fileName %>" style="width=1000px; height:1000px">
		File System Name : <a href="/upload/file/<%=year %>/<%=month %>/<%=fileName %>"> <%=fileName %>(<%=fileSize %>kb)</a>
		File Origin Name :<%=uploadName %>