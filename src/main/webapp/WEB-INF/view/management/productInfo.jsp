<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>1</title>

<jsp:include page="/WEB-INF/view/common/common_include.jsp"></jsp:include>
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
						
						
					<p class="conTitle">
						
						<select id="searchCondition">
							<option value="0">회사명</option>
							<option value="1">직원명</option>
							<option value="2">담당자명</option>
							<option value="3">담당업무</option>
						</select> 
						
						<span class="fr">					
                          <input type="text" id="searchTitle" name="searchTitle" style="height: 25px; margin-right: 10px;"/>
                          <input type="checkbox" name="xxx" value="yyy" unchecked>
							삭제된 정보 표시
                          <a class="btnType red" name="searchbtn"  id="searchBtn"><span>검색</span></a>
                          
						</span>
					</p> 
						
					<div class="divNoticeList">
							<table class="col">
								<caption>caption</caption>
		                            <colgroup>
						                   <col width="50px">
						                   <col width="150px">
						                    <col width="60px">
						                   <col width="50px">
						                   <col width="150px">
					                 </colgroup>
								<thead>
									<tr>
							              <th scope="col">모델 번호</th>
							              <th scope="col">모델 명</th>
							              <th scope="col">제품 번호</th>
							              <th scope="col">제품 명</th>
							              <th scope="col">제조사</th>
							              <th scope="col">판매가</th>
									</tr>
								</thead>
								<tbody id="userList"></tbody>
							</table>
							
							<!-- 페이징 처리  -->
							<div class="paging_area" id="pagingNavi">
							</div>
											
						</div>
						<a class="btnType red" name="newRegister"  id="newRegister"><span>신규 등록</span></a>
						<a class="btnType red"  href="" name="deleteBtn"  id="deleteBtn"><span>삭제</span></a>
						
						
						
		
					</div> <!--// content -->

					<h3 class="hidden">풋터 영역</h3>
						<jsp:include page="/WEB-INF/view/common/footer.jsp"></jsp:include>
				</li>
			</ul>
		</div>
	</div>

</body>
