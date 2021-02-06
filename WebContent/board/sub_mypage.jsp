<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="kr.or.ddit.cfms.vo.ProductVO"%>
<%@page import="kr.or.ddit.cfms.vo.SelVO"%>
<%@page import="kr.or.ddit.cfms.vo.BuyVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.cfms.vo.ChargeVO"%>
<%@page import="kr.or.ddit.cfms.vo.CustomerVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/sub_mypagehs.css">
<link rel="icon" type="image/png" sizes="32x32"
	href="${pageContext.request.contextPath}/images/favicon3_105_icon.ico">
<script src="./js/jquery-3.5.1.min.js"></script>
<script src="./js/memberreg.js"></script>
<script src="./js/jquery.serializejson.min.js"></script>

<title>마이페이지</title>
<script>
<%
	String checknicknm = "";

%>

<%
CustomerVO custVo = (CustomerVO)request.getAttribute("userinfo");
List<ChargeVO> charList = (List<ChargeVO>)request.getAttribute("charlist");
List<ChargeVO> charList2 = (List<ChargeVO>)request.getAttribute("datelist");
List<BuyVO> buyList = (List<BuyVO>)request.getAttribute("buylist");
List<SelVO> selList = (List<SelVO>)request.getAttribute("sellist");
List<ProductVO> buyProdList = (List<ProductVO>)request.getAttribute("buyprodlist");
List<ProductVO> selProdList = (List<ProductVO>)request.getAttribute("selprodlist");

SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

Calendar c1 = Calendar.getInstance();

String strToday = sdf.format(c1.getTime());


String tabInfo = (String)request.getAttribute("tabinfo");

String myBuy = "";
String myPoint = "";
String myInfoupdate = "";
String myinfo_detail = "";

if(tabInfo!=null){
	if(tabInfo.equals("mybuy")){
		myBuy = "checked";
	}
	if(tabInfo.equals("mypoint")){
		myPoint = "checked";
	}
	if(tabInfo.equals("myInfoupdate")){
		myInfoupdate = "checked";
	}
	if(tabInfo.equals("myinfo_detail")){
		myinfo_detail = "checked";
	}
}

%>
$(function(){
	
	// 닉네임 체크하는 ajax ----------------------
		$("#upnick").on('click', function(){
			alert("닉네임이 수정되었습니다") 
		})
	$("#nick").keyup(function() {
		
		var	nickValue = $("#nick").val().trim();	
			
			$.ajax({
				url : "/CFMS/NickCheck",
				type : "post",
				data : {
					"nick" : nickValue
				},
				success : function(res) {
					usernick = res.sw;
					
					$("#checknick").html(usernick)//.css("color", "red");
					
					if(usernick == "사용가능한 닉네임 입니다."){
						$("#upnick").prop("disabled", false);
						
// 						confirm = true;
			
						
						
					}else if (usernick == "중복된 닉네임입니다."){
						$("#upnick").prop("disabled", true);
						usernick += "  " + "다시 확인 해주세요"
						$("#checknick").html(usernick);	
					}

				},
				error : function(xhr) {
					alert("상태 : " + xhr.status)
				},
				dataType : "json"
			})
			
			
			
		})
		
		
		
	// 비밀번호를 체크하는 ajax ----------------------------------------
	
		$('#uppass').on('click', function(){
					
					alert("비밀번호가 수정되었습니다");
				
				})
		$("#pass1").keyup(function() {
			if (!passcheck(this)) {
				$(".step_url1").attr("src", "./images/비번안되는이미지.png");
				$("#checkpass").html("비밀번호를 다시 확인해주십시오 (최소 8자리이상 15자리 이하)");
				
			} else {
				$(".step_url1").attr("src", "./images/비번되는이미지.png");
				$("#checkpass").html(" ");
				
			}
		})
		
		$("#pass2").keyup(function() {
			p1 = $("#pass1").val().trim();
			p2 = $("#pass2").val().trim();
			if (p1 != p2) {
				$("#checkpass1").html("비밀번호가 일치하지 않습니다");
		
			} else {
				$("#checkpass1").html("일치합니다");
				$('#uppass').prop("disabled", false);
				
				
			}
		})
		
	// 이메일을 체크하는 ajax ---------------------------------------
		
		$("#upmail").on('click', function(){
					
					alert("이메일이 수정되었습니다")
					
				})
				
		$("#mail").keyup(function() {
			
			if(!mailcheck2(this)){
				$('#upmail').prop("disabled", true);
			}else{
				$('#upmail').prop("disabled", false);
				
	
			}
			

		})
		
	// 회원 탈퇴 오지게 때려버리는 ajax다 다다다다다다드다닫다갇그다구----------
	
	$('#exit').on('click', function(){
		
		id = "<%= custVo.getCus_id()%>";
		
		if(confirm("정말 탈퇴하시겠습니까?")==true){
			
			$.ajax({
				url : "/CFMS/CustomerOut.do",
				Type : 'get',
				data : { "id" : id },
				dataType : 'json',
				success : function(res){
					
					location.href="<%= request.getContextPath()%>/mainPage.do";
					
				},

			})
			
		alert(" 회원탈퇴가 완료 되었습니다  😢 😢 😢 ")
			
		}else{
			return;	
		}
	
// 		$.ajax({
// 			url : "/CFMS/CustomerOut.do",
// 			Type : 'get',
// 			data : { "id" : id },
// 			dataType : 'json',
// 			success : function(res){
				
<%-- 				location.href="<%= request.getContextPath()%>/mainPage.do"; --%>
				
// 			},

// 		})
		
		
	})
	
	
		
		

	
	
})

