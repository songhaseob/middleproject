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
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

<script>
 $(function () {
	 user = {};
	 dlswmd = 0;
		$("#id").keyup(function() {
			userid = "올바르지 않은 아이디입니다.";
			if (!idcheck(this)) {
				$(".error_next_boxid").html(userid);
				return false;
			}

			idValue = $("#id").val().trim();
			$.ajax({
				url : "/CFMS/IdCheck",
				type : "post",
				data : {
					"id" : idValue
				},
				success : function(res) {
					userid = res.sw;
					$(".error_next_boxid").html(userid);
				},
				error : function(xhr) {
					alert("상태 : " + xhr.status)
				},
				dataType : "json"
			})
		})

		$("#pass1").keyup(function() {
			p1 = $("#pass1").val().trim();
			p2 = $("#pass2").val().trim();
			if (!passcheck(this)) {
				$(".step_url1").attr("src", "../images/비번안되는이미지.png");
			} else {
				$(".step_url1").attr("src", "../images/비번되는이미지.png");
			}
			if (p1 != p2) {
				$(".step_url2").attr("src", "../images/비번안되는이미지.png");
		
			} else {
				$(".step_url2").attr("src", "../images/비번되는이미지.png");
			}
		})

		$("#pass2").keyup(function() {
			p1 = $("#pass1").val().trim();
			p2 = $("#pass2").val().trim();
			if (p1 != p2) {
				$(".step_url2").attr("src", "../images/비번안되는이미지.png");
		
			} else {
				$(".step_url2").attr("src", "../images/비번되는이미지.png");
			}
		})

		$("#nick").keyup(function() {

			nickValue = $("#nick").val().trim();
			$.ajax({
				url : "/CFMS/NickCheck",
				type : "post",
				data : {
					"nick" : nickValue
				},
				success : function(res) {
					usernick = res.sw;
					$(".error_next_boxnick").html(usernick)//.css("color", "red");
				},
				error : function(xhr) {
					alert("상태 : " + xhr.status)
				},
				dataType : "json"
			})

		})
	
 
		num = "";
		$("#telbutton1").on("click", function() {
				telValue = $("#tel").val().trim();
				if (!telcheck321(this)) {
					return false;
				}
				$.ajax({
					url : "/CFMS/Sms",
					type : "post",
					data : {
						"tel" : telValue
					},
					success : function(res) {
						Swal.fire(
						  '문자 전송 성공!',
						  '휴대폰을 확인해주세요!',
						  'success'
						)
						num = res.sw
					},
					error : function(xhr) {
						alert("상태 : " + xhr.status)
					},
					dataType : "json"
				})
			})

			
			$("#telbutton2").on('click', function() {
				telvalue = $('#telcode').val().trim();			
				if (!telcheck123(this)) {
					return false;
				}
				LoadingWithMask();
				if(num==telvalue){
					dlswmd++;
					$("#telbutton1").attr("disabled", true).html("본인인증 성공").css("background-color", "#00e600");
					$("#telbutton2").attr("disabled", true).html("본인인증 성공").css("background-color", "#00e600");
					closeLoadingWithMask();
				}else{
					Swal.fire({
						  icon: 'error',
						  title: '흠...',
						  text: '인증번호가 다르네요😅',
						})
					closeLoadingWithMask();
				} 
			})
			
			
			
			$("#emailbutton1").on('click', function() {
				mailValue = $("#mail").val().trim();
				
				if (!mailcheck3(this)) {
					return false;
				}
				
				$.ajax({
					url : "/CFMS/Mail",
					type : "post",
					data : {
						"mail" : mailValue
					},
					success : function(res) {
						Swal.fire(
								  '메일 전송 성공!',
								  '이메일을 확인해주세요!',
								  'success'
								)
						code = res.sw;
					},
					error : function(xhr) {
						alert("상태 : " + xhr.status)
					},
					dataType : "json"
				})
			})
			
			
			code = "";
			$("#emailbutton2").on('click', function() {
				mailcode = $("#mailcode").val();
				if (!mailcheck(this)) {
					return false;
				}
				if(code==mailcode){
					dlswmd++;
					$("#emailbutton1").attr("disabled", true).html("본인인증 성공").css("background-color", "#00e600");
					$("#emailbutton2").attr("disabled", true).html("본인인증 성공").css("background-color", "#00e600");
					
				} else{
					Swal.fire({
						  icon: 'error',
						  title: '흠...',
						  text: '인증번호가 다르네요😅',
						})
				} 
			})
			
			$("#btnJoin").on('click', function() {
				if(dlswmd==1 || dlswmd==0){
					Swal.fire({
						  icon: 'error',
						  title: '흠...',
						  text: '모든 인증을 받아주셔야 합니다😅',
						})
					return false;
				}
				
				if (!telcheck123()) {
					return false;
				}
				if (!telcheck321()) {
					return false;
				}
				if (!mailcheck()) {
					return false;
				}
				if (!idcheck()) {
					return false;
				}
				if (!passcheck()) {
					return false;
				}
				LoadingWithMask();
				user.id = $('#id').val().trim();
				user.pass = $('#pass1').val().trim();
				user.nicknm = $('#nick').val().trim();
				user.tel = $('#tel').val().trim();
				user.pass_hint = $('#hint').val().trim();
				user.email = $('#mail').val().trim();
				user.answer = $('#hint2').val().trim();
				
				$.ajax({
					url : "/CFMS/CusJoin",
					data : user,
					type : "post",
					success : function(res) {
						
						alert("😊 회원가입 한 아이디와 비밀번호로 로그인 해 주세요 😊")
						
						closeLoadingWithMask();
						
						
						
						location.href="<%=request.getContextPath() %>/mainPage.do";
					},
					error : function(xhr) {
						alert("상태 : " + xhr.status)
					},
					dataType : "json"
				})
			  
			})

		
		
			
		
	})
