<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="kr.or.ddit.cfms.vo.CFMSBoardlistVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	List<CFMSBoardlistVO> list = (List<CFMSBoardlistVO>)request.getAttribute("list");	
%>

[

<%

	for(int i=0; i<list.size(); i++){
		CFMSBoardlistVO vo = list.get(i);
			if(i>0) out.print(",");
			
			String date = (String)vo.getWr_dt();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd HH:mm");
			Date date1 = new Date();
			Date date2 = new Date();
			date1 = sdf.parse(date);
			date2 = sdf1.parse(date);
			String date3 = sdf.format(date1);
			String date4 = sdf1.format(date2);
			
%>
    {
    	"seq" : "<%=vo.getList_num() %>",
    	"num" : "<%=vo.getBd_num() %>",
    	"code" : "<%=vo.getBd_cd() %>",
    	"title" : "<%=vo.getTitle() %>",
    	"date1" : "<%=date3%>",
    	"date2" : "<%=date4%>",
    	"cont" : "<%=vo.getCont().replaceAll("\r","").replaceAll("\n","<br>") %>",
    	"writer" : "<%=vo.getWriter() %>",
    	"userid" : "<%=vo.getCus_id() %>",
    	"classify" : "<%=vo.getClassify() %>"
    
    }   
<%		
	}
%>
]
 
    
    
    
    
    
    
    
    
    
    
