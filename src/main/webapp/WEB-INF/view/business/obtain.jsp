<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>

<jsp:include page="/WEB-INF/view/common/common_include.jsp"></jsp:include>

<!-- 부트스트랩 CSS 이거 하면 터짐..
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
-->

<script type="text/javascript">
//배송지시서작성 버튼을 누르면 팝업창 나옴
$(document).ready(function(){
    $("#openDeliverybtn").click(function(){
        $("#deliveryDirectionPop").modal('show');
    });
    
    $("#openOrderbtn").click(function(){
        $("#orderDirectionPop").modal('show');
    });
});

</script>
</head>
<body>
	<input type="hidden" id="currentPage" value="">  <!-- 현재페이지는 처음에 항상 1로 설정하여 넘김  -->
	<input type="hidden" name="action" id="action" value=""> 
	<div id="wrap_area">
		<h2 class="hidden">header 영역</h2> 
		<jsp:include page="/WEB-INF/view/common/header.jsp"></jsp:include>

		<h2 class="hidden">컨텐츠 영역</h2>
		<div id="container">
			<ul>
				<li class="lnb">
					<!-- lnb 영역 --> 
					<jsp:include page="/WEB-INF/view/common/lnbMenu.jsp"></jsp:include> <!--// lnb 영역 -->
				</li>
				<li class="contents">
					<!-- contents -->
					<h3 class="hidden">contents 영역</h3> <!-- content -->
					<div class="content">
						<p class="Location">
							<a href="#" class="btn_set home">메인으로</a> 
							<a href="#" class="btn_nav bold">시스템 관리</a> 
							<span class="btn_nav bold">공지 사항</span> 
							<a href="#" class="btn_set refresh">새로고침</a>
						</p>
						
					<p class="conTitle">
						<span>수주현황</span> 
						<span class="fr">					
                          <input type="text" id="searchTitle" name="searchTitle" style="height: 25px; margin-right: 10px;"/>
						  <a class="btnType red" href="" name="searchbtn"  id="searchBtn"><span>검색</span></a>
						</span>
					</p> 
						
						<div class="divNoticeList">
							<table class="col">
								<caption>caption</caption>
		                            <colgroup>
						                   <col width="50px">
						                   <col width="50px">
						                    <col width="60px">
						                   <col width="50px">
						                   <col width="50px">
						                   <col width="50px">
						                   <col width="50px">
						                   <col width="50px">
						                   <col width="50px">
						                   <col width="50px">
						                   <col width="50px">
						                   <col width="150px">
						                   <col width="150px">
					                 </colgroup>
								<thead>
									<tr>
							              <th scope="col">1.주문번호</th>
							              <th scope="col">2.주문일자</th>
							              <th scope="col">3.고객기업명</th>
							              <th scope="col">4. 주문제품명</th>
							              <th scope="col">5.총 재고개수</th>
							              <th scope="col">6. 단가</th>
							              <th scope="col">7. 주문개수</th>
							              <th scope="col">8.금액 합계</th>
							              <th scope="col">9. 반품요청 여부</th>
							              <th scope="col">10. 반품처리일자</th>
							              <th scope="col">11.입금여부</th>
							              <th scope="col">12.배송지시서작성</th>
							              <th scope="col">13.반품지시서작성</th>
									</tr>

								</thead>
								<tbody id="noticeList">
									<tr>
											<td>더미 2</td>
											<td>더미 2024-07-04</td>
											<td>더미 LG</td>
											<td>더미 서버(HP)</td>
											<td>더미 50</td>
											<td>더미 1000000</td>
											<td>더미 20</td>
											<td>더미 20*1000000</td>
											<td>더미 Y</td>
											<td>더미 N</td>
											<td>더미 20024-07-06</td>
					                    	<td><button id="openDeliverybtn" class="btn btn-primary btn-sm">배송지시서 작성</button></td>
					                  		<td><button id="openOrderbtn" class="btn btn-secondary btn-sm">발주지시서 작성</button></td>
									</tr>
									<tr>
											<td>더미 1</td>
											<td>더미 2024-07-05(최신)</td>
											<td>더미 삼성</td>
											<td>더미 라우터</td>
											<td>더미 20</td>
											<td>더미 1000</td>
											<td>더미 20</td>
											<td>더미 230*1000</td>
											<td>더미 Y</td>
											<td>더미 Y</td>
											<td>더미 2024-07-04</td>
											<td><button class="btn btn-primary btn-sm">배송지시서 작성</button></td>
					                  		<td><button class="btn btn-secondary btn-sm">발주지시서 작성</button></td>
									</tr>
								</tbody>
							</table>
							
							<!-- 페이징 처리  -->
							<div class="paging_area" id="pagingNavi">
							</div>
											
						</div>

		
					</div> <!--// content -->

					<h3 class="hidden">풋터 영역</h3>
						<jsp:include page="/WEB-INF/view/common/footer.jsp"></jsp:include>
				</li>
			</ul>
		</div>
	</div>
	
	<!-- 배송지시서 작성 모달팝업 -->
	<div id="deliveryDirectionPop" class="layerPop layerType2" style="width: 600px;">
		<dl>
			<dt>
				<strong>배송지시서</strong>
			</dt>
			<dd class="content">
				
				<table class="row">
				    <caption>배송지시서</caption>
				    <tbody>
				        <tr>
				            <th scope="row">주문번호</th>
				            <td colspan="3">
				                <span id="productName">00001</span>
				            </td>
				        </tr>
				        <tr>
				            <th scope="row">주문일자</th>
				            <td colspan="3">
				                <span id="returnQuantity">2020-07-07</span> 
				            </td>
				        </tr>
				        <tr>
				            <th scope="row">고객 기업명</th>
				            <td colspan="3">
				                <span id="returnAmount">넥슨</span> 
				            </td>
				        </tr>
				        <tr>
				            <th scope="row">제품명</th>
				            <td colspan="3">
				                <span id="returnAmount">라우터</span> 
				            </td>
				        </tr>
				        <tr>
				            <th scope="row">주문 수량</th>
				            <td colspan="3">
				                <span id="returnAmount">50</span>
				            </td>
				        </tr>				        
				        <tr>
				            <th scope="row">배송담당자</th>
				            <td colspan="3">
				                <span id="returnAmount">김아무개</span> 
				            </td>
				        </tr>				        
				        <tr>
				            <th scope="row">입금여부</th>
				            <td colspan="3">
				                <span id="returnAmount">Y</span> 
				            </td>
				        </tr>				        
				    </tbody>
				</table>
			</dd>
		</dl>
		<a href="" class="closePop"><span class="hidden">닫기</span></a>
		<button id="saveDeliveryPop" type="button">저장</button>
		<button id="updateDeliveryPop" type="button">수정</button>
		
		<!--  -->
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		<button id="closeOrderPop" type="button">닫기</button>
		
		<!--
		<a href="" class="SaveDeliveryPop"><span >저장</span></a>
		<a href="" class="updateDeliveryPop"><span >수정</span></a>
		<a href="" class="updateDeliveryPop"><span >닫기</span></a>
		  -->
	</div>

		
	<!-- 발주지시서 작성 모달팝업 -->
	<div id="orderDirectionPop" class="layerPop layerType2" style="width: 600px;">
	    <dl>
	        <dt>
	            <strong>발주지시서</strong>
	        </dt>
	        <dd class="content">
	            <!-- s : 여기에 내용입력 -->
	            <table class="row">
	                <caption>제품 정보</caption>
	                <tbody>
	                    <tr>
	                        <th scope="row">제품번호</th>
	                        <td colspan="3">
	                            <span id="productName">0004</span> <!-- 여기에 서버에서 가져온 제품명 출력 -->
	                        </td>
	                    </tr>
	                    <tr>
	                        <th scope="row">제품명</th>
	                        <td colspan="3">
	                            <span id="returnQuantity">UPS(삼품전원테크)</span> <!-- 여기에 서버에서 가져온 수량 출력 -->
	                        </td>
	                    </tr>
	                    <tr>
	                        <th scope="row">발주 개수</th>
	                        <td colspan="3">
	                            <span id="returnAmount">460,000</span> <!-- 여기에 서버에서 가져온 반품 금액 출력 -->
	                        </td>
	                    </tr>
	                </tbody>
	            </table>
	        </dd>
	    </dl>
	    <a href="" class="closePop"><span class="hidden">닫기</span></a>
	    <button id="saveOrderPop" type="button">저장</button>
	    <button id="updateOrderPop" type="button">수정</button>
	    <button id="closeOrderPop" type="button">닫기</button>
	</div>
	

</body>
</html>
