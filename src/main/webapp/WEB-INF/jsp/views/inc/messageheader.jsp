<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE HTML>

<html>
<head>
<title>index</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link href="<c:url value="/resources/assets/css/main.css" />" rel="stylesheet">
<link href="<c:url value="/resources/assets/css/menu.css" />" rel="stylesheet">
<link href="<c:url value="/resources/assets/css/message_list.css" />" rel="stylesheet">
<link href="<c:url value="/resources/assets/css/message_delete.css" />" rel="stylesheet">
<link href="<c:url value="/resources/assets/css/message_detail.css" />" rel="stylesheet">

<body class="is-preload">

	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Main -->
		<div id="main">
			<div class="inner">

				<!-- Header -->
				<header id="header">	
					<div>
					<center><a href="index" class="logo"><img src="<spring:url value='/resources/images/Logo.png'/>"></a></center>				
						<nav>
						<ul class="menu_header">
						<div class="input_box"><input type="text" placeholder="커뮤니티 통합 검색" id="search" style="width: 230px; height: 40px; text-align:center; border: 3px solid #f56a6a; background-color: white;">
						<a href="boardAllList"><span class="far fa-edit" style="color:white; margin-top: 1px; font-size:36px;"></span></a></div>
							<li><a href="index">Home</a></li>
							<li><a href="boardList?bgno=1">News</a></li>
							<li><a href="community">Community</a></li>
							<li><a href="job">Job</a></li>
							<li><a href="boardList?bgno=4">Buy & Sell</a></li>
							<li><a href="list?send_id=<%=(String) session.getAttribute("loginID")%>">Message</a></li>
							<li><a href="boardList?bgno=2">Q & A</a></li>
							<li><a href="profile?id=<%=(String) session.getAttribute("loginID")%>">MyPage</a></li>
							<li><a href="memberIview" target="_blank">Join</a></li>
							<li><a href="loginview">Login</a></li>
						</ul>				
						</nav>
					</div>
				</header>