</script>



<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>회원가입</title>
<style>
</style>
</head>
<body>

	<div id="header">
		<a href="http://192.168.42.46/CFMS/mainPage.do">
			<img src="../images/logo_yellow_back.png">
		</a>
		<div id="wrapper">
			<div id="content">
			<form id="joinform" class="form-horizontal">
				<div>
					<h3>
						<label for="id">아이디</label>
					</h3>
					<span class="box int_id"> 
						<input type="text" id="id" class="int int2" maxlength="20"> 
						<span class="step_url3">@giftiILJO.net</span>
					</span> 
					<span style="text-align: right;" class="error_next_boxid"></span>
				</div>
				
				<div>
					<h3>
						<label for="pass1">비밀번호</label>
					</h3>
					<span class="box int_pass"> 
						<input type="password" id="pass1" class="int int3" maxlength="20" placeholder="소문자 특수문자 숫자"> 
						<img class="step_url1" src="../images/비번안되는이미지.png" style="height: 20px;">
					</span>
				</div>
				
				<div>
					<h3>
						<label for="pass2">비밀번호확인</label>
					</h3>
					<span class="box int_pass"> 
						<input type="password" id="pass2" class="int int3" maxlength="20">
						<img class="step_url2" src="../images/비번안되는이미지.png" style="height: 20px;">
					</span> 
					<span class="error_next_box"></span>
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
						<input type="text" id="hint2" class="int" maxlength="10" placeholder="비밀번호를 찾기위해 필요합니다. 꼭 기억해주세요">
					</span>
				</div>

				<div>
					<h3>
						<label for="nick">닉네임</label>
					</h3>
					<span class="box int_nick"> 
						<input type="text" id="nick" class="int" maxlength="11" placeholder="12자 초과 불가">
					</span> 
					<span class="error_next_boxnick"></span>
				</div>

				<div>
					<h3>
						<label for="tel">전화번호</label>
					</h3>
					<span class="box int_tel"> 
						<input type="text" id="tel"	class="intput" maxlength="11" placeholder="'-'없이 숫자만 입력">
						<button id="telbutton1" class="step_urlbu" type="button">인증코드 발송</button>
						<span class="error_next_boxnicktel"></span>
					</span> 
					<span class="error_next_box"></span>
				</div>
				
				<div>
					<h3>
						<label for="tel2">인증코드 입력</label>
					</h3>
					<span class="box int_tel2"> 
						<input type="text" id="telcode" class="intput" maxlength="6">
						<button id="telbutton2" class="step_urlbu" type="button">인증코드 확인</button>
					</span> 
					<span class="error_next_box"></span>
				</div>

				<div>
					<h3>
						<label for="mail">이메일</label>
					</h3>
					<span class="box int_mail"> 
						<input type="email" id="mail" class="intput" placeholder="inuptemail@gifiljo.net">
						<button id="emailbutton1" class="step_urlbu" type="button">인증코드 발송</button>
					</span> 
					<span class="error_next_box"></span>
				</div>

				<div>
					<h3>
						<label for="mailcode">인증코드 입력</label>
					</h3>
					<span class="box int_mailcode"> 
						<input type="text" id="mailcode" class="intput" maxlength="6">
						<button id="emailbutton2" class="step_urlbu" type="button">인증코드 확인</button>
					</span> 
					<span class="error_next_box"></span>
				</div>

				<div class="btn_area">
					<button type="button" id="btnJoin">
						<span id="join">가입하기</span>
					</button>
				</div>
				
</form>

			</div>
			<!-- End content -->

			<div class="push"></div>	
			
			<!-- footer 시작 -->
			<div id="footer">
			<div class="footer_wrapper">
				<img class="footer_logo" src="${pageContext.request.contextPath}/images/logo_w.png" alt="">
				<div class="footer_txt">
					<p><strong>(주)기프티일조</strong></p>
					<p>대전시 중구 대흥동</p>
					<p>대표자 : 김선중과 아이들</p>
				</div>	
				<p class="copy_right">Copyright ©gifti-ILJO Rights Reserved.</p>
			</div>
		</div>
		<!-- footer 끝 -->
				
		</div>
		<!-- End wrapper -->
		
	</div>
	<!-- End header -->

</body>
</html>