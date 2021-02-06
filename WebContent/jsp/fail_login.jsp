<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<title>gifti_ILJO</title>
</head>
<body>
	<script>
	$(function() {
		 
		Swal.fire({
			  icon: 'error',
			  title: '로그인 오류네요..👨‍🔧',
			  text: '아이디와 비밀번호를 다시 확인해주세요',
			}) 
		
		$("button").on("click",function(){
			document.location.href="mainPage.do";
		})
		
		
	})
	</script>
</body>
</html>