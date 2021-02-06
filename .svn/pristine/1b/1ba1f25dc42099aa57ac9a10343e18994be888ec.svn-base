<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<%
							String seq = (String)request.getParameter("seq");
						
%>


<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>공지사항수정/삭제</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin_member.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin_board_update.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin.css">
	
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
      <span class="brand-text font-weight-light" style=" color: #343a40;">.</span>
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
            <h1>공지사항수정/삭제</h1>
         	
      
            <br>
         <div class="post">
         	
         </div>
 			
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
		<div class="member">
			<p></p>
		</div>
    </section>
    <!-- /.content -->


  </div>
  <!-- /.content-wrapper -->

  <footer class="main-footer">
    <div class="float-right d-none d-sm-block">
      <b>Version</b> 3.0.5
    </div>
    <strong>Copyright &copy; 2014-2019 <a href="http://adminlte.io">AdminLTE.io</a>.</strong> All rights
    reserved.
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
<script src="${pageContext.request.contextPath}/plugins/jquery/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/dist/js/adminlte.min.js"></script>
<script src="${pageContext.request.contextPath}/dist/js/demo.js"></script>

<script>

$(function(){
	$.ajax({
		url : '/CFMS/admin_board_select.do',
		type : 'post',
		data : {"seq" : <%=seq%>},
		dataType:'json',
		success : function(res){
			
				code= '<table>';
			
		$.each(res, function(i,v){
			if(v.classify == '공지사항'){
                code +='<tr>';
                code +='<td  class="table_th"> 글상세보기</td>';
                code +='</tr>';
                code +='<tr>';
                code +='<td bgcolor=white>';
                code +='<table class = "table2">';
                code +='<tr>';
                code+='<td>번호</td>';
                code+='<td><input type="text" id="seq" name="seq" disabled / value='+v.seq+'></td>';
                code+='</tr>';
                code+='<tr>';
                code+='<td>제목</td>';
                code+='<td><input type = text id="title" name="title" size=60 value=\"'+v.title+'"\></td>';
                code+='</tr>';
                code+='<tr>';
                code+='<td>내용</td>';
               	code+='<td><textarea id="cont" name="cont" cols="59" rows="20"> '+v.cont.replace(/<br>/g,'\r\n')+'</textarea></td>';
                code+='</tr>';
                code+='<tr>';
                code+='<td>등록일</td>';
                code+='<td><input id="date" name="date" disabled / type = text value='+v.date+'></td>';
                code+='</tr>';
                code+='</table>';
                code+='<center>';
                code+='</center>';
                code+='</td>';
                code+='</tr>';
                code +='<td class="td_style">' + '<input id="bt" type="submit" class="btn btn-primary convertcus" value="수정" onclick=\"update();\">' 
				+ '<input id="bt" type="submit" class="btn btn-primary delbtn" value="삭제" onclick=\"del();\">' + '</td>';
				code +='</tr>';
				code +='<br>';
			}
		})
			
		code +='</table>';
		$('.post').html(code);
		},
		error : function(xhr){
			alert("상태 : " + xhr.status);
		}
	})
})
	function update(){
	
	var seq= $("#seq").val();
	var title= $("#title").val();
	var cont= $("#cont").val();
	
	
	 
	$.ajax({
		url : '/CFMS/admin_board_update.do',
		type : 'post',
		dataType:'json',
		data: {"seq":seq , "title" : title , "cont" : cont }, 
		success : function(res){
			alert("수정이 완료되었습니다.");
			location.href='adminBoard.do';
			
		},
		error : function(xhr){
			alert("수정이 완료되지 않았습니다");
			
		}
	})
}
	 function del(){
		 
		 var seq= $("#seq").val();
		 
		 if(confirm("삭제 하시겠습니까?")==true){
			 
		$.ajax({
			url : '/CFMS/admin_board_delete.do',
			type : 'post',
			dataType:'json',
			data:{"seq" : seq},
			success : function(res){
				alert("삭제 되었습니다");
				location.href='adminBoard.do';
				
			},
			error : function(xhr){
				alert("삭제 되지 않았습니다");
				
			}
		})
		 }else{
			 return;
		 }
		
	} 
</script>
</html>
      
  