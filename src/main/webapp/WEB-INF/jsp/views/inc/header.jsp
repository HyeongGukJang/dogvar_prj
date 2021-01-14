<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE HTML>

<html>
<head>
<title>index</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link href="<c:url value="/resources/assets/css/main.css" />" rel="stylesheet">
<link href="<c:url value="/resources/assets/css/menu.css" />" rel="stylesheet">
<script>
    // html dom 이 다 로딩된 후 실행된다.
    $(document).ready(function(){
        // menu 클래스 바로 하위에 있는 a 태그를 클릭했을때
        $(".subMenuBar>a").click(function(){
            var submenu = $(this).next("ul");
 
            // submenu 가 화면상에 보일때는 위로 보드랍게 접고 아니면 아래로 보드랍게 펼치기
            if( submenu.is(":visible") ){
                submenu.slideUp();
            }else{
                submenu.slideDown();
            }
        });
    });
</script>
<style>
    .subMenuBar a{cursor:pointer;}
    .subMenuBar .hide{display:none;}
</style>
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
							<li><a href="list?send_id=${loginMember.id}">Message</a></li>
							<li><a href="boardList?bgno=2">Q & A</a></li>
							<li><a href="profile?id=${loginMember.id}">MyPage</a></li>
							<li><a href="memberIview" target="_blank">Join</a></li>
							<li><a href="loginview">Login</a></li>
						</ul>				
						</nav>
					</div>
				</header>