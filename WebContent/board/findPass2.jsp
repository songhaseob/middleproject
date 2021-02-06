<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/main_joinmember.css">
<link rel="icon" type="image/png" sizes="32x32" href="${pageContext.request.contextPath}/images/favicon3_105_icon.ico">
 
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="../js/memberreg.js"></script>
<script src="../js/jquery.serializejson.min.js"></script>
<script src="../js/loding.js"></script>
<script>
$(function (){
	
	$("#btnJoin").on('click',function () {
		LoadingWithMask();
		hintValue = $("#hint").val().trim();
		hint2Value = $("#hint2").val().trim();
		idValue = $("#id").val().trim();
		
		$.ajax({
			url : "/CFMS/FindPass2",
			type : "post",
			data : {
				"hint" : hintValue,
				"hint2" : hint2Value,
				"id" : idValue
			},
			success : function(res) {
				userid = res.sw;
				$(".error_next_boxhint").html(userid);
				closeLoadingWithMask();
			},
			error : function(xhr) {
				alert("상태 : " + xhr.status)
			},
			dataType : "json"
		})
	});
		
	 
})
</script>


<title>비밀번호 찾기</title>
</head>
<body>
 <div id="header">
		<a href="http://192.168.42.46/CFMS/mainPage.do#">
			<img src="../images/logo_yellow_back.png">
		</a>
		<div id="wrapper">
		<br>
		 
			<div id="content">
			<form id="joinform" class="form-horizontal">
				
				<div>
					<h3>
						<label for="pass1">아이디</label>
					</h3>
					<span class="box int_pass"> 
						<input type="text" id="id" class="int int4" maxlength="20"> 
					</span>
				</div>
				
				<div id="hint_div">
					<h3>
						<label for="hint">비밀번호 힌트</label>
					</h3>

					<select id="hint">
						<option value="어머니 성함은?" id="">어머니 성함은?</option>
						<option value="어릴적 별명은?" id="">어릴적 별명은?</option>
						<option value="태어난 고향은?" id="">태어난 고향은?</option>
						<option value="출신 초등학교는?" id="">출신 초등학교는?</option>
						<option value="좋아하는 색은?" id="">좋아하는 색은?</option>
						<option value="좋아하는 음식은?" id="">좋아하는 음식은?</option>
						<option value="좋아하는 게임은?" id="">좋아하는 게임은?</option>
						<option value="좋아하는 사람은?" id="">좋아하는 사람은?</option>
						<option value="감명깊게 본 영화는?" id="">감명깊게 본 영화는?</option>
						<option value="좋아하는 취미는?" id="">좋아하는 취미는?</option>
					</select> 
					<span class="box int_pass"> 
						<input type="text" id="hint2" class="int" maxlength="10">
					</span>
					<span style="text-align: right;" class="error_next_boxhint"></span>
				</div>
				 

				<div class="btn_area">
					<button type="button" id="btnJoin">
						<span id="join">비밀번호 찾기</span>
					</button>
				</div>
				
</form>
			</div>
			<!-- End content -->

			<div class="push"></div>	
			<div id="footer" class="fixed_footer">
				<p>Copyright ©gifti-ILJO Rights Reserved.</p>
			</div>
				
		</div>
		<!-- End wrapper -->
		
	</div>
	<!-- End header -->
 
</body>
</html>