<%@page import="kr.or.ddit.cfms.vo.ProductVO"%>
<%@page import="kr.or.ddit.cfms.vo.ProlistVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<!DOCTYPE html>

<html>

<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css"> 
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/main_login.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/mainbbbb.css" />
<link rel="icon" type="image/png" sizes="32x32" href="${pageContext.request.contextPath}/images/favicon3_105_icon.ico">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<script>
	$(function() {
		$('.failLogin').on('click',function () {
			Swal.fire({
				  icon: 'error',
				  title: '회원만 이용 가능합니다.',
				  text: '로그인 / 회원가입을 해주세요',
				})
			return false;
		});
	});

</script>

<style>
.main_slide {
    width: 0;
}
.fadeShow { 
background: #666;
width: 100%;
height: 370px;       
}
.fadeShow img{position:absolute;}
.fadeShow .active{
    z-index:1;
}
</style>



<title>gifti_ILJO</title>
</head>
<body>
	<div id="container">
		<div id="content_wrap">
		
			<!-- header 시작 -->
			<div class="header">
			
				<!-- navbar 시작 -->
				<div id="navbar">
					<div class="inner">
						<div class="logo">
							<h1><a href="mainPage.do">gifti-ILJO</a></h1>
						</div>
						<div class="search">
							<input type='text' class="search_area" id='search' name='search' placeholder="기프티일조에서 원하시는 상품을 검색해보세요.">
							<label for=""><a href="javascript:topsearch();" class="btn_sch failLogin"><img src="${pageContext.request.contextPath}/images/search.png" alt="검색"></a></label>
							
						</div>
						<div class="right_menu">
							<p><a id="cust_on" class="failLogin" href="#all_products">상품</a></p>
							<p><a class="failLogin" href="#">고객센터</a></p>
						</div>			
					</div>
				</div>	
				<!-- navbar 끝 -->
				
				<!-- loginbar before 시작 -->
				<div class="loginbar_wrap before">
					<ul>
						<li class ="loginbar"><a data-toggle="modal" href="#id01">로그인</a></li>


						<li class ="loginbar"><a href="${pageContext.request.contextPath}/board/main_joinmember.jsp" class="bar">회원가입</a></li>

					</ul>
				</div>
				<!-- loginbar before 끝 -->
				
				<!-- loginbar after 시작 -->
				<div class="loginbar_wrap after" style="display:none;">
					<ul>
						<li class ="loginbar"><a href="#">홍길동님</a></li>
						<li class ="loginbar"><a href="#" class="bar">마이페이지</a></li>
						<li class ="loginbar"><a href="#" class="bar">상품등록</a></li>
						<li class ="loginbar"><a href="#" class="bar">포인트충전</a></li>
						<li class ="loginbar"><a href="#" class="bar">로그아웃</a></li>
					</ul>
				</div>
				<!-- loginbar after 끝 -->
				
			</div>
			<!-- header 끝 -->
			
			
			<!-- body 시작 -->
			<div class="body">
			
				<!-- main_slide 시작 -->
				<div class="main_slide">
				
					<div class="fadeShow">
					     <img class="active" src="${pageContext.request.contextPath}/images/main_slide1.jpg" alt="image1" />
					     <img src="${pageContext.request.contextPath}/images/main_slide3.jpg" alt="image2" />
					     <img src="${pageContext.request.contextPath}/images/123.jpg" alt="image3" />
					</div>
					
					
					<script>
					var showImg, nextImg;
					
					function fadeInOut(){
					   
					   showImg = $(".fadeShow img:eq(0)");
					   nextImg = $(".fadeShow img:eq(1)");
					   nextImg.addClass("active");
					   nextImg.css("opacity","0")
					    .animate({opacity:1},500, 
				    		function() {     
					         $(".fadeShow").append( showImg );  
					      showImg.removeClass("active");  
					    });
					}
					var timer = setInterval("fadeInOut()",4000);
					$(".fadeShow").hover( 
					    function() {
					    clearInterval(timer)
					 }, 
					 function(){
					    timer = setInterval("fadeInOut()",4000);
					    }
					);
					</script>
				
				
					
				</div>
				<!-- main_slide 끝 -->
				
				<!-- all_products 시작 -->
				<div class="all_products" id="all_products">
					<h3>전체상품</h3>
					
					<!-- filter 시작 -->
					<div class="filter">
						
						<dl class="filter_category">
							<dt>카테고리</dt>
							<dd>
								<ul>
									<li class="category failLogin">
										<input onchange="category()" type="checkbox" name="Category[]" value="베이커리/도넛" id="A1">
										<label for="A1">베이커리/도넛</label>
									</li>
									<li class="category failLogin">
										<input onchange="category()" type="checkbox" name="Category[]" value="베이커리/도넛" id="A2">
										<label for="A2">커피/음료</label>
									</li>
									<li class="category failLogin">
										<input onchange="category()" type="checkbox" name="Category[]" value="베이커리/도넛" id="A3">
										<label for="A3">편의점</label>
									</li>
									<li class="category failLogin">
										<input onchange="category()" type="checkbox" name="Category[]" value="베이커리/도넛" id="A4">
										<label for="A4">피자/치킨</label>
									</li>
									<li class="category failLogin">
										<input onchange="category()" type="checkbox" name="Category[]" value="베이커리/도넛" id="A5">
										<label for="A5">패스트푸드</label>
									</li>
								</ul>
							</dd>
						</dl>
													
						<dl>
							<dt>브랜드</dt>
							<dd class="filter_brand">
								<ul>
								<li class="brand failLogin">
									<input onchange="category()" type="checkbox" name="Category[]" value="베이커리/도넛" id="B1">
									<label for="B1">파리바게트</label>
								</li>
								<li class="brand failLogin">
									<input onchange="category()" type="checkbox" name="Category[]" value="베이커리/도넛" id="B2">
									<label for="B2">던킨</label>
								</li>
								<li class="brand failLogin">
									<input onchange="category()" type="checkbox" name="Category[]" value="베이커리/도넛" id="B3">
									<label for="B3">스타벅스</label>
								</li>
								<li class="brand failLogin">
									<input onchange="category()" type="checkbox" name="Category[]" value="베이커리/도넛" id="B4">
									<label for="B4">메가커피</label>
								</li>
								<li class="brand failLogin">
									<input onchange="category()" type="checkbox" name="Category[]" value="베이커리/도넛" id="B5">
									<label for="B5">GS25</label>
								</li>
								<li class="brand failLogin">
									<input onchange="category()" type="checkbox" name="Category[]" value="베이커리/도넛" id="B6">
									<label for="B6">이마트24</label>
								</li>
								<li class="brand failLogin">
									<input onchange="category()" type="checkbox" name="Category[]" value="베이커리/도넛" id="B7">
									<label for="B7">도미노피자</label>
								</li>
								<li class="brand failLogin">
									<input onchange="category()" type="checkbox" name="Category[]" value="베이커리/도넛" id="B8">
									<label for="B8">BBQ</label>
								</li>
								<li class="brand failLogin">
									<input onchange="category()" type="checkbox" name="Category[]" value="베이커리/도넛" id="B9">
									<label for="B9">맥도날드</label>
								</li>
								<li class="brand failLogin">
									<input onchange="category()" type="checkbox" name="Category[]" value="베이커리/도넛" id="B10">
									<label for="B10">서브웨이</label>
								</li>
							</ul>
							</dd>
						</dl>
				
						<dl class="filter_price">
							<dt>가격</dt>
							<dd>
								<ul>
								<li class="price failLogin">
									<input onchange="category()" type="checkbox" name="Category[]" value="베이커리/도넛" id="C1">
									<label for="C1">3천원이하</label>
								</li>
								<li class="price failLogin">
									<input onchange="category()" type="checkbox" name="Category[]" value="베이커리/도넛" id="C2">
									<label for="C2">3천-5천원</label>
								</li>
								<li class="price failLogin">
									<input onchange="category()" type="checkbox" name="Category[]" value="베이커리/도넛" id="C3">
									<label for="C3">5천-1만원</label>
								</li>
								<li class="price failLogin">
									<input onchange="category()" type="checkbox" name="Category[]" value="베이커리/도넛" id="C4">
									<label for="C4">1만-3만원</label>
								</li>
								<li class="price failLogin">
									<input onchange="category()" type="checkbox" name="Category[]" value="베이커리/도넛" id="C5">
									<label for="C5">3만원이상</label>
								</li>
							</ul>
							</dd>
						</dl>
					</div>
					<!-- filter 끝 -->
					

					
					<!-- DB에 저장된 상품 게시글을 받아오는 작업 -->
					<div class="products">
						
					
						<ul class="product_ul">
						<%
							List<ProlistVO> proList = (List<ProlistVO>)request.getAttribute("prolist");
							List<ProductVO> prodList = (List<ProductVO>)request.getAttribute("prodlist");
							if(prodList.size()!=0){			
							for(int i = 0; i<proList.size(); i++){
								ProlistVO proVo = proList.get(i);
								ProductVO prodVo = prodList.get(i);
								int no = i+1;
								
								int pie = (int)Math.round(prodVo.getPro_pr()*100.0/prodVo.getRet_pr());
								
								pie = 100-pie;
						
						%>
						
						<!-- http://199.999.999(개발서버ip)/이미지  절대경로/aaa.jpg
						D:\D_Other\uploadImage -->
						

						<li class="product failLogin"  OnClick="#" class="failLogin">
							 
							<!-- <img id="test" src="http://192.168.42.46/imageResponse.jsp" > -->
							<%-- <img alt="오류" src="${pageContext.request.contextPath}/images/coffee.jpg"> --%>
							<div class="product_wrapper">
								<div class="product_img">
									<%
										if(prodVo.getBrand().equals("파리바게트")){
									%>
									
									<img id="image" src="${pageContext.request.contextPath}/images/paris.jpg" alt="파리바게트">

									<%
										}else if(prodVo.getBrand().equals("던킨")){
									%>	

									<img id="image" src="${pageContext.request.contextPath}/images/dunkin.jpg" alt="던킨">

									<%
										}else if(prodVo.getBrand().equals("스타벅스")){
									%>			

									<img id="image" src="${pageContext.request.contextPath}/images/star.jpg" alt="스타벅스">
									
									<%
										}else if(prodVo.getBrand().equals("메가커피")){
									%>			

									<img id="image" src="${pageContext.request.contextPath}/images/mega.jpg" alt="메가커피">
									
									<%
										}else if(prodVo.getBrand().equals("GS25")){
									%>			

									<img id="image" src="${pageContext.request.contextPath}/images/gs25.jpg" alt="GS25">
									
									<%
										}else if(prodVo.getBrand().equals("이마트24")){
									%>			

									<img id="image" src="${pageContext.request.contextPath}/images/emart.jpg" alt="이마트24">
									
									<%
										}else if(prodVo.getBrand().equals("도미노피자")){
									%>			

									<img id="image" src="${pageContext.request.contextPath}/images/domino.jpg" alt="도미노피자">
									
									<%
										}else if(prodVo.getBrand().equals("BBQ")){
									%>			

									<img id="image" src="${pageContext.request.contextPath}/images/bbq.jpg" alt="BBQ">
									
									<%
										}else if(prodVo.getBrand().equals("맥도날드")){
									%>			

									<img id="image" src="${pageContext.request.contextPath}/images/mcdonald.jpg" alt="맥도날드">
									
									<%
										}else if(prodVo.getBrand().equals("서브웨이")){
									%>			

									<img id="image" src="${pageContext.request.contextPath}/images/subway.jpg" alt="서브웨이">
									
									<%
										}
									%>
									
									<p class="sale">SALE <%=pie %>%</p>
								</div>
								<div class="product_txt">
									<p class="product_before_price"><%=prodVo.getRet_pr()%></p>
									<p class="product_price"><%=prodVo.getPro_pr() %></p>
									<p class="product_name"><%=prodVo.getPro_nm() %></p>
									<p class="product_brand"><%=prodVo.getBrand() %></p>
									<p class="product_status"><%=proVo.getSel_check()%></p>
								</div>
							</div>
						</li>
						
						<% 
							}

							}
						%> 

						</ul> 	
						<form class="more" action="loginMainView.do" method="post">
							<div class="more_btn">
								<button class="more_wrapper failLogin btn-right" >
								<img class ="more_btn" src="${pageContext.request.contextPath}/images/arrow.png" alt="" >
								</button>
							</div>
 						</form>


						<div class="push_clear"></div>

					</div> 
					<!-- products 끝 -->
					
				</div>
				<!-- all_products 끝 -->
				
			</div>
			<!-- body 끝 -->
			
		</div>
		<!-- content_wrap 끝 -->

