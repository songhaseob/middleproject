<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="kr.or.ddit.cfms.vo.BlackListVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>Insert title here</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
<%-- 	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin_member.css"> --%>
	<script src="${pageContext.request.contextPath}/js/jquery-3.5.1.min.js"></script>
	
	<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin_report_detail.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
 	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	
	<!-- Tell the browser to be responsive to screen width -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- Font Awesome -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/all.min.css">
	<!-- Ionicons -->
	<link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
	<!-- Theme style -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/adminlte.min.css">
	<!-- Google Font: Source Sans Pro -->
	<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
	
<script>
<%
BlackListVO vo = (BlackListVO)request.getAttribute("vo");

%>

$(function(){
	
	$('#delbtn').click(function(){
		if(confirm("정말 삭제하시겠습니까 ?") == true){
			
			var num = "<%= vo.getList_num() %>";
			
			$.ajax({
				url : '/CFMS/Blacklistdelete.do',
				type : 'post',
				dataType:'json',
				data: { "num" : num }, 
				success : function(res){
					alert("삭제되었습니다");
					location.href='Reportlist.do';
					
				},
				error : function(xhr){
					alert("삭제실패");
					
				}
			})
			
			
			
		}else{
			return;	
		}
	});
	
	$("#convertcus").click(function(){
		if(confirm("블랙리스트에 등록하겠습니까?") == true){
			
			var reportedid = "<%= vo.getReported_cus()%>";
			var cont = "<%= vo.getCont()%>";

			$.ajax({
				url : '/CFMS/Blackcusinsert.do',
				type : 'post',
				dataType:'json',
				data: { "reportedid" : reportedid, "cont" : cont }, 
				success : function(res){
					alert("블랙리스트에 등록되었습니다");
					location.href='Reportlist.do';
					
				},
				error : function(xhr){
					alert("블랙리스트 등록실패");
					
				}
			})
			
			
			
		}else{
			return;
		}
	})
	
})

</script>	
	
</head>

<body class="hold-transition sidebar-mini">
<div class="wrapper">
  <!-- Navbar -->
  <nav class="main-header navbar navbar-expand navbar-white navbar-light">
    <!-- Left navbar links -->
    <ul class="navbar-nav">
      <li class="nav-item d-none d-sm-inline-block">
        <a href="loginMainView.do?id=admin" class="nav-link">회원페이지</a>
      </li>
    </ul>

  </nav>
  <!-- /.navbar -->

  <!-- Main Sidebar Container -->
  <aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
    <a href="adminUserInfo.do" class="brand-link">
      <img src="${pageContext.request.contextPath}/images/logo_w.png"
           alt="AdminLTE Logo"
           class="brand-image img-circle elevation-3"
           style= "width : 200px; box-shadow: none!important;">
      <span class="brand-text font-weight-light" style="color: #343a40;">.</span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar">
      <!-- Sidebar user panel (optional) -->
      <div class="user-panel mt-3 pb-3 mb-3 d-flex">
        <div class="image">
          <img src="${pageContext.request.contextPath}/images/user2-160x160.jpg" class="img-circle elevation-2" alt="User Image">
        </div>
        <div class="info">
          <span>관리자님, 반갑습니다.</span>
        </div>
      </div>

      <!-- Sidebar Menu -->
      <nav class="mt-2">
        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
        	<li class="nav-item">
        		 <a href="adminUserInfo.do" class="nav-link">
        		 	<p>일반회원관리	</p>
        		 </a>
        	</li>
        	<li class="nav-item">
        		 <a href="Blackcuslist.do" class="nav-link">
        		 	<p>블랙리스트관리</p>
        		 </a>
        	</li>
        	<li class="nav-item">
        		 <a href="Reportlist.do" class="nav-link">
        		 	<p>신고내역조회</p>
        		 </a>
        	</li>
        	<li class="nav-item">
        		 <a href="adminSalesTotal.do" class="nav-link">
        		 	<p>매출현황</p>
        		 </a>
        	</li>
        	<li class="nav-item">
        		 <a href="adminBoard.do" class="nav-link">
        		 	<p>공지사항관리</p>
        		 </a>
        	</li>
        	<li class="nav-item">
        		 <a href="adminFAQ.do" class="nav-link">
        		 	<p>FAQ관리</p>
        		 </a>
        	</li>
        	
		</ul>
      </nav>
      <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
  </aside>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
         
            <h1>신고내역조회</h1>
            <br>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
		<div class="report">
		<table class="table" id="tb">
		
		<tr>
			<td class="table_th font_color_white">신고한회원</td>
			<td class="table_th font_color_white">신고받은회원</td>
			<td class="table_th font_color_white">번호</td>
			<td class="table_th font_color_white">제목</td>
			<td class="table_th font_color_white">내용</td>
			<td class="table_th font_color_white">신고 날짜</td>
		</tr>
		
			<%
 					String date = (String)vo.getWr_dt();
 					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
 					Date date1 = new Date();
 					date1 = sdf.parse(date);
 					String date2 = sdf.format(date1);	
			%>
			
			<tr class="reportdetial">
				<td class="table_td"><%= vo.getCus_id() %></td>
				<td class="table_td"><%= vo.getReported_cus() %></td>
				<td class="table_td"><%= vo.getProd_num() %></td>
				<td class="table_td"><%= vo.getTitle() %></td>
				<td class="table_td"><%= vo.getCont() %></td>
				<td class="table_td"><%= date2 %></td>
			</tr>
			
			<tr>
			<td colspan="6" id="inde">
				<input class="w3-input" type="button" value="[<%= vo.getReported_cus() %>]님을 블랙리스트에 등록" id="convertcus">
				<input class="w3-input" type="button" value="삭제" id="delbtn">
			</td>
			</tr>
			
		</table>
		</div>
		
    </section>
    <!-- /.content -->

  </div>
  <!-- /.content-wrapper -->

  <footer class="main-footer">
   <div class="footer_style">
      <span>Copyright ©gifti-ILJO Rights Reserved.</span>
     </div>
  </footer>

  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
  </aside>
  <!-- /.control-sidebar -->
</div>
<!-- ./wrapper -->



<!-- jQuery -->
<script  src="${pageContext.request.contextPath}/js/jquery-3.5.1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery-3.5.1.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/dist/js/adminlte.min.js"></script>
<script src="${pageContext.request.contextPath}/dist/js/demo.js"></script>
</body>
</html>