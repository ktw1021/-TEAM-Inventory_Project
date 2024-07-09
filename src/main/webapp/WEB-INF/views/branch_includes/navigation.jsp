<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<nav>
    <ul>
        <li><a href="<%= request.getContextPath() %>/branches/home">교재 재고</a></li>
        <li><a href="<%= request.getContextPath() %>/branches/order_list">발주</a></li>
        <li><a href="<%= request.getContextPath() %>/branches/stock_in_list">입고</a></li>
        <li><a href="<%= request.getContextPath() %>/branches/stock_out_list">출고</a></li>
    </ul>
</nav>