<!-- 	움직이는이미지 시작 -->
	<div class="floatinglogos">
        <ul class="logoitemgroup firsttrain">
            <!-- ngRepeat: item in logoitems --><li ng-repeat="item in logoitems" class="ng-scope">
                <div class="logo-item" style="width:3.9000000000000004rem; height:3.9000000000000004rem; position:relative; top:3rem; margin:0.5rem 1.1rem">
                    <img ng-src="${pageContext.request.contextPath}/images/CU로고.png" type="image/svg+xml" src="${pageContext.request.contextPath}/images/CGV로고.png">
                </div>
            </li><!-- end ngRepeat: item in logoitems --><li ng-repeat="item in logoitems" class="ng-scope">
                <div class="logo-item" style="width:5.2rem; height:5.2rem; position:relative; top:2rem; margin:0.5rem 0.6rem">
                    <img ng-src="${pageContext.request.contextPath}/images/11번가 로고.png" type="image/svg+xml" src="${pageContext.request.contextPath}/images/11번가 로고.png">
                </div>
            </li><!-- end ngRepeat: item in logoitems --><li ng-repeat="item in logoitems" class="ng-scope">
                <div class="logo-item" style="width:2.6rem; height:2.6rem; position:relative; top:2rem; margin:0.5rem 0.1rem">
                    <img ng-src="${pageContext.request.contextPath}/images/굽네치킨로고.png" type="image/svg+xml" src="${pageContext.request.contextPath}/images/굽네치킨로고.png">
                </div>
            </li><!-- end ngRepeat: item in logoitems --><li ng-repeat="item in logoitems" class="ng-scope">
                <div class="logo-item" style="width:3.9000000000000004rem; height:3.9000000000000004rem; position:relative; top:2.5rem; margin:0.5rem 2.1rem">
                    <img ng-src="${pageContext.request.contextPath}/images/농심로고.png" type="image/svg+xml" src="${pageContext.request.contextPath}/images/농심로고.png">
                </div>
            </li><!-- end ngRepeat: item in logoitems --><li ng-repeat="item in logoitems" class="ng-scope">
                <div class="logo-item" style="width:2.6rem; height:2.6rem; position:relative; top:1rem; margin:0.5rem 2.1rem">
                    <img ng-src="${pageContext.request.contextPath}/images/던킨로고.png" type="image/svg+xml" src="${pageContext.request.contextPath}/images/던킨로고.png">
                </div>
            </li><!-- end ngRepeat: item in logoitems --><li ng-repeat="item in logoitems" class="ng-scope">
                <div class="logo-item" style="width:5.2rem; height:5.2rem; position:relative; top:1.5rem; margin:0.5rem 2.1rem">
                    <img ng-src="${pageContext.request.contextPath}/images/마시닭로고png.png" type="image/svg+xml" src="${pageContext.request.contextPath}/images/마시닭로고png.png">
                </div>
            </li><!-- end ngRepeat: item in logoitems --><li ng-repeat="item in logoitems" class="ng-scope">
                <div class="logo-item" style="width:2.6rem; height:2.6rem; position:relative; top:1rem; margin:0.5rem 1.6rem">
                    <img ng-src="${pageContext.request.contextPath}/images/맘스터치.png" type="image/svg+xml" src="${pageContext.request.contextPath}/images/맘스터치.png">
                </div>
            </li><!-- end ngRepeat: item in logoitems --><li ng-repeat="item in logoitems" class="ng-scope">
                <div class="logo-item" style="width:2.6rem; height:2.6rem; position:relative; top:2rem; margin:0.5rem 0.1rem">
                    <img ng-src="${pageContext.request.contextPath}/images/멕시카나로고.png" type="image/svg+xml" src="${pageContext.request.contextPath}/images/멕시카나로고.png">
                </div>
            </li><!-- end ngRepeat: item in logoitems --><li ng-repeat="item in logoitems" class="ng-scope">
                <div class="logo-item" style="width:2.6rem; height:2.6rem; position:relative; top:2rem; margin:0.5rem 2.1rem">
                    <img ng-src="${pageContext.request.contextPath}/images/빠바로고.png" type="image/svg+xml" src="${pageContext.request.contextPath}/images/빠바로고.png">
                </div>
            </li><!-- end ngRepeat: item in logoitems --><li ng-repeat="item in logoitems" class="ng-scope">
                <div class="logo-item" style="width:3.9000000000000004rem; height:3.9000000000000004rem; position:relative; top:1.5rem; margin:0.5rem 1.1rem">
                    <img ng-src="${pageContext.request.contextPath}/images/세븐일레븐로고.png" type="image/svg+xml" src="${pageContext.request.contextPath}/images/세븐일레븐로고.png">
                </div>
            </li><!-- end ngRepeat: item in logoitems --><li ng-repeat="item in logoitems" class="ng-scope">
                <div class="logo-item" style="width:5.2rem; height:5.2rem; position:relative; top:2rem; margin:0.5rem 2.1rem">
                    <img ng-src="${pageContext.request.contextPath}/images/스타벅스.png" type="image/svg+xml" src="${pageContext.request.contextPath}/images/스타벅스.png">
                </div>
            </li><!-- end ngRepeat: item in logoitems --><li ng-repeat="item in logoitems" class="ng-scope">
                <div class="logo-item" style="width:5.2rem; height:5.2rem; position:relative; top:1.5rem; margin:0.5rem 0.1rem">
                    <img ng-src="${pageContext.request.contextPath}/images/옛통로고.png" type="image/svg+xml" src="${pageContext.request.contextPath}/images/옛통로고.png">
                </div>
            </li><!-- end ngRepeat: item in logoitems --><li ng-repeat="item in logoitems" class="ng-scope">
                <div class="logo-item" style="width:2.6rem; height:2.6rem; position:relative; top:3rem; margin:0.5rem 0.6rem">
                    <img ng-src="${pageContext.request.contextPath}/images/이마트로고.png" type="image/svg+xml" src="${pageContext.request.contextPath}/images/이마트로고.png">
                </div>
            </li><!-- end ngRepeat: item in logoitems --><li ng-repeat="item in logoitems" class="ng-scope">
                <div class="logo-item" style="width:2.6rem; height:2.6rem; position:relative; top:2rem; margin:0.5rem 1.6rem">
                    <img ng-src="${pageContext.request.contextPath}/images/커피집1.png" type="image/svg+xml" src="${pageContext.request.contextPath}/images/커피집1.png">
                </div>
            </li><!-- end ngRepeat: item in logoitems --><li ng-repeat="item in logoitems" class="ng-scope">
                <div class="logo-item" style="width:3.9000000000000004rem; height:3.9000000000000004rem; position:relative; top:2rem; margin:0.5rem 0.1rem">
                    <img ng-src="${pageContext.request.contextPath}/images/크리스피도넛로고.png" type="image/svg+xml" src="${pageContext.request.contextPath}/images/CGV로고.png">
                </div>
            </li><!-- end ngRepeat: item in logoitems --><li ng-repeat="item in logoitems" class="ng-scope">
                <div class="logo-item" style="width:5.2rem; height:5.2rem; position:relative; top:1.5rem; margin:0.5rem 0.1rem">
                    <img ng-src="${pageContext.request.contextPath}/images/11번가 로고.png" type="image/svg+xml" src="${pageContext.request.contextPath}/images/11번가 로고.png">
                </div>
            </li><!-- end ngRepeat: item in logoitems --><li ng-repeat="item in logoitems" class="ng-scope">
                <div class="logo-item" style="width:2.6rem; height:2.6rem; position:relative; top:1.5rem; margin:0.5rem 2.1rem">
                    <img ng-src="${pageContext.request.contextPath}/images/굽네치킨로고.png" type="image/svg+xml" src="${pageContext.request.contextPath}/images/굽네치킨로고.png">
                </div>
            </li><!-- end ngRepeat: item in logoitems --><li ng-repeat="item in logoitems" class="ng-scope">
                <div class="logo-item" style="width:5.2rem; height:5.2rem; position:relative; top:2rem; margin:0.5rem 1.1rem">
                    <img ng-src="${pageContext.request.contextPath}/images/농심로고.png" type="image/svg+xml" src="${pageContext.request.contextPath}/images/농심로고.png">
                </div>
            </li><!-- end ngRepeat: item in logoitems --><li ng-repeat="item in logoitems" class="ng-scope">
                <div class="logo-item" style="width:5.2rem; height:5.2rem; position:relative; top:3rem; margin:0.5rem 0.6rem">
                    <img ng-src="${pageContext.request.contextPath}/images/던킨로고.png" type="image/svg+xml" src="${pageContext.request.contextPath}/images/던킨로고.png">
                </div>
            </li><!-- end ngRepeat: item in logoitems --><li ng-repeat="item in logoitems" class="ng-scope">
                <div class="logo-item" style="width:5.2rem; height:5.2rem; position:relative; top:1rem; margin:0.5rem 1.1rem">
                    <img ng-src="${pageContext.request.contextPath}/images/마시닭로고png.png" type="image/svg+xml" src="${pageContext.request.contextPath}/images/마시닭로고png.png">
                </div>
            </li><!-- end ngRepeat: item in logoitems --><li ng-repeat="item in logoitems" class="ng-scope">
                <div class="logo-item" style="width:2.6rem; height:2.6rem; position:relative; top:1.5rem; margin:0.5rem 0.1rem">
                    <img ng-src="${pageContext.request.contextPath}/images/맘스터치.png" type="image/svg+xml" src="${pageContext.request.contextPath}/images/맘스터치.png">
                </div>
            </li><!-- end ngRepeat: item in logoitems --><li ng-repeat="item in logoitems" class="ng-scope">
                <div class="logo-item" style="width:3.9000000000000004rem; height:3.9000000000000004rem; position:relative; top:2rem; margin:0.5rem 2.1rem">
                    <img ng-src="${pageContext.request.contextPath}/images/멕시카나로고.png" type="image/svg+xml" src="${pageContext.request.contextPath}/images/멕시카나로고.png">
                </div>
            </li><!-- end ngRepeat: item in logoitems --><li ng-repeat="item in logoitems" class="ng-scope">
                <div class="logo-item" style="width:3.9000000000000004rem; height:3.9000000000000004rem; position:relative; top:3rem; margin:0.5rem 1.1rem">
                    <img ng-src="${pageContext.request.contextPath}/images/빠바로고.png" type="image/svg+xml" src="${pageContext.request.contextPath}/images/빠바로고.png">
                </div>
            </li><!-- end ngRepeat: item in logoitems --><li ng-repeat="item in logoitems" class="ng-scope">
                <div class="logo-item" style="width:3.9000000000000004rem; height:3.9000000000000004rem; position:relative; top:2rem; margin:0.5rem 1.6rem">
                    <img ng-src="${pageContext.request.contextPath}/images/세븐일레븐로고.png" type="image/svg+xml" src="${pageContext.request.contextPath}/images/세븐일레븐로고.png">
                </div>
            </li><!-- end ngRepeat: item in logoitems --><li ng-repeat="item in logoitems" class="ng-scope">
                <div class="logo-item" style="width:2.6rem; height:2.6rem; position:relative; top:2rem; margin:0.5rem 2.1rem">
                    <img ng-src="${pageContext.request.contextPath}/images/스타벅스.png" type="image/svg+xml" src="${pageContext.request.contextPath}/images/스타벅스.png">
                </div>
            </li><!-- end ngRepeat: item in logoitems --><li ng-repeat="item in logoitems" class="ng-scope">
                <div class="logo-item" style="width:5.2rem; height:5.2rem; position:relative; top:1.5rem; margin:0.5rem 1.1rem">
                    <img ng-src="${pageContext.request.contextPath}/images/옛통로고.png" type="image/svg+xml" src="${pageContext.request.contextPath}/images/옛통로고.png">
                </div>
            </li><!-- end ngRepeat: item in logoitems --><li ng-repeat="item in logoitems" class="ng-scope">
                <div class="logo-item" style="width:3.9000000000000004rem; height:3.9000000000000004rem; position:relative; top:1.5rem; margin:0.5rem 0.1rem">
                    <img ng-src="${pageContext.request.contextPath}/images/이마트로고.png" type="image/svg+xml" src="${pageContext.request.contextPath}/images/이마트로고.png">
                </div>
            </li><!-- end ngRepeat: item in logoitems --><li ng-repeat="item in logoitems" class="ng-scope">
                <div class="logo-item" style="width:3.9000000000000004rem; height:3.9000000000000004rem; position:relative; top:2rem; margin:0.5rem 2.1rem">
                    <img ng-src="${pageContext.request.contextPath}/images/커피집1.png" type="image/svg+xml" src="${pageContext.request.contextPath}/images/커피집1.png">
                </div>
            </li><!-- end ngRepeat: item in logoitems --><li ng-repeat="item in logoitems" class="ng-scope">
                <div class="logo-item" style="width:3.9000000000000004rem; height:3.9000000000000004rem; position:relative; top:3rem; margin:0.5rem 2.1rem">
                    <img ng-src="${pageContext.request.contextPath}/images/할리스커피로고.png" type="image/svg+xml" src="${pageContext.request.contextPath}/images/CGV로고.png">
                </div>
            </li><!-- end ngRepeat: item in logoitems --><li ng-repeat="item in logoitems" class="ng-scope">
                <div class="logo-item" style="width:3.9000000000000004rem; height:3.9000000000000004rem; position:relative; top:1rem; margin:0.5rem 1.1rem">
                    <img ng-src="${pageContext.request.contextPath}/images/11번가 로고.png" type="image/svg+xml" src="${pageContext.request.contextPath}/images/11번가 로고.png">
                </div>
            </li><!-- end ngRepeat: item in logoitems --><li ng-repeat="item in logoitems" class="ng-scope">
                <div class="logo-item" style="width:2.6rem; height:2.6rem; position:relative; top:1rem; margin:0.5rem 0.1rem">
                    <img ng-src="${pageContext.request.contextPath}/images/굽네치킨로고.png" type="image/svg+xml" src="${pageContext.request.contextPath}/images/굽네치킨로고.png">
                </div>
            </li><!-- end ngRepeat: item in logoitems --><li ng-repeat="item in logoitems" class="ng-scope">
                <div class="logo-item" style="width:2.6rem; height:2.6rem; position:relative; top:2.5rem; margin:0.5rem 1.6rem">
                    <img ng-src="${pageContext.request.contextPath}/images/농심로고.png" type="image/svg+xml" src="${pageContext.request.contextPath}/images/농심로고.png">
                </div>
            </li><!-- end ngRepeat: item in logoitems --><li ng-repeat="item in logoitems" class="ng-scope">
                <div class="logo-item" style="width:2.6rem; height:2.6rem; position:relative; top:1rem; margin:0.5rem 0.6rem">
                    <img ng-src="${pageContext.request.contextPath}/images/던킨로고.png" type="image/svg+xml" src="${pageContext.request.contextPath}/images/던킨로고.png">
                </div>
            </li><!-- end ngRepeat: item in logoitems --><li ng-repeat="item in logoitems" class="ng-scope">
                <div class="logo-item" style="width:5.2rem; height:5.2rem; position:relative; top:1.5rem; margin:0.5rem 0.1rem">
                    <img ng-src="${pageContext.request.contextPath}/images/마시닭로고png.png" type="image/svg+xml" src="${pageContext.request.contextPath}/images/마시닭로고png.png">
                </div>
            </li><!-- end ngRepeat: item in logoitems --><li ng-repeat="item in logoitems" class="ng-scope">
                <div class="logo-item" style="width:2.6rem; height:2.6rem; position:relative; top:1rem; margin:0.5rem 1.1rem">
                    <img ng-src="${pageContext.request.contextPath}/images/맘스터치.png" type="image/svg+xml" src="${pageContext.request.contextPath}/images/맘스터치.png">
                </div>
            </li><!-- end ngRepeat: item in logoitems --><li ng-repeat="item in logoitems" class="ng-scope">
                <div class="logo-item" style="width:2.6rem; height:2.6rem; position:relative; top:1.5rem; margin:0.5rem 1.6rem">
                    <img ng-src="${pageContext.request.contextPath}/images/멕시카나로고.png" type="image/svg+xml" src="${pageContext.request.contextPath}/images/멕시카나로고.png">
                </div>
            </li><!-- end ngRepeat: item in logoitems --><li ng-repeat="item in logoitems" class="ng-scope">
                <div class="logo-item" style="width:2.6rem; height:2.6rem; position:relative; top:1.5rem; margin:0.5rem 0.1rem">
                    <img ng-src="${pageContext.request.contextPath}/images/빠바로고.png" type="image/svg+xml" src="${pageContext.request.contextPath}/images/빠바로고.png">
                </div>
            </li><!-- end ngRepeat: item in logoitems --><li ng-repeat="item in logoitems" class="ng-scope">
                <div class="logo-item" style="width:5.2rem; height:5.2rem; position:relative; top:1rem; margin:0.5rem 0.1rem">
                    <img ng-src="${pageContext.request.contextPath}/images/세븐일레븐로고.png" type="image/svg+xml" src="${pageContext.request.contextPath}/images/세븐일레븐로고.png">
                </div>
            </li><!-- end ngRepeat: item in logoitems --><li ng-repeat="item in logoitems" class="ng-scope">
                <div class="logo-item" style="width:3.9000000000000004rem; height:3.9000000000000004rem; position:relative; top:2rem; margin:0.5rem 0.6rem">
                    <img ng-src="${pageContext.request.contextPath}/images/스타벅스.png" type="image/svg+xml" src="${pageContext.request.contextPath}/images/스타벅스.png">
                </div>
            </li><!-- end ngRepeat: item in logoitems --><li ng-repeat="item in logoitems" class="ng-scope">
                <div class="logo-item" style="width:2.6rem; height:2.6rem; position:relative; top:2.5rem; margin:0.5rem 1.1rem">
                    <img ng-src="${pageContext.request.contextPath}/images/옛통로고.png" type="image/svg+xml" src="${pageContext.request.contextPath}/images/옛통로고.png">
                </div>
            </li><!-- end ngRepeat: item in logoitems --><li ng-repeat="item in logoitems" class="ng-scope">
                <div class="logo-item" style="width:2.6rem; height:2.6rem; position:relative; top:3rem; margin:0.5rem 0.6rem">
                    <img ng-src="${pageContext.request.contextPath}/images/이마트로고.png" type="image/svg+xml" src="${pageContext.request.contextPath}/images/이마트로고.png">
                </div>
            </li><!-- end ngRepeat: item in logoitems --><li ng-repeat="item in logoitems" class="ng-scope">
                <div class="logo-item" style="width:3.9000000000000004rem; height:3.9000000000000004rem; position:relative; top:3rem; margin:0.5rem 2.1rem">
                    <img ng-src="${pageContext.request.contextPath}/images/커피집1.png" type="image/svg+xml" src="${pageContext.request.contextPath}/images/커피집1.png">
                </div>
            </li><!-- end ngRepeat: item in logoitems --><li ng-repeat="item in logoitems" class="ng-scope">
                <div class="logo-item" style="width:2.6rem; height:2.6rem; position:relative; top:2.5rem; margin:0.5rem 0.1rem">
                    <img ng-src="${pageContext.request.contextPath}/images/할리스커피로고.png" type="image/svg+xml" src="${pageContext.request.contextPath}/images/할리스커피로고.png">
                </div>
            </li><!-- end ngRepeat: item in logoitems --><li ng-repeat="item in logoitems" class="ng-scope">
                <div class="logo-item" style="width:2.6rem; height:2.6rem; position:relative; top:3rem; margin:0.5rem 1.6rem">
                    <img ng-src="${pageContext.request.contextPath}/images/11번가 로고.png" type="image/svg+xml" src="${pageContext.request.contextPath}/images/11번가 로고.png">
                </div>
            </li><!-- end ngRepeat: item in logoitems --><li ng-repeat="item in logoitems" class="ng-scope">
                <div class="logo-item" style="width:3.9000000000000004rem; height:3.9000000000000004rem; position:relative; top:2.5rem; margin:0.5rem 0.6rem">
                    <img ng-src="${pageContext.request.contextPath}/images/굽네치킨로고.png" type="image/svg+xml" src="${pageContext.request.contextPath}/images/굽네치킨로고.png">
                </div>
            </li><!-- end ngRepeat: item in logoitems --><li ng-repeat="item in logoitems" class="ng-scope">
                <div class="logo-item" style="width:2.6rem; height:2.6rem; position:relative; top:2rem; margin:0.5rem 1.1rem">
                    <img ng-src="${pageContext.request.contextPath}/images/농심로고.png" type="image/svg+xml" src="${pageContext.request.contextPath}/images/농심로고.png">
                </div>
            </li><!-- end ngRepeat: item in logoitems --><li ng-repeat="item in logoitems" class="ng-scope">
                <div class="logo-item" style="width:3.9000000000000004rem; height:3.9000000000000004rem; position:relative; top:2rem; margin:0.5rem 2.1rem">
                    <img ng-src="${pageContext.request.contextPath}/images/던킨로고.png" type="image/svg+xml" src="${pageContext.request.contextPath}/images/던킨로고.png">
                </div>
            </li><!-- end ngRepeat: item in logoitems --><li ng-repeat="item in logoitems" class="ng-scope">
                <div class="logo-item" style="width:3.9000000000000004rem; height:3.9000000000000004rem; position:relative; top:1rem; margin:0.5rem 1.1rem">
                    <img ng-src="${pageContext.request.contextPath}/images/마시닭로고png.png" type="image/svg+xml" src="${pageContext.request.contextPath}/images/마시닭로고png.png">
                </div>
            </li><!-- end ngRepeat: item in logoitems --><li ng-repeat="item in logoitems" class="ng-scope">
                <div class="logo-item" style="width:2.6rem; height:2.6rem; position:relative; top:2rem; margin:0.5rem 1.1rem">
                    <img ng-src="${pageContext.request.contextPath}/images/맘스터치.png" type="image/svg+xml" src="${pageContext.request.contextPath}/images/맘스터치.png">
                </div>
            </li><!-- end ngRepeat: item in logoitems --><li ng-repeat="item in logoitems" class="ng-scope">
                <div class="logo-item" style="width:2.6rem; height:2.6rem; position:relative; top:3rem; margin:0.5rem 0.1rem">
                    <img ng-src="${pageContext.request.contextPath}/images/멕시카나로고.png" type="image/svg+xml" src="${pageContext.request.contextPath}/images/멕시카나로고.png">
                </div>
            </li><!-- end ngRepeat: item in logoitems --><li ng-repeat="item in logoitems" class="ng-scope">
                <div class="logo-item" style="width:2.6rem; height:2.6rem; position:relative; top:1rem; margin:0.5rem 0.1rem">
                    <img ng-src="${pageContext.request.contextPath}/images/빠바로고.png" type="image/svg+xml" src="${pageContext.request.contextPath}/images/빠바로고.png">
                </div>
            </li><!-- end ngRepeat: item in logoitems --><li ng-repeat="item in logoitems" class="ng-scope">
                <div class="logo-item" style="width:3.9000000000000004rem; height:3.9000000000000004rem; position:relative; top:2.5rem; margin:0.5rem 0.1rem">
                    <img ng-src="${pageContext.request.contextPath}/images/세븐일레븐로고.png" type="image/svg+xml" src="${pageContext.request.contextPath}/images/세븐일레븐로고.png">
                </div>
            </li><!-- end ngRepeat: item in logoitems --><li ng-repeat="item in logoitems" class="ng-scope">
                <div class="logo-item" style="width:2.6rem; height:2.6rem; position:relative; top:2.5rem; margin:0.5rem 0.6rem">
                    <img ng-src="${pageContext.request.contextPath}/images/스타벅스.png" type="image/svg+xml" src="${pageContext.request.contextPath}/images/스타벅스.png">
                </div>
            </li><!-- end ngRepeat: item in logoitems --><li ng-repeat="item in logoitems" class="ng-scope">
                <div class="logo-item" style="width:2.6rem; height:2.6rem; position:relative; top:3rem; margin:0.5rem 1.6rem">
                    <img ng-src="${pageContext.request.contextPath}/images/옛통로고.png" type="image/svg+xml" src="${pageContext.request.contextPath}/images/옛통로고.png">
                </div>
            </li><!-- end ngRepeat: item in logoitems --><li ng-repeat="item in logoitems" class="ng-scope">
                <div class="logo-item" style="width:2.6rem; height:2.6rem; position:relative; top:3rem; margin:0.5rem 1.1rem">
                    <img ng-src="${pageContext.request.contextPath}/images/이마트로고.png" type="image/svg+xml" src="${pageContext.request.contextPath}/images/이마트로고.png">
                </div>
            </li><!-- end ngRepeat: item in logoitems --><li ng-repeat="item in logoitems" class="ng-scope">
                <div class="logo-item" style="width:2.6rem; height:2.6rem; position:relative; top:1.5rem; margin:0.5rem 2.1rem">
                    <img ng-src="${pageContext.request.contextPath}/images/커피집1.png" type="image/svg+xml" src="${pageContext.request.contextPath}/images/커피집1.png">
                </div>
            </li><!-- end ngRepeat: item in logoitems --><li ng-repeat="item in logoitems" class="ng-scope">
                <div class="logo-item" style="width:5.2rem; height:5.2rem; position:relative; top:2rem; margin:0.5rem 2.1rem">
                    <img ng-src="${pageContext.request.contextPath}/images/kakaopay.png" type="image/svg+xml" src="${pageContext.request.contextPath}/images/kakaopay.png">
                </div>
            </li><!-- end ngRepeat: item in logoitems --><li ng-repeat="item in logoitems" class="ng-scope">
                <div class="logo-item" style="width:2.6rem; height:2.6rem; position:relative; top:1.5rem; margin:0.5rem 0.1rem">
                    <img ng-src="${pageContext.request.contextPath}/images/11번가 로고.png" type="image/svg+xml" src="${pageContext.request.contextPath}/images/11번가 로고.png">
                </div>
            </li><!-- end ngRepeat: item in logoitems --><li ng-repeat="item in logoitems" class="ng-scope">
                <div class="logo-item" style="width:3.9000000000000004rem; height:3.9000000000000004rem; position:relative; top:1.5rem; margin:0.5rem 0.6rem">
                    <img ng-src="${pageContext.request.contextPath}/images/굽네치킨로고.png" type="image/svg+xml" src="${pageContext.request.contextPath}/images/굽네치킨로고.png">
                </div>
            </li><!-- end ngRepeat: item in logoitems --><li ng-repeat="item in logoitems" class="ng-scope">
                <div class="logo-item" style="width:2.6rem; height:2.6rem; position:relative; top:1rem; margin:0.5rem 2.1rem">
                    <img ng-src="${pageContext.request.contextPath}/images/농심로고.png" type="image/svg+xml" src="${pageContext.request.contextPath}/images/농심로고.png">
                </div>
            </li><!-- end ngRepeat: item in logoitems --><li ng-repeat="item in logoitems" class="ng-scope">
                <div class="logo-item" style="width:5.2rem; height:5.2rem; position:relative; top:1.5rem; margin:0.5rem 2.1rem">
                    <img ng-src="${pageContext.request.contextPath}/images/던킨로고.png" type="image/svg+xml" src="${pageContext.request.contextPath}/images/던킨로고.png">
                </div>
            </li><!-- end ngRepeat: item in logoitems --><li ng-repeat="item in logoitems" class="ng-scope">
                <div class="logo-item" style="width:2.6rem; height:2.6rem; position:relative; top:1rem; margin:0.5rem 0.6rem">
                    <img ng-src="${pageContext.request.contextPath}/images/마시닭로고png.png" type="image/svg+xml" src="${pageContext.request.contextPath}/images/마시닭로고png.png">
                </div>
            </li><!-- end ngRepeat: item in logoitems --><li ng-repeat="item in logoitems" class="ng-scope">
                <div class="logo-item" style="width:3.9000000000000004rem; height:3.9000000000000004rem; position:relative; top:3rem; margin:0.5rem 1.6rem">
                    <img ng-src="${pageContext.request.contextPath}/images/맘스터치.png" type="image/svg+xml" src="${pageContext.request.contextPath}/images/맘스터치.png">
                </div>
            </li><!-- end ngRepeat: item in logoitems --><li ng-repeat="item in logoitems" class="ng-scope">
                <div class="logo-item" style="width:3.9000000000000004rem; height:3.9000000000000004rem; position:relative; top:2rem; margin:0.5rem 0.1rem">
                    <img ng-src="${pageContext.request.contextPath}/images/멕시카나로고.png" type="image/svg+xml" src="${pageContext.request.contextPath}/images/멕시카나로고.png">
                </div>
            </li><!-- end ngRepeat: item in logoitems --><li ng-repeat="item in logoitems" class="ng-scope">
                <div class="logo-item" style="width:3.9000000000000004rem; height:3.9000000000000004rem; position:relative; top:3rem; margin:0.5rem 0.6rem">
                    <img ng-src="${pageContext.request.contextPath}/images/빠바로고.png" type="image/svg+xml" src="${pageContext.request.contextPath}/images/빠바로고.png">
                </div>
            </li><!-- end ngRepeat: item in logoitems --><li ng-repeat="item in logoitems" class="ng-scope">
                <div class="logo-item" style="width:3.9000000000000004rem; height:3.9000000000000004rem; position:relative; top:1rem; margin:0.5rem 0.1rem">
                    <img ng-src="${pageContext.request.contextPath}/images/세븐일레븐로고.png" type="image/svg+xml" src="${pageContext.request.contextPath}/images/세븐일레븐로고.png">
                </div>
            </li><!-- end ngRepeat: item in logoitems --><li ng-repeat="item in logoitems" class="ng-scope">
                <div class="logo-item" style="width:3.9000000000000004rem; height:3.9000000000000004rem; position:relative; top:3rem; margin:0.5rem 2.1rem">
                    <img ng-src="${pageContext.request.contextPath}/images/스타벅스.png" type="image/svg+xml" src="${pageContext.request.contextPath}/images/스타벅스.png">
                </div>
            </li><!-- end ngRepeat: item in logoitems --><li ng-repeat="item in logoitems" class="ng-scope">
                <div class="logo-item" style="width:3.9000000000000004rem; height:3.9000000000000004rem; position:relative; top:2rem; margin:0.5rem 2.1rem">
                    <img ng-src="${pageContext.request.contextPath}/images/옛통로고.png" type="image/svg+xml" src="${pageContext.request.contextPath}/images/옛통로고.png">
                </div>
            </li><!-- end ngRepeat: item in logoitems --><li ng-repeat="item in logoitems" class="ng-scope">
                <div class="logo-item" style="width:2.6rem; height:2.6rem; position:relative; top:3rem; margin:0.5rem 1.1rem">
                    <img ng-src="${pageContext.request.contextPath}/images/이마트로고.png" type="image/svg+xml" src="${pageContext.request.contextPath}/images/이마트로고.png">
                </div>
            </li><!-- end ngRepeat: item in logoitems --><li ng-repeat="item in logoitems" class="ng-scope">
                <div class="logo-item" style="width:3.9000000000000004rem; height:3.9000000000000004rem; position:relative; top:1.5rem; margin:0.5rem 1.6rem">
                    <img ng-src="${pageContext.request.contextPath}/images/커피집1.png" type="image/svg+xml" src="${pageContext.request.contextPath}/images/커피집1.png">
                </div>
            </li><!-- end ngRepeat: item in logoitems -->
        </ul>
        <ul class="logoitemgroup secondtrain">
            <!-- ngRepeat: item in logoitems --><li ng-repeat="item in logoitems" class="ng-scope">
                <div class="logo-item" style="width:3.9000000000000004rem; height:3.9000000000000004rem; position:relative; top:3rem; margin:0.5rem 1.1rem">
                    <img ng-src="${pageContext.request.contextPath}/images/스타벅스.png" type="image/svg+xml" src="${pageContext.request.contextPath}/images/스타벅스.png">
                </div>
            </li><!-- end ngRepeat: item in logoitems --><li ng-repeat="item in logoitems" class="ng-scope">
                <div class="logo-item" style="width:5.2rem; height:5.2rem; position:relative; top:2rem; margin:0.5rem 0.6rem">
                    <img ng-src="${pageContext.request.contextPath}/images/11번가 로고.png" type="image/svg+xml" src="${pageContext.request.contextPath}/images/11번가 로고.png">
                </div>
            </li><!-- end ngRepeat: item in logoitems --><li ng-repeat="item in logoitems" class="ng-scope">
                <div class="logo-item" style="width:2.6rem; height:2.6rem; position:relative; top:2rem; margin:0.5rem 0.1rem">
                    <img ng-src="${pageContext.request.contextPath}/images/굽네치킨로고.png" type="image/svg+xml" src="${pageContext.request.contextPath}/images/굽네치킨로고.png">
                </div>
            </li><!-- end ngRepeat: item in logoitems --><li ng-repeat="item in logoitems" class="ng-scope">
                <div class="logo-item" style="width:3.9000000000000004rem; height:3.9000000000000004rem; position:relative; top:2.5rem; margin:0.5rem 2.1rem">
                    <img ng-src="${pageContext.request.contextPath}/images/농심로고.png" type="image/svg+xml" src="${pageContext.request.contextPath}/images/농심로고.png">
                </div>
            </li><!-- end ngRepeat: item in logoitems --><li ng-repeat="item in logoitems" class="ng-scope">
                <div class="logo-item" style="width:2.6rem; height:2.6rem; position:relative; top:1rem; margin:0.5rem 2.1rem">
                    <img ng-src="${pageContext.request.contextPath}/images/던킨로고.png" type="image/svg+xml" src="${pageContext.request.contextPath}/images/던킨로고.png">
                </div>
            </li><!-- end ngRepeat: item in logoitems --><li ng-repeat="item in logoitems" class="ng-scope">
                <div class="logo-item" style="width:5.2rem; height:5.2rem; position:relative; top:1.5rem; margin:0.5rem 2.1rem">
                    <img ng-src="${pageContext.request.contextPath}/images/마시닭로고png.png" type="image/svg+xml" src="${pageContext.request.contextPath}/images/마시닭로고png.png">
                </div>
            </li><!-- end ngRepeat: item in logoitems --><li ng-repeat="item in logoitems" class="ng-scope">
                <div class="logo-item" style="width:2.6rem; height:2.6rem; position:relative; top:1rem; margin:0.5rem 1.6rem">
                    <img ng-src="${pageContext.request.contextPath}/images/맘스터치.png" type="image/svg+xml" src="${pageContext.request.contextPath}/images/맘스터치.png">
                </div>
            </li><!-- end ngRepeat: item in logoitems --><li ng-repeat="item in logoitems" class="ng-scope">
                <div class="logo-item" style="width:2.6rem; height:2.6rem; position:relative; top:2rem; margin:0.5rem 0.1rem">
                    <img ng-src="${pageContext.request.contextPath}/images/멕시카나로고.png" type="image/svg+xml" src="${pageContext.request.contextPath}/images/멕시카나로고.png">
                </div>
            </li><!-- end ngRepeat: item in logoitems --><li ng-repeat="item in logoitems" class="ng-scope">
                <div class="logo-item" style="width:2.6rem; height:2.6rem; position:relative; top:2rem; margin:0.5rem 2.1rem">
                    <img ng-src="${pageContext.request.contextPath}/images/빠바로고.png" type="image/svg+xml" src="${pageContext.request.contextPath}/images/빠바로고.png">
                </div>
            </li><!-- end ngRepeat: item in logoitems --><li ng-repeat="item in logoitems" class="ng-scope">
                <div class="logo-item" style="width:3.9000000000000004rem; height:3.9000000000000004rem; position:relative; top:1.5rem; margin:0.5rem 1.1rem">
                    <img ng-src="${pageContext.request.contextPath}/images/세븐일레븐로고.png" type="image/svg+xml" src="${pageContext.request.contextPath}/images/세븐일레븐로고.png">
                </div>
            </li><!-- end ngRepeat: item in logoitems --><li ng-repeat="item in logoitems" class="ng-scope">
                <div class="logo-item" style="width:5.2rem; height:5.2rem; position:relative; top:2rem; margin:0.5rem 2.1rem">
                    <img ng-src="${pageContext.request.contextPath}/images/스타벅스.png" type="image/svg+xml" src="${pageContext.request.contextPath}/images/스타벅스.png">
                </div>
            </li><!-- end ngRepeat: item in logoitems --><li ng-repeat="item in logoitems" class="ng-scope">
                <div class="logo-item" style="width:5.2rem; height:5.2rem; position:relative; top:1.5rem; margin:0.5rem 0.1rem">
                    <img ng-src="${pageContext.request.contextPath}/images/옛통로고.png" type="image/svg+xml" src="${pageContext.request.contextPath}/images/옛통로고.png">
                </div>
            </li><!-- end ngRepeat: item in logoitems --><li ng-repeat="item in logoitems" class="ng-scope">
                <div class="logo-item" style="width:2.6rem; height:2.6rem; position:relative; top:3rem; margin:0.5rem 0.6rem">
                    <img ng-src="${pageContext.request.contextPath}/images/이마트로고.png" type="image/svg+xml" src="${pageContext.request.contextPath}/images/이마트로고.png">
                </div>
            </li><!-- end ngRepeat: item in logoitems --><li ng-repeat="item in logoitems" class="ng-scope">
                <div class="logo-item" style="width:2.6rem; height:2.6rem; position:relative; top:2rem; margin:0.5rem 1.6rem">
                    <img ng-src="${pageContext.request.contextPath}/images/커피집1.png" type="image/svg+xml" src="${pageContext.request.contextPath}/images/커피집1.png">
                </div>
            </li><!-- end ngRepeat: item in logoitems --><li ng-repeat="item in logoitems" class="ng-scope">
                <div class="logo-item" style="width:3.9000000000000004rem; height:3.9000000000000004rem; position:relative; top:2rem; margin:0.5rem 0.1rem">
                    <img ng-src="${pageContext.request.contextPath}/images/CGV로고.png" type="image/svg+xml" src="${pageContext.request.contextPath}/images/CGV로고.png">
                </div>
            </li><!-- end ngRepeat: item in logoitems --><li ng-repeat="item in logoitems" class="ng-scope">
                <div class="logo-item" style="width:5.2rem; height:5.2rem; position:relative; top:1.5rem; margin:0.5rem 0.1rem">
                    <img ng-src="${pageContext.request.contextPath}/images/11번가 로고.png" type="image/svg+xml" src="${pageContext.request.contextPath}/images/11번가 로고.png">
                </div>
            </li><!-- end ngRepeat: item in logoitems --><li ng-repeat="item in logoitems" class="ng-scope">
                <div class="logo-item" style="width:2.6rem; height:2.6rem; position:relative; top:1.5rem; margin:0.5rem 2.1rem">
                    <img ng-src="${pageContext.request.contextPath}/images/굽네치킨로고.png" type="image/svg+xml" src="${pageContext.request.contextPath}/images/굽네치킨로고.png">
                </div>
            </li><!-- end ngRepeat: item in logoitems --><li ng-repeat="item in logoitems" class="ng-scope">
                <div class="logo-item" style="width:5.2rem; height:5.2rem; position:relative; top:2rem; margin:0.5rem 1.1rem">
                    <img ng-src="${pageContext.request.contextPath}/images/농심로고.png" type="image/svg+xml" src="${pageContext.request.contextPath}/images/농심로고.png">
                </div>
            </li><!-- end ngRepeat: item in logoitems --><li ng-repeat="item in logoitems" class="ng-scope">
                <div class="logo-item" style="width:5.2rem; height:5.2rem; position:relative; top:3rem; margin:0.5rem 0.6rem">
                    <img ng-src="${pageContext.request.contextPath}/images/던킨로고.png" type="image/svg+xml" src="${pageContext.request.contextPath}/images/던킨로고.png">
                </div>
            </li><!-- end ngRepeat: item in logoitems --><li ng-repeat="item in logoitems" class="ng-scope">
                <div class="logo-item" style="width:5.2rem; height:5.2rem; position:relative; top:1rem; margin:0.5rem 1.1rem">
                    <img ng-src="${pageContext.request.contextPath}/images/마시닭로고png.png" type="image/svg+xml" src="${pageContext.request.contextPath}/images/마시닭로고png.png">
                </div>
            </li><!-- end ngRepeat: item in logoitems --><li ng-repeat="item in logoitems" class="ng-scope">
                <div class="logo-item" style="width:2.6rem; height:2.6rem; position:relative; top:1.5rem; margin:0.5rem 0.1rem">
                    <img ng-src="${pageContext.request.contextPath}/images/맘스터치.png" type="image/svg+xml" src="${pageContext.request.contextPath}/images/맘스터치.png">
                </div>
            </li><!-- end ngRepeat: item in logoitems --><li ng-repeat="item in logoitems" class="ng-scope">
                <div class="logo-item" style="width:3.9000000000000004rem; height:3.9000000000000004rem; position:relative; top:2rem; margin:0.5rem 2.1rem">
                    <img ng-src="${pageContext.request.contextPath}/images/멕시카나로고.png" type="image/svg+xml" src="${pageContext.request.contextPath}/images/멕시카나로고.png">
                </div>
            </li><!-- end ngRepeat: item in logoitems --><li ng-repeat="item in logoitems" class="ng-scope">
                <div class="logo-item" style="width:3.9000000000000004rem; height:3.9000000000000004rem; position:relative; top:3rem; margin:0.5rem 1.1rem">
                    <img ng-src="${pageContext.request.contextPath}/images/빠바로고.png" type="image/svg+xml" src="${pageContext.request.contextPath}/images/빠바로고.png">
                </div>
            </li><!-- end ngRepeat: item in logoitems --><li ng-repeat="item in logoitems" class="ng-scope">
                <div class="logo-item" style="width:3.9000000000000004rem; height:3.9000000000000004rem; position:relative; top:2rem; margin:0.5rem 1.6rem">
                    <img ng-src="${pageContext.request.contextPath}/images/세븐일레븐로고.png" type="image/svg+xml" src="${pageContext.request.contextPath}/images/세븐일레븐로고.png">
                </div>
            </li><!-- end ngRepeat: item in logoitems --><li ng-repeat="item in logoitems" class="ng-scope">
                <div class="logo-item" style="width:2.6rem; height:2.6rem; position:relative; top:2rem; margin:0.5rem 2.1rem">
                    <img ng-src="${pageContext.request.contextPath}/images/스타벅스.png" type="image/svg+xml" src="${pageContext.request.contextPath}/images/스타벅스.png">
                </div>
            </li><!-- end ngRepeat: item in logoitems --><li ng-repeat="item in logoitems" class="ng-scope">
                <div class="logo-item" style="width:5.2rem; height:5.2rem; position:relative; top:1.5rem; margin:0.5rem 1.1rem">
                    <img ng-src="${pageContext.request.contextPath}/images/옛통로고.png" type="image/svg+xml" src="${pageContext.request.contextPath}/images/옛통로고.png">
                </div>
            </li><!-- end ngRepeat: item in logoitems --><li ng-repeat="item in logoitems" class="ng-scope">
                <div class="logo-item" style="width:3.9000000000000004rem; height:3.9000000000000004rem; position:relative; top:1.5rem; margin:0.5rem 0.1rem">
                    <img ng-src="${pageContext.request.contextPath}/images/이마트로고.png" type="image/svg+xml" src="${pageContext.request.contextPath}/images/이마트로고.png">
                </div>
            </li><!-- end ngRepeat: item in logoitems --><li ng-repeat="item in logoitems" class="ng-scope">
                <div class="logo-item" style="width:3.9000000000000004rem; height:3.9000000000000004rem; position:relative; top:2rem; margin:0.5rem 2.1rem">
                    <img ng-src="${pageContext.request.contextPath}/images/커피집1.png" type="image/svg+xml" src="${pageContext.request.contextPath}/images/커피집1.png">
                </div>
            </li><!-- end ngRepeat: item in logoitems --><li ng-repeat="item in logoitems" class="ng-scope">
                <div class="logo-item" style="width:3.9000000000000004rem; height:3.9000000000000004rem; position:relative; top:3rem; margin:0.5rem 2.1rem">
                    <img ng-src="${pageContext.request.contextPath}/images/할리스커피로고.png" type="image/svg+xml" src="${pageContext.request.contextPath}/images/CGV로고.png">
                </div>
            </li><!-- end ngRepeat: item in logoitems --><li ng-repeat="item in logoitems" class="ng-scope">
                <div class="logo-item" style="width:3.9000000000000004rem; height:3.9000000000000004rem; position:relative; top:1rem; margin:0.5rem 1.1rem">
                    <img ng-src="${pageContext.request.contextPath}/images/11번가 로고.png" type="image/svg+xml" src="${pageContext.request.contextPath}/images/11번가 로고.png">
                </div>
            </li><!-- end ngRepeat: item in logoitems --><li ng-repeat="item in logoitems" class="ng-scope">
                <div class="logo-item" style="width:2.6rem; height:2.6rem; position:relative; top:1rem; margin:0.5rem 0.1rem">
                    <img ng-src="${pageContext.request.contextPath}/images/굽네치킨로고.png" type="image/svg+xml" src="${pageContext.request.contextPath}/images/굽네치킨로고.png">
                </div>
            </li><!-- end ngRepeat: item in logoitems --><li ng-repeat="item in logoitems" class="ng-scope">
                <div class="logo-item" style="width:2.6rem; height:2.6rem; position:relative; top:2.5rem; margin:0.5rem 1.6rem">
                    <img ng-src="${pageContext.request.contextPath}/images/농심로고.png" type="image/svg+xml" src="${pageContext.request.contextPath}/images/농심로고.png">
                </div>
            </li><!-- end ngRepeat: item in logoitems --><li ng-repeat="item in logoitems" class="ng-scope">
                <div class="logo-item" style="width:2.6rem; height:2.6rem; position:relative; top:1rem; margin:0.5rem 0.6rem">
                    <img ng-src="${pageContext.request.contextPath}/images/던킨로고.png" type="image/svg+xml" src="${pageContext.request.contextPath}/images/던킨로고.png">
                </div>
            </li><!-- end ngRepeat: item in logoitems --><li ng-repeat="item in logoitems" class="ng-scope">
                <div class="logo-item" style="width:5.2rem; height:5.2rem; position:relative; top:1.5rem; margin:0.5rem 0.1rem">
                    <img ng-src="${pageContext.request.contextPath}/images/마시닭로고png.png" type="image/svg+xml" src="${pageContext.request.contextPath}/images/마시닭로고png.png">
                </div>
            </li><!-- end ngRepeat: item in logoitems --><li ng-repeat="item in logoitems" class="ng-scope">
                <div class="logo-item" style="width:2.6rem; height:2.6rem; position:relative; top:1rem; margin:0.5rem 1.1rem">
                    <img ng-src="${pageContext.request.contextPath}/images/맘스터치.png" type="image/svg+xml" src="${pageContext.request.contextPath}/images/맘스터치.png">
                </div>
            </li><!-- end ngRepeat: item in logoitems --><li ng-repeat="item in logoitems" class="ng-scope">
                <div class="logo-item" style="width:2.6rem; height:2.6rem; position:relative; top:1.5rem; margin:0.5rem 1.6rem">
                    <img ng-src="${pageContext.request.contextPath}/images/멕시카나로고.png" type="image/svg+xml" src="${pageContext.request.contextPath}/images/멕시카나로고.png">
                </div>
            </li><!-- end ngRepeat: item in logoitems --><li ng-repeat="item in logoitems" class="ng-scope">
                <div class="logo-item" style="width:2.6rem; height:2.6rem; position:relative; top:1.5rem; margin:0.5rem 0.1rem">
                    <img ng-src="${pageContext.request.contextPath}/images/빠바로고.png" type="image/svg+xml" src="${pageContext.request.contextPath}/images/빠바로고.png">
                </div>
            </li><!-- end ngRepeat: item in logoitems --><li ng-repeat="item in logoitems" class="ng-scope">
                <div class="logo-item" style="width:5.2rem; height:5.2rem; position:relative; top:1rem; margin:0.5rem 0.1rem">
                    <img ng-src="${pageContext.request.contextPath}/images/세븐일레븐로고.png" type="image/svg+xml" src="${pageContext.request.contextPath}/images/세븐일레븐로고.png">
                </div>
            </li><!-- end ngRepeat: item in logoitems --><li ng-repeat="item in logoitems" class="ng-scope">
                <div class="logo-item" style="width:3.9000000000000004rem; height:3.9000000000000004rem; position:relative; top:2rem; margin:0.5rem 0.6rem">
                    <img ng-src="${pageContext.request.contextPath}/images/스타벅스.png" type="image/svg+xml" src="${pageContext.request.contextPath}/images/스타벅스.png">
                </div>
            </li><!-- end ngRepeat: item in logoitems --><li ng-repeat="item in logoitems" class="ng-scope">
                <div class="logo-item" style="width:2.6rem; height:2.6rem; position:relative; top:2.5rem; margin:0.5rem 1.1rem">
                    <img ng-src="${pageContext.request.contextPath}/images/옛통로고.png" type="image/svg+xml" src="${pageContext.request.contextPath}/images/옛통로고.png">
                </div>
            </li><!-- end ngRepeat: item in logoitems --><li ng-repeat="item in logoitems" class="ng-scope">
                <div class="logo-item" style="width:2.6rem; height:2.6rem; position:relative; top:3rem; margin:0.5rem 0.6rem">
                    <img ng-src="${pageContext.request.contextPath}/images/이마트로고.png" type="image/svg+xml" src="${pageContext.request.contextPath}/images/이마트로고.png">
                </div>
            </li><!-- end ngRepeat: item in logoitems --><li ng-repeat="item in logoitems" class="ng-scope">
                <div class="logo-item" style="width:3.9000000000000004rem; height:3.9000000000000004rem; position:relative; top:3rem; margin:0.5rem 2.1rem">
                    <img ng-src="${pageContext.request.contextPath}/images/커피집1.png" type="image/svg+xml" src="${pageContext.request.contextPath}/images/커피집1.png">
                </div>
            </li><!-- end ngRepeat: item in logoitems --><li ng-repeat="item in logoitems" class="ng-scope">
                <div class="logo-item" style="width:2.6rem; height:2.6rem; position:relative; top:2.5rem; margin:0.5rem 0.1rem">
                    <img ng-src="${pageContext.request.contextPath}/images/SK로고.png" type="image/svg+xml" src="${pageContext.request.contextPath}/images/CGV로고.png">
                </div>
            </li><!-- end ngRepeat: item in logoitems --><li ng-repeat="item in logoitems" class="ng-scope">
                <div class="logo-item" style="width:2.6rem; height:2.6rem; position:relative; top:3rem; margin:0.5rem 1.6rem">
                    <img ng-src="${pageContext.request.contextPath}/images/11번가 로고.png" type="image/svg+xml" src="${pageContext.request.contextPath}/images/11번가 로고.png">
                </div>
            </li><!-- end ngRepeat: item in logoitems --><li ng-repeat="item in logoitems" class="ng-scope">
                <div class="logo-item" style="width:3.9000000000000004rem; height:3.9000000000000004rem; position:relative; top:2.5rem; margin:0.5rem 0.6rem">
                    <img ng-src="${pageContext.request.contextPath}/images/굽네치킨로고.png" type="image/svg+xml" src="${pageContext.request.contextPath}/images/굽네치킨로고.png">
                </div>
            </li><!-- end ngRepeat: item in logoitems --><li ng-repeat="item in logoitems" class="ng-scope">
                <div class="logo-item" style="width:2.6rem; height:2.6rem; position:relative; top:2rem; margin:0.5rem 1.1rem">
                    <img ng-src="${pageContext.request.contextPath}/images/농심로고.png" type="image/svg+xml" src="${pageContext.request.contextPath}/images/농심로고.png">
                </div>
            </li><!-- end ngRepeat: item in logoitems --><li ng-repeat="item in logoitems" class="ng-scope">
                <div class="logo-item" style="width:3.9000000000000004rem; height:3.9000000000000004rem; position:relative; top:2rem; margin:0.5rem 2.1rem">
                    <img ng-src="${pageContext.request.contextPath}/images/던킨로고.png" type="image/svg+xml" src="${pageContext.request.contextPath}/images/던킨로고.png">
                </div>
            </li><!-- end ngRepeat: item in logoitems --><li ng-repeat="item in logoitems" class="ng-scope">
                <div class="logo-item" style="width:3.9000000000000004rem; height:3.9000000000000004rem; position:relative; top:1rem; margin:0.5rem 1.1rem">
                    <img ng-src="${pageContext.request.contextPath}/images/마시닭로고png.png" type="image/svg+xml" src="${pageContext.request.contextPath}/images/마시닭로고png.png">
                </div>
            </li><!-- end ngRepeat: item in logoitems --><li ng-repeat="item in logoitems" class="ng-scope">
                <div class="logo-item" style="width:2.6rem; height:2.6rem; position:relative; top:2rem; margin:0.5rem 1.1rem">
                    <img ng-src="${pageContext.request.contextPath}/images/맘스터치.png" type="image/svg+xml" src="${pageContext.request.contextPath}/images/맘스터치.png">
                </div>
            </li><!-- end ngRepeat: item in logoitems --><li ng-repeat="item in logoitems" class="ng-scope">
                <div class="logo-item" style="width:2.6rem; height:2.6rem; position:relative; top:3rem; margin:0.5rem 0.1rem">
                    <img ng-src="${pageContext.request.contextPath}/images/멕시카나로고.png" type="image/svg+xml" src="${pageContext.request.contextPath}/images/멕시카나로고.png">
                </div>
            </li><!-- end ngRepeat: item in logoitems --><li ng-repeat="item in logoitems" class="ng-scope">
                <div class="logo-item" style="width:2.6rem; height:2.6rem; position:relative; top:1rem; margin:0.5rem 0.1rem">
                    <img ng-src="${pageContext.request.contextPath}/images/빠바로고.png" type="image/svg+xml" src="${pageContext.request.contextPath}/images/빠바로고.png">
                </div>
            </li><!-- end ngRepeat: item in logoitems --><li ng-repeat="item in logoitems" class="ng-scope">
                <div class="logo-item" style="width:3.9000000000000004rem; height:3.9000000000000004rem; position:relative; top:2.5rem; margin:0.5rem 0.1rem">
                    <img ng-src="${pageContext.request.contextPath}/images/세븐일레븐로고.png" type="image/svg+xml" src="${pageContext.request.contextPath}/images/세븐일레븐로고.png">
                </div>
            </li><!-- end ngRepeat: item in logoitems --><li ng-repeat="item in logoitems" class="ng-scope">
                <div class="logo-item" style="width:2.6rem; height:2.6rem; position:relative; top:2.5rem; margin:0.5rem 0.6rem">
                    <img ng-src="${pageContext.request.contextPath}/images/스타벅스.png" type="image/svg+xml" src="${pageContext.request.contextPath}/images/스타벅스.png">
                </div>
            </li><!-- end ngRepeat: item in logoitems --><li ng-repeat="item in logoitems" class="ng-scope">
                <div class="logo-item" style="width:2.6rem; height:2.6rem; position:relative; top:3rem; margin:0.5rem 1.6rem">
                    <img ng-src="${pageContext.request.contextPath}/images/옛통로고.png" type="image/svg+xml" src="${pageContext.request.contextPath}/images/옛통로고.png">
                </div>
            </li><!-- end ngRepeat: item in logoitems --><li ng-repeat="item in logoitems" class="ng-scope">
                <div class="logo-item" style="width:2.6rem; height:2.6rem; position:relative; top:3rem; margin:0.5rem 1.1rem">
                    <img ng-src="${pageContext.request.contextPath}/images/이마트로고.png" type="image/svg+xml" src="${pageContext.request.contextPath}/images/이마트로고.png">
                </div>
            </li><!-- end ngRepeat: item in logoitems --><li ng-repeat="item in logoitems" class="ng-scope">
                <div class="logo-item" style="width:2.6rem; height:2.6rem; position:relative; top:1.5rem; margin:0.5rem 2.1rem">
                    <img ng-src="${pageContext.request.contextPath}/images/커피집1.png" type="image/svg+xml" src="${pageContext.request.contextPath}/images/커피집1.png">
                </div>
            </li><!-- end ngRepeat: item in logoitems --><li ng-repeat="item in logoitems" class="ng-scope">
                <div class="logo-item" style="width:5.2rem; height:5.2rem; position:relative; top:2rem; margin:0.5rem 2.1rem">
                    <img ng-src="${pageContext.request.contextPath}/images/CGV로고.png" type="image/svg+xml" src="${pageContext.request.contextPath}/images/CGV로고.png">
                </div>
            </li><!-- end ngRepeat: item in logoitems --><li ng-repeat="item in logoitems" class="ng-scope">
                <div class="logo-item" style="width:2.6rem; height:2.6rem; position:relative; top:1.5rem; margin:0.5rem 0.1rem">
                    <img ng-src="${pageContext.request.contextPath}/images/11번가 로고.png" type="image/svg+xml" src="${pageContext.request.contextPath}/images/11번가 로고.png">
                </div>
            </li><!-- end ngRepeat: item in logoitems --><li ng-repeat="item in logoitems" class="ng-scope">
                <div class="logo-item" style="width:3.9000000000000004rem; height:3.9000000000000004rem; position:relative; top:1.5rem; margin:0.5rem 0.6rem">
                    <img ng-src="${pageContext.request.contextPath}/images/굽네치킨로고.png" type="image/svg+xml" src="${pageContext.request.contextPath}/images/굽네치킨로고.png">
                </div>
            </li><!-- end ngRepeat: item in logoitems --><li ng-repeat="item in logoitems" class="ng-scope">
                <div class="logo-item" style="width:2.6rem; height:2.6rem; position:relative; top:1rem; margin:0.5rem 2.1rem">
                    <img ng-src="${pageContext.request.contextPath}/images/농심로고.png" type="image/svg+xml" src="${pageContext.request.contextPath}/images/농심로고.png">
                </div>
            </li><!-- end ngRepeat: item in logoitems --><li ng-repeat="item in logoitems" class="ng-scope">
                <div class="logo-item" style="width:5.2rem; height:5.2rem; position:relative; top:1.5rem; margin:0.5rem 2.1rem">
                    <img ng-src="${pageContext.request.contextPath}/images/던킨로고.png" type="image/svg+xml" src="${pageContext.request.contextPath}/images/던킨로고.png">
                </div>
            </li><!-- end ngRepeat: item in logoitems --><li ng-repeat="item in logoitems" class="ng-scope">
                <div class="logo-item" style="width:2.6rem; height:2.6rem; position:relative; top:1rem; margin:0.5rem 0.6rem">
                    <img ng-src="${pageContext.request.contextPath}/images/마시닭로고png.png" type="image/svg+xml" src="${pageContext.request.contextPath}/images/마시닭로고png.png">
                </div>
            </li><!-- end ngRepeat: item in logoitems --><li ng-repeat="item in logoitems" class="ng-scope">
                <div class="logo-item" style="width:3.9000000000000004rem; height:3.9000000000000004rem; position:relative; top:3rem; margin:0.5rem 1.6rem">
                    <img ng-src="${pageContext.request.contextPath}/images/맘스터치.png" type="image/svg+xml" src="${pageContext.request.contextPath}/images/맘스터치.png">
                </div>
            </li><!-- end ngRepeat: item in logoitems --><li ng-repeat="item in logoitems" class="ng-scope">
                <div class="logo-item" style="width:3.9000000000000004rem; height:3.9000000000000004rem; position:relative; top:2rem; margin:0.5rem 0.1rem">
                    <img ng-src="${pageContext.request.contextPath}/images/멕시카나로고.png" type="image/svg+xml" src="${pageContext.request.contextPath}/images/멕시카나로고.png">
                </div>
            </li><!-- end ngRepeat: item in logoitems --><li ng-repeat="item in logoitems" class="ng-scope">
                <div class="logo-item" style="width:3.9000000000000004rem; height:3.9000000000000004rem; position:relative; top:3rem; margin:0.5rem 0.6rem">
                    <img ng-src="${pageContext.request.contextPath}/images/빠바로고.png" type="image/svg+xml" src="${pageContext.request.contextPath}/images/빠바로고.png">
                </div>
            </li><!-- end ngRepeat: item in logoitems --><li ng-repeat="item in logoitems" class="ng-scope">
                <div class="logo-item" style="width:3.9000000000000004rem; height:3.9000000000000004rem; position:relative; top:1rem; margin:0.5rem 0.1rem">
                    <img ng-src="${pageContext.request.contextPath}/images/세븐일레븐로고.png" type="image/svg+xml" src="${pageContext.request.contextPath}/images/세븐일레븐로고.png">
                </div>
            </li><!-- end ngRepeat: item in logoitems --><li ng-repeat="item in logoitems" class="ng-scope">
                <div class="logo-item" style="width:3.9000000000000004rem; height:3.9000000000000004rem; position:relative; top:3rem; margin:0.5rem 2.1rem">
                    <img ng-src="${pageContext.request.contextPath}/images/스타벅스.png" type="image/svg+xml" src="${pageContext.request.contextPath}/images/스타벅스.png">
                </div>
            </li><!-- end ngRepeat: item in logoitems --><li ng-repeat="item in logoitems" class="ng-scope">
                <div class="logo-item" style="width:3.9000000000000004rem; height:3.9000000000000004rem; position:relative; top:2rem; margin:0.5rem 2.1rem">
                    <img ng-src="${pageContext.request.contextPath}/images/옛통로고.png" type="image/svg+xml" src="${pageContext.request.contextPath}/images/옛통로고.png">
                </div>
            </li><!-- end ngRepeat: item in logoitems --><li ng-repeat="item in logoitems" class="ng-scope">
                <div class="logo-item" style="width:2.6rem; height:2.6rem; position:relative; top:3rem; margin:0.5rem 1.1rem">
                    <img ng-src="${pageContext.request.contextPath}/images/이마트로고.png" type="image/svg+xml" src="${pageContext.request.contextPath}/images/이마트로고.png">
                </div>
            </li><!-- end ngRepeat: item in logoitems --><li ng-repeat="item in logoitems" class="ng-scope">
                <div class="logo-item" style="width:3.9000000000000004rem; height:3.9000000000000004rem; position:relative; top:1.5rem; margin:0.5rem 1.6rem">
                    <img ng-src="${pageContext.request.contextPath}/images/커피집1.png" type="image/svg+xml" src="${pageContext.request.contextPath}/images/커피집1.png">
                </div>
            </li><!-- end ngRepeat: item in logoitems -->
        </ul>
    </div>
