<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<!-- 갯수가 0인 경우  -->
		<c:if test="${codeCnt eq 0 }">
			<tr>
				<td colspan="4">데이터가 존재하지 않습니다.</td>
			</tr>
		</c:if>



        <c:if test="${codeCnt > 0 }">
			<c:set var="nRow" value="${pageSize*(currentPage-1)}" /> 
            <c:forEach var="list" items="${codeList}"  varStatus="status">
                <tr>
                    <td id="codeDetailView" >${status.index + 1}</td>
                    <td class="groupCode" data-groupcode="${list.group_code}">${list.group_code}</td>
                    <td class="groupName" data-groupname="${list.group_name}">${list.group_name}</td>
                    <td class="groupYn" data-groupyn="${list.use_yn}">${list.use_yn}</td>
                    <td>${list.reg_date}</td>
                    <td ><button class="adjustBtn">수정</button></td>
                    
                </tr>
               <c:set var="nRow" value="${nRow + 1}" />
            </c:forEach>
        </c:if>
        
            
      
<script>
$(document).ready(function() {
	
	
	$(document).on('click', '.adjustBtn', function() {
		var row = $(this).closest("tr");
		$("#myModal").show();
        
        // 행의 데이터 추출
        var groupCode = row.find(".groupCode").data('groupcode');
        var groupName = row.find(".groupName").data("groupname");
        var groupYn = row.find(".groupYn").data("groupyn");
        var regDate = row.find("td:nth-child(5)").text(); // 등록일 텍스트 추출

        // 추출한 데이터 콘솔에 출력 (디버깅 용도)
        console.log("Group Code: " + groupCode);
        console.log("Group Name: " + groupName);
        console.log("Group YN: " + groupYn);
        console.log("Reg Date: " + regDate);
        
        $("#groupCodeModal").val(groupCode);
		$("#groupCodeNameModal").val(groupName);
		 
		if(groupYn == 'Y'){
			$("input[name='codeRadio'][value=0]").prop("checked", true);
		} else {
			$("input[name='codeRadio'][value=1]").prop("checked", true);
		}
		
	});
				
		
		
		
	
    
});
</script>
    
    
