<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@ page contentType = "application/json;charset=utf-8"%>



<%
	JSONObject jsonObj =new JSONObject();
	JSONArray jsonArray=new JSONArray();
	
	JSONObject item1 =new JSONObject();
	item1.put("name", "성영한");
	item1.put("clubid", "syh1001");
	
	JSONObject item2 =new JSONObject();
	item2.put("name", "성영한");
	item2.put("clubid", "syh1002");
	
	JSONObject item3 =new JSONObject();
	item3.put("name", "성영한");
	item3.put("clubid", "syh1003");
	
	jsonArray.add(item1);
	jsonArray.add(item2);
	jsonArray.add(item3);
	
	jsonObj.put("cafelist",jsonArray);
	out.print(jsonObj.toString());
	
	
	
	
	
%>