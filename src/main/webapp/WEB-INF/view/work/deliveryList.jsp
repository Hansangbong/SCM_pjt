<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

	<c:forEach items="${list}" var="list">
		<tr>
		    <td>${list.delivery_num}</td>
			<td>${list.delivery_name}</td>
			<td>${list.storage_name}</td>
			<td>${list.delivery_end_loc }</td>
			<td>${list.delivery_state}</td>
			<td><a href="javascript:deliveryModal(${list.delivery_num});"><button>상세보기</button></a></td>
		</tr>
		 
	</c:forEach>

