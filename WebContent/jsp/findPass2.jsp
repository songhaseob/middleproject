<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String resId = (String) request.getAttribute("resId");
	if (resId != null) {
	StringBuilder resId2 = new StringBuilder((String) request.getAttribute("resId"));
	resId2.setCharAt(3, '*');
	resId2.setCharAt(4, '*');
	resId2.setCharAt(5, '*');
%>
{"sw" : "회원님의 비밀번호는 <%=resId2%> 입니다"}
<%
	} else {
%>
{"sw" : "🙅‍♂️존재하지 않는 회원입니다. 아이디와 답변을 확인하세요"}
<%
	}
%>