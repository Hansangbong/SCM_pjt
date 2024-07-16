<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

	<c:forEach items="${N}" var="list">
	    <tr>
	        <td style="color: red">${list.cust_name} (미승인)</td>
	        <td>${list.item_name}</td>
	        <td>${list.adr}</td>
	        <td>${list.return_count}</td>
	        <td><fmt:formatNumber value="${list.item_price}" pattern="#,### 원"/></td>
	        <td><fmt:formatNumber value="${list.sum}" pattern="#,### 원"/></td>
	       	<td>${list.return_order_date}</td>
	       	<td>${list.return_processing_date}</td>
	       	<td><a href="javascript:approvalModal(${list.seq}, 'tb_return');"><button>승인</button></a></td>
	    </tr>
	</c:forEach>
	<c:forEach items="${Y}" var="list">
	    <tr>
	        <td style="color: blue">${list.cust_name} (승인)</td>
	        <td>${list.item_name}</td>
	        <td>${list.adr}</td>
	        <td>${list.return_count}</td>
	        <td><fmt:formatNumber value="${list.item_price}" pattern="#,### 원"/></td>
	        <td><fmt:formatNumber value="${list.sum}" pattern="#,### 원"/></td>
	       	<td>${list.return_order_date}</td>
	       	<td>${list.return_processing_date}</td>
	    </tr>
	</c:forEach>
	
	


