<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<title> 공지사항  </title>

<jsp:include page="/WEB-INF/view/common/common_include.jsp"></jsp:include>



</head>
<!-- 작업지시서 => 발주지시서 목록 -->
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
						<span>발주지시서</span> 
						<span class="fr">					
                          <input type="text" id="searchTitle" name="searchTitle" style="height: 25px; margin-right: 10px;"/>
						  <a class="btnType red" href="" name="searchbtn"  id="searchBtn"><span>검색</span></a>
						</span>
					</p> 
						
							<Strong class="btn_nav bold">발주 지시서</Strong> 
						
						<div class="divNoticeList">
							<table class="col">
								<caption>caption</caption>
		                            <colgroup>
						                   <col width="50px">
						                   <col width="200px">
						                    <col width="60px">
						                   <col width="50px">
						                   <col width="50px">
					                 </colgroup>
								<thead>
									<tr>
							              <th scope="col">제품번호</th>
							              <th scope="col">제품명</th>
							              <th scope="col">발주업체</th>
							              <th scope="col">날짜</th>
							              <th scope="col">수량</th>
									</tr>

								</thead>
								<tbody id="noticeList">
									<tr>
											<td>더미 1</td>
											<td>더미 모니터</td>
											<td>더미 LG</td>
											<td>더미 2024-07-01</td>
											<td>더미 100(개)</td>
									</tr>
									<tr>
											<td>더미2 2</td>
											<td>더미2 2024-07-03</td>
											<td>더미2 삼송</td>
											<td>더미2 2024-06-31</td>
											<td>더미2 180(개)</td>
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
	
	
	
	

</body>
</html>
