<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>공지 사항</title>
    <jsp:include page="/WEB-INF/view/common/common_include.jsp"></jsp:include>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
   /*   $(document).ready(function() {
        function loadNoticeList() {
            $.ajax({
                url: "/dashboard/dashboard.do", // 서버에서 데이터를 제공하는 URL
                type: "post",
                dataType: "text", // JSON 형식으로 데이터를 받아옵니다.
                success: function(response) {
                    var noticeTableBody = $("#noticeList");
                    noticeTableBody.empty(); // 테이블 내용을 비웁니다.

                 
                },
                error: function(xhr, status, error) {
                    console.error("AJAX Error:", status, error);
                }
            });
        }

        // 페이지 로드 시 loadNoticeList 함수를 호출하여 데이터를 가져옵니다.
        loadNoticeList();
    });  */
    </script>
</head>
<body>
    <h1>공지 사항</h1>
    <div>
        <table border="1">
            <thead>
                <tr>
                    <th>공지 번호</th>
                    <th>공지 제목</th>
                    <th>공지 날짜</th>
                    <th>작성자</th>
                </tr>
            </thead>
            <tbody id="noticeList">
                <!-- AJAX를 통해 동적으로 데이터가 추가됩니다 -->
                <c:forEach var="list" items="${nList }">
                <tr>
                	<td>${list.noti_seq }</td>
                	<td>${list.noti_title }</td>
                	<td>${list.noti_date }</td>
                	<td>${list.loginID }</td>
                </tr>
                </c:forEach>
               
            </tbody>
        </table>
    </div>
</body>
</html>