<!-- 	움직이는이미지끝 -->
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
	<!-- container 끝 -->
	
	
	<!-- start modal 로그인	 -->
	<div id="id01" class="modal">
		<div class="modal_wrapper">
			<form class="modal-content animate" action="<%=request.getContextPath()%>/SessionLoginServlet.do" method="post">
			 	
			 	<div class="modal_conts">
					<div class="imgcontainer">
						<span onclick="document.getElementById('id01').style.display='none'"
							class="close" title="Close Modal">&times;</span> 
						<img src="${pageContext.request.contextPath}/images/logo_yellow_back.png" alt="Avatar" class="avatar">
					</div>
		
					<div class="container_modal">
						<label for="uname">
							<p>아이디</p>
						</label> 
						<input id="modalid" type="text" placeholder="아이디 입력" name="uname" required> 
						<label  for="psw">
							<p>비밀번호</p>
						</label> 
						<input id="modalpass" type="password" placeholder="비밀번호 입력" name="psw" required>
						<button id="modalbutton" type="submit">로그인</button>
						
					</div>
		
					<div class="container">
						<a href="${pageContext.request.contextPath}/board/findId.jsp" id="search_id">
							<span>아이디찾기</span>
						</a>
						<a data-toggle="modal" href="#id02" data-dismiss="modal" id="search_pass">
							<span>비밀번호찾기</span>
						</a>
					</div>
				</div>
				<!-- modal_conts 끝 -->
			</form>
		</div>
	</div>
	<!-- end modal 로그인 -->
	
	<!-- start modal 로그인	 -->
	<div id="id02" class="modal">
		<div class="modal_wrapper">
			<form class="modal-content animate" method="post">
			 	
			 	<div class="modal_conts">
					<div class="imgcontainer">
						<span onclick="document.getElementById('id01').style.display='none'"
							class="close" title="Close Modal" data-dismiss="modal">&times;</span> 
						<img src="${pageContext.request.contextPath}/images/logo_yellow_back.png" alt="Avatar" class="avatar">
					</div>
		
					<div class="container_modal">
						<button id="modalbutton" type="button" onclick = "location.href='${pageContext.request.contextPath}/board/findPass.jsp'" >id/메일로 찾기</button>
						<button id="modalbutton" type="button" onclick = "location.href='${pageContext.request.contextPath}/board/findPass2.jsp'" >id/힌트로 찾기</button>
					</div>
		
					
				</div>
				<!-- modal_conts 끝 -->
			</form>
		</div>
	</div>
	<!-- end modal 로그인 -->
	
</body>
</html>