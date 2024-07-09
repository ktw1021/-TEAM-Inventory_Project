<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<nav>
    <ul>
        <li><a href="/inventory/admin_home.jsp">본사 홈</a></li>
        <li><a href="/admins/order_check_list.jsp">발주 승인</a></li>
        <li><a href="<%=request.getContextPath()%>/admin/booklist">교재 관리</a></li>
        <li><a href="/admins/user_list.jsp">회원 승인</a></li>
    </ul>
</nav>