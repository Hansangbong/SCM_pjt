<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<title> 공지사항  </title>

<jsp:include page="/WEB-INF/view/common/common_include.jsp"></jsp:include>
<script>

$(function() {
	returnList();
	searchBtnEvent();
})

function searchBtnEvent() {
	$("#searchBtn").click(function(event){
		event.preventDefault();
		returnList();
	})
}

function returnList() {

	let param = {
			searchTitle : $("#searchTitle").val(),
			searchStDate : $("#searchStDate").val(),
			searchEdDate : $("#searchEdDate").val()
	}

	var callBackFunction = function(res) {

		$("#directionReturnList").empty().append(res);

	}

	callAjax("/direction/ajax_returnList.do", "post", "text", false, param, callBackFunction);
}

</script>


</head>
<!-- 작업지시서 => 반품지시서 목록 -->
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
						    <span>반품지시서</span> 
						    <span class="fr"> 
						    	<!-- 
						        <select name="" id="searchType">
			                        <option value="item_name">제품명</option>
			                        <option value="equipment_type">장비</option>
			                        <option value="manufac">제조사</option>
			                     </select>
			                      -->
						        <input type="text" id="searchTitle" name="searchTitle" style="height: 25px; margin-right: 10px;"/>
						        기간
						        <input type="date" id="searchStDate" name="searchStDate" style="height: 25px; margin-right: 10px;"/> 
						        ~ 
						        <input type="date" id="searchEdDate" name="searchEdDate" style="height: 25px; margin-right: 10px;"/>
						        <a class="btnType red" href="" name="searchbtn" id="searchBtn"><span>검색</span></a>
						    </span>
						</p>

						
							<Strong class="btn_nav bold">반품 지시서</Strong> 
						
						<div class="divNoticeList">
							<table class="col">
								<caption>caption</caption>
		                            <colgroup>
						                   <col width="50px">
						                   <col width="50px">
						                   <col width="60px">
						                   <col width="50px">
						                   <col width="50px">
					                 </colgroup>
								<thead>
									<tr>
							              <th scope="col">반품신청일자</th>
							              <th scope="col">제품명</th>
							              <th scope="col">반품 개수</th>
							              <th scope="col">금액</th>
							              <th scope="col">반품상태?? return_state 임원승인여부</th>
									</tr>
								</thead>
								<tbody id="directionReturnList"></tbody>
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
	

</body>
</html>
