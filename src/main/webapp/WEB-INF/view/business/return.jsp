<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<title> 공지사항  </title>

<jsp:include page="/WEB-INF/view/common/common_include.jsp"></jsp:include>

<script type="text/javascript">
$(document).ready(function() {
    // 반품승인요청 버튼 클릭 시 모달 팝업 보이기
    $('#returnBtn').click(function(e) {
        e.preventDefault(); // 기본 이벤트 동작 방지
        $('#BanpumInsertModal').modal('show');
    });

    // 모달 닫기 버튼 클릭 시 모달 닫기
    $('#btnClose').click(function() {
        $('#BanpumInsertModal').modal('hide');
    });

    // 드롭다운 메뉴 설정
    $('#dropdownMenuLink').dropdown();
    $('.dropdown-toggle').dropdown();
    
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
						<span>거래내역</span> 
						<span class="fr">					
                          <input type="text" id="searchTitle" name="searchTitle" style="height: 25px; margin-right: 10px;"/>
						  <a class="btnType red" href="" name="searchbtn"  id="searchBtn"><span>검색</span></a>
						</span>
					</p> 
						
							<Strong class="btn_nav bold">반품 현황</Strong> 
						
						<div class="divNoticeList">
							<table class="col">
								<caption>caption</caption>
		                            <colgroup>
						                   <col width="50px">
						                   <col width="200px">
						                    <col width="60px">
						                   <col width="50px">
					                 </colgroup>
								<thead>
									<tr>
							              <th scope="col">반품 제품명</th>
							              <th scope="col">반품 신청일</th>
							              <th scope="col">반품 수량</th>
							              <th scope="col">반품 금액</th>
									</tr>

								</thead>
								<tbody id="noticeList">
									<tr>
											<td>더미 플레이스테이션</td>
											<td>더미 2024-07-04</td>
											<td>더미 1000개</td>
											<td>더미 1,000,000원</td>
									</tr>
																		<tr>
											<td>더미2 플레이스테이션</td>
											<td>더미2 2024-07-04</td>
											<td>더미2 1000개</td>
											<td>더미2 1,000,000원</td>
									</tr>
								</tbody>
							</table>
							
						<span class="fr">					
 						  <a class="btnType red p-2" href="" name="returnbtn"  id="returnBtn"><span>반품승인요청</span></a>
						</span>
							
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


	<!-- 모달팝업 -->
	<div id="BanpumInsertModal" class="layerPop layerType2" style="width: 600px;">
		<dl>
			<dt>
				<strong>반품지시서</strong>
			</dt>
			<dd class="content">
				<!-- s : 여기에 내용입력 -->
				<table class="row">
				    <caption>반품 정보</caption>
				    <tbody>
				        <tr>
				            <th scope="row">반품 제품명</th>
				            <td colspan="3">
				                <span id="productName">플레이스테이션4</span> <!-- 여기에 서버에서 가져온 제품명 출력 -->
				            </td>
				        </tr>
				        <tr>
				            <th scope="row">반품 수량</th>
				            <td colspan="3">
				                <span id="returnQuantity">40</span> <!-- 여기에 서버에서 가져온 수량 출력 -->
				            </td>
				        </tr>
				        <tr>
				            <th scope="row">반품 금액</th>
				            <td colspan="3">
				                <span id="returnAmount">460,000</span> <!-- 여기에 서버에서 가져온 반품 금액 출력 -->
				            </td>
				        </tr>
				    </tbody>
				</table>
				
				<!-- 부트스트랩 셀렉트박스 넣어줘 -->
				 <!-- Dropdown -->
				<div class="dropdown">
				  <button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown">
				    Dropdown Example
				    <span class="caret"></span>
				  </button>
				  <ul class="dropdown-menu">
				    <li><a href="#">Action</a></li>
				    <li><a href="#">Another action</a></li>
				    <li><a href="#">Something else here</a></li>
				    <li role="separator" class="divider"></li>
				    <li><a href="#">Separated link</a></li>
				  </ul>
				</div>

			</dd>

		</dl>
		<a href="" class="closePop"><span class="hidden">닫기</span></a>
	</div>
	

</body>
</html>
