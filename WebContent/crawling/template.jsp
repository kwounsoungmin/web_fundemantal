<%@page import="java.io.IOException"%>
<%@ page pageEncoding= "utf-8" %>
<%@ page import="org.jsoup.Jsoup" %>
<%@ page import="org.jsoup.nodes.Document" %>
<%@ page import="org.jsoup.nodes.Element" %>
<%@ page import="org.jsoup.select.Elements" %>
<%@ include file="../inc/crawingHeader.jsp" %>
    <!--  항목경로 시작 -->
    <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active" aria-current="page">Library</li>
            </ol>
          </nav>
    <!--  항목경로 끝 -->
    <!-- main 시작 -->
    <div class ="container">
        <div class ="row"></div>
        <div class="col-lg-12"></div>

<%-- <%


	//비트코인  정보 크롤링 test
			//css 트리 위치 를저장하기위해 사용.
			Document doc =null; 
			//원하는 페이지의 url 
			String url = "https://coinmarketcap.com/ko/currencies/bitcoin/historical-data/";
			
			try {
				//1. 문서 객체레 url로 접속해 값을 구해온다. -> 이후 try/catch로 묶기.
				doc=Jsoup.connect(url).get();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			Elements elements =doc.select(".cmc-table__table-wrapper-outer table tbody tr");
			try {
				
				
				pw = new PrintWriter(bw, true);
				pw.println("Date\t\tOpen\t\tHigh\t\tLow\t\tClose\t\tVolume\t\tCap");
				for (int i = 0; i < elements.size(); i++) {
					Element trElement = elements.get(i);
					String date = trElement.child(0).text(); // 클래스 안에 것들의 순서 div로
																// 나누어졌을때 .child(0)로
																// 소속 순서 나태냄.
					String open = trElement.child(1).text();
					String high = trElement.child(2).text();
					String low = trElement.child(3).text();
					String close = trElement.child(4).text();
					String volume = trElement.child(5).text();
					String cap = trElement.child(6).text();
					String format = String.format("%s\t%s\t%s\t%s\t%s\t%s\t%s%n", date, open, high, low, close, volume, cap);
					System.out.print(format);// 모니터 출력
					pw.print(format);// 파일에 저장
				}
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				if (pw != null)
					pw.close();
			}
		


%> --%>


안녕

    <!-- main끝 -->

<%@ include file="../inc/footer.jsp" %>
   