</script>
</head>
<body>
	
	<%
	
		String adminCheck = "";
		if(!"admin".equals(custVo.getCus_id())){
			adminCheck ="style='display:none;'";
		}
	%>
	
	<div id="container">
		<div id="content_wrap">
		
			<!-- header 시작 -->
			<div class="header">
			
				<!-- navbar 시작 -->
				<div id="navbar">
				
					<div class="inner">
						<div class="logo">
							<h1>
								<a href="loginMainView.do?id=<%=custVo.getCus_id()%>">gifti-ILJO</a>
							</h1>
						</div>
						<div class="search">
							<form action="searchProduct.do" id="searchProduct" method="post">
								
								<input type="text" name="id" value="<%=custVo.getCus_id()%>" hidden="">
								<input type='text' class="search_area" id='search' name='search' placeholder="기프티일조에서 원하시는 상품을 검색해보세요.">
								<label for=""><a href="#" onclick="document.getElementById('searchProduct').submit();" class="btn_sch"><img src="${pageContext.request.contextPath}/images/search.png" alt="검색"></a></label>
							</form>

						</div>
						<div class="right_menu">
							<p>
								<a href="http://localhost/CFMS/loginMainView.do?id=<%=custVo.getCus_id()%>">상품</a>
							</p>
							<p>
								<a OnClick="location.href ='customerService.do?id=<%=custVo.getCus_id()%>'">고객센터</a>
							</p>
						</div>
					</div>
				</div>

				<!-- // header -->

				<!-- login bar -->

				<div class="loginbar_wrap after">
					<ul>
						<li class="loginbar">
							<a href="myPageInfo.do?id=<%=custVo.getCus_id()%>"><%=custVo.getNicknm()%>님(<%=custVo.getPoint()%>P)</a>
						</li>
						<li class="loginbar">
							<a id="active_hover" href="myPageInfo.do?id=<%=custVo.getCus_id()%>" class="bar">마이페이지</a>
						</li>
						<li class="loginbar">
							<a href="productInfo.do?id=<%=custVo.getCus_id()%>" class="bar">상품등록</a>
						</li>
						<li class="loginbar">
							<a href="chargeInfo.do?id=<%=custVo.getCus_id()%>" class="bar">포인트충전</a>
						</li>
						<li id="admin_title" class ="loginbar" <%=adminCheck %>><a href="adminUserInfo.do" class="bar">관리자 페이지</a></li>
						<li class="loginbar">
							<a href="logOut.do?id=<%=custVo.getCus_id()%>" class="bar">로그아웃</a>
						</li>
					</ul>
				</div>
			</div>
			<!-- header 끝 -->

			<!-- body 시작 -->
			<div class="body">
				<form action="searchMyInfo.do" id="searchMyInfo" method="post">
					<!-- wrapper 시작 -->
					<div id="wrapper">
						<h2>마이페이지</h2>
						<div class="main">

							<input type="text" name="id" value="<%=custVo.getCus_id()%>" hidden=""> 
							<!-- 내 상세정보, 내 정보수정, 내 거래내역조회 값 들어가는 곳  -->
							<input class="tab" 	id="tab4" type="radio" value="myinfo_detail" name="tabs" <%=myinfo_detail %> onclick="document.getElementById('searchMyInfo').submit();">
							<label class="lb" for="tab4"><span>내정보</span></label>
							<input class="tab" 	id="tab3" type="radio" value="myInfoupdate" name="tabs" <%=myInfoupdate %> onclick="document.getElementById('searchMyInfo').submit();">
							<label class="lb" for="tab3"><span>내정보수정</span></label>
							<input class="tab" id="tab1" type="radio" value="mybuy" name="tabs" <%=myBuy %>	onclick="document.getElementById('searchMyInfo').submit();">
							<label class="lb" for="tab1"><span>거래내역조회</span></label> 
							<input class="tab" id="tab2" type="radio" value="mypoint" name="tabs" <%=myPoint %> onclick="document.getElementById('searchMyInfo').submit();">
							<label class="lb" for="tab2"><span>포인트정보</span></label> 
							
							<!-- 밑에 빈from 태그하나 해줘야 아래 form태그들이 잘먹힘 -->
							<form>
							</form> <!-- empty form -->



							<!-- 섹션1 시작 -->
							<section id="content1">
								<div class="mysection deal">

									
									<div class=" form_wrapper">
									
										<p class="pr">조회기간</p>
	
										<form action="searchPaymentProduct.do" method="post">
											<input type="text" name="id" value="<%=custVo.getCus_id()%>" hidden=""> 
											<input class="term" name="paydate" type="submit" value="1일">
										</form>
	
										<form action="searchPaymentProduct.do" method="post">
											<input type="text" name="id" value="<%=custVo.getCus_id()%>" hidden=""> 
											<input class="term" name="paydate" type="submit" value="1주일">
										</form>
	
										<form action="searchPaymentProduct.do" method="post">
											<input type="text" name="id" value="<%=custVo.getCus_id()%>" hidden=""> 
											<input class="term" name="paydate" type="submit" value="1개월">
										</form>
	
										<form action="searchPaymentProduct.do" method="post">
											<input type="text" name="id" value="<%=custVo.getCus_id()%>" hidden=""> 
											<input class="term" name="paydate" type="submit" value="1년">
										</form>
	
										<form action="searchPaymentProductTerm.do" method="post">
											<input type="text" name="id" value="<%=custVo.getCus_id()%>" hidden=""> 
											<input type="date"  name="startpaydate" >
											~ <input type="date"  name="endpaydate" > 
											<input id="search" type="submit" value="조회">
										</form>
									</div>
								</div>
								<!-- deal 끝 -->
								<div class= "mysection buying">
									<h3><span class="dot">●</span>구매내역</h3>
									<div class="txt_bg">
										<p class="ct">주문일시</p>
										<p class="ct">상품명</p>
										<p class="ct">주문번호</p>
										<p class="ct">결제금액</p>
									</div>

									<ul class="myBuyList">
										<%
							if(buyList!=null){
								for(int i =0; i<buyList.size(); i++){
									BuyVO buyVo = buyList.get(i);
									ProductVO buyProdVo = buyProdList.get(i);
						%>
										<li id="myBuyPordList">
											<div class="myBuyPordView">
												<span><%=buyVo.getBuy_dt() %></span>
												<span><%=buyProdVo.getPro_nm()%></span>
												<span><%=buyVo.getBuy_cd() %></span>
												<span><%=buyProdVo.getPro_pr() %></span>	
											</div>
										</li>


										<%			
								}
							}
						
						%>
									</ul>
								</div>
								<div class="mysection selling">
									<h3><span class="dot">●</span>판매내역</h3>
									<div class="txt_bg">
										<p class="ct">주문일시</p>
										<p class="ct">상품명</p>
										<p class="ct">주문번호</p>
										<p class="ct">결제금액</p>
									</div>
									
									<ul class="mySelList">
										<%
								if(selList!=null){
									for(int i =0; i<selList.size(); i++){
										SelVO selVo = selList.get(i);
										ProductVO selProdVo = selProdList.get(i);
							%>
										<li id="mySelPordList">
											<div class="mySelPordView">
												<span><%=selVo.getSel_dt() %></span>
												<span><%=selProdVo.getPro_nm()%></span>
												<span><%=selVo.getSel_cd() %></span>
												<span><%=selProdVo.getPro_pr() %></span>
											</div>
										</li>


										<%			
									}
								}
							
							%>
									</ul>
								</div>
							</section>
							<!-- 섹션1 끝 -->

							<!-- 섹션2 시작 -->
							<section id="content2">
								<h3><span class="dot">●</span>포인트현황</h3>
								
								<div class="txt_bg">
									<p class="po ct">총 충전 포인트</p>
									<p class="po ct">사용 가능 포인트</p>
								</div>

								<%
									int totalPoint = 0;
									int usePoint = 0;
									int point = custVo.getPoint();
									if (charList != null) {
										for (int i = 0; i < charList.size(); i++) {
											totalPoint += charList.get(i).getCha_pr();
										}

										usePoint = totalPoint - point;
									}
								%>


								<div class="mysection">		
									<ul>					
										<li class="li_width">
											<div>
												<label><span><%=totalPoint %>P</span></label> 
												<label><span class="span_width2"><%=point %>P</span></label>
											</div>
										</li>
									</ul>
								</div>	

								
								<h3><span class="dot">●</span>충전내역</h3>
								<div class="mysection deal margin_none">
									
									<div class=" form_wrapper">
										<p class="pr">조회기간</p>
										
										<form action="searchDate.do" method="post">
											<input type="text" name="id" value="<%=custVo.getCus_id()%>" hidden=""> 
											<input class="term" name="date" type="submit" value="1일">
										</form>
	
										<form action="searchDate.do" method="post">
											<input type="text" name="id" value="<%=custVo.getCus_id()%>" hidden=""> 
											<input class="term" name="date" type="submit" value="1주일">
										</form>
	
										<form action="searchDate.do" method="post">
											<input type="text" name="id" value="<%=custVo.getCus_id()%>" hidden=""> 
											<input class="term" name="date" type="submit" value="1개월">
										</form>
	
										<form action="searchDate.do" method="post">
											<input type="text" name="id" value="<%=custVo.getCus_id()%>" hidden=""> 
											<input class="term" name="date" type="submit" value="1년">
										</form>
	
										<form action="searchDateTerm.do" method="post">
											<input type="text" name="id" value="<%=custVo.getCus_id()%>" hidden=""> 
											<input type="date"  name="startdate" >
											~ <input type="date"  name="enddate" > 
											<input id="search2" type="submit" value="조회">
										</form>
										
									</div>
									
								</div>
								<!-- deal 끝 -->
								
								
								<div class= "mysection">
								
									<div class="txt_bg">
										<p class="ct po1" id="price_width1">일시</p>
										<p class="ct po1">구분</p>
										<p class="ct po1" id="price_width2">금액</p>
									</div>
									
									<ul class="myChargePoint">
									
									<%
				    					if(charList2!=null){
				    						for(int i=0; i<charList2.size(); i++ ){
				    							ChargeVO charVo = charList2.get(i);
				    				%>
					    				
										<li id="myChargePointList">
											<div class="myChargePointView">
												<span class="span_width"><%=charVo.getCha_dt() %></span>
												<span class="span_width">포인트구매</span>
												<span class="span_width"><%=charVo.getCha_pr() %></span>
											</div>
										</li>
	
										<% 	
					    						}
					    					}
					    				%>
					    				
									</ul>
									
								
								</div>

							</section>
							<!-- 섹션2 끝 -->

							<!-- 섹션3 시작 -->
							<section id="content3">
								
								<div class="form_wrapper">
																			
									<h3><span class="dot">●</span>회원정보변경</h3>
										
									<div class="regi_form">
									
										<ul>
											<li>
												<label class="label">
													<p>아이디</p>
												</label> 
												<input class="join" type="text" placeholder="<%= custVo.getCus_id()%>" disabled="disabled">											
											</li>
											<li>
											<form action="CustomerMypageUpdate.do" method="post">
												<label class="label">
													<p>닉네임</p>
												</label> 
												<input type="text" name="id" value="<%=custVo.getCus_id()%>" hidden="">          
												<input type="text" name="check" value="닉네임변경" hidden="">
												<input class="join" type="text" name="Upnick" id="nick" maxlength="11" placeholder="12자 초과 불가">
												<input class="update mypage_update_bth" type="submit" id="upnick" value="수정하기" disabled="">
												<span id="checknick"></span>
											</form>										
											</li>
											<li>
												<label class="label">
													<p>비밀번호 변경</p>
												</label> 
												<input class="join" type="password" id="pass1" placeholder="영 소문자 대문자 특수문자">
												<img class="step_url1" src="./images/비번안되는이미지.png" style=" height: 20px;">
												
												<span id="checkpass"></span>											
											</li>
											<li>
											<form action="CustomerMypageUpdate.do" method="post">
												<label class="label">
													<p>비밀번호 다시입력</p>
												</label> 
												<input type="text" name="id" value="<%=custVo.getCus_id()%>" hidden="">     
												<input type="text" name="check" value="비밀번호변경" hidden="">
												<input class="join" type="password" name="Uppass" id="pass2">
												<input class="update mypage_update_bth" type="submit" id="uppass" value="수정하기" disabled="">
												<span id="checkpass1"></span>
											</form>							
											</li>
											<li>
											<form action="CustomerMypageUpdate.do" method="post">
												<label class="label">
													<p>이메일 변경</p>
												</label> 
												<input type="text" name="id" value="<%=custVo.getCus_id()%>" hidden="">     
												<input type="text" name="check" value="이메일변경" hidden="">   
												<input class="join" type="email" name="Upmail" id="mail">	
												<input class="update mypage_update_bth" type="submit" id="upmail" value="수정하기" disabled="">
												<span id="checkmail"></span>	
											</form>									
											</li>											
										</ul>
										<div id="underdiv">
											<p>탈퇴를 원하시면 회원탈퇴 버튼을 눌러주세요</p>
											<input id="exit" type="button" value="회원탈퇴">
										</div>
									
										
									
									</div>
									
								</div>
								
							</section>
							<!-- 섹션3 끝 -->
							
							
							<!-- 섹션4 시작 -->
							<section id="content4">
								
								<div class="form_wrapper">
																			
									<h3><span class="dot">●</span>내정보</h3>
										
									<div class="regi_form">
										<P><span>아이디</span> <%=custVo.getCus_id() %></P>
										<P><span>닉네임</span> <%=custVo.getNicknm()%></P>
										<P><span>포인트</span> <%=custVo.getPoint()%>P</P>
										<P><span>전화번호</span> <%=custVo.getTel()%></P>
										<P><span>이메일</span> <%=custVo.getEmail()%></P>
										<P><span>신고횟수</span> <%=custVo.getReport_cnt()%></P>
										
									
									</div>
									
								</div>
								
							</section>
							<!-- 섹션4 끝 -->
							

						</div>
						<!-- main 끝 -->


					</div>
					<!-- wrapper 끝 -->
				</form>
			</div>
			<!-- End body -->

		</div>
		<!-- End content_wrap -->
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
</body>
</html>