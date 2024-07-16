<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


        <c:if test="${1 > 0 }">
			<c:set var="nRow" value="${pageSize*(currentPage-1)}" /> 
            <c:forEach var="list" items="${user}">
                <div id=userdetail style="border:2px solid">						
							<select id="type2">
								<option value="B">기업 고객</option>
								<option value="C">내부 직원</option>
							</select>
							<span>아이디</span>
							<input type="text" id="userId2" name="userId" value="${list.loginID }" style="height: 25px; margin-right: 10px;"/>
							비밀번호
							<input type="text" id="passwd2" name="passwd" value="${list.password}" style="height: 25px; margin-right: 10px;"/> 	
							<br><span>      </span>
							회사명
							<input type="text" id="copName2" name="copName" value="${list.cust_name }" style="height: 25px; margin-right: 10px;"/>
							담당자명
							<input type="text" id="manager2" name="manager" value="${list.cust_person}" style="height: 25px; margin-right: 10px;"/>
							<br>
							연락처
							<input type="text" id="phone2" name="phon" value="${list.hp}" style="height: 25px; margin-right: 10px;"/>
							이메일
							<input type="text" id="email2" name="email" value="${list.email}" style="height: 25px; margin-right: 10px;"/>
							<br>
							직원명
							<input type="text" id="clerk2" name="clerk" value="${list.name}" style="height: 25px; margin-right: 10px;"/>
							담당업무
							<span>
								<select id="jobCode2">
									<option value="A">SCM</option>
									<option value="B">배송</option>
									<option value="C">구매</option>
									<option value="D">임원</option>
								</select>
							</span>  
							<br>
							우편번호
							<input type="text" id="zipCode2" name="zipCode" value="${list.zip_code}" style="height: 25px; margin-right: 10px;"/><br>
							주소
							<input type="text" id="address2" name="address" value="${list.addr}" style="height: 25px; margin-right: 10px;"/><br>
							상세주소
							<input type="text" id="addressDetail2" name="addressDetail" value="${list.addr_detail}" style="height: 25px; margin-right: 10px;"/>
							
							<a class="btnType red" href="" name="ajust"  id="ajustBtn"><span>수정</span></a>
							<a class="btnType red" name="cancle"  id="cancleBtn2"><span>취소</span></a>
												
						</div>
               <c:set var="nRow" value="${nRow + 1}" />
            </c:forEach>
           </c:if>

<script>
$(document).ready(function() {
	<c:forEach var="list" items="${user}" varStatus="status">
    	var jobCode = "${list.job_code}";
    	$('#jobCode').val(jobCode);
	</c:forEach>

	$("#ajustBtn").click(function() {
		userUpdate();
	});
	
	$("#cancleBtn2").click(function() {
		ajustCancle();
	});
	
});

function userUpdate(){
	var loginID = $('#userId2').val();
	var name = $('#clerk2').val();
	var user_Type = $('#type2').val();
	var password = $('#passwd2').val();
	var hp = $('#phone2').val();
	var email = $('#email2').val();
	var zip_code = $('#zipCode2').val();
	var addr = $('#address2').val();
	var addr_detail = $('#addressDetail2').val();
	var job_code = $('#jobCode2').val();
	
	console.log("업데이트 함수 시작");
	console.log("loginID: "+loginID);
	console.log("name: "+name);
	console.log("user_Type: "+user_Type);
	console.log("hp: "+hp);
	console.log("email: "+email);
	console.log("addr: "+addr);
	
	var param = {
			loginID : loginID,
			user_Type : user_Type,
			name : name,
			password : password,
			hp : hp,
			email : email,
			zip_code : zip_code,
			addr : addr,
			addr_detail : addr_detail,
			job_code : job_code 
	};
	
	var callBackFunction = function(response){
		alert("저장 됐습니다");
	}
	
	callAjax("/management/userAjust.do", "post", "text", false, param,callBackFunction);
}

function ajustCancle(){ /////등록 취소
	$("#userdetail").hide();
	$("deleteBtn").hide();
}
</script>
