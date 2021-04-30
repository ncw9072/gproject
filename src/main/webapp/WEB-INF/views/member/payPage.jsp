<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QNA 게시판</title>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Cute+Font&display=swap" rel="stylesheet">
<script src="resources/myLib/jquery-3.2.1.min.js"></script>
<script src="resources/myLib/footer.js"></script>
<style type="text/css">
.leftbar {
	color: white;
	font-weight: bold;
	background-color: #0b3f9a;
}

a {
	text-decoration: none;
	color: black;
}

th {
	color: white;
	height: 50px;
}

table {
	width: 100%
}

textarea {
	width: 100%
}

h1 {
	text-align: center;
	font-size: 50px;
	margin-top: 20px;
	margin-bottom: 20px;
	color: #0b3f9a;
}
td {
	text-align: center;
}
/* header */
header {
	background-color: black;
	height: 40px;
	width: 75%;
	margin: 0 auto;
}

#headermenu {
	float: right;
	list-style: none;
	margin: 8px 8px 8px;
}

#headermenu>li {
	display: inline;
}
/* nav */
nav {
	background-color: ghostwhite;
	border-bottom-width: 3px;
	border-bottom-color: navy;
	border-bottom-style: solid;
	width: 75%;
	margin: 0 auto;
	height: 70px;
	padding-top: 1px;
}
/* body */
body {
	margin: 0;
}

section {
	margin: 0 auto;
	width: 75%;
	height: 600px;
	padding-top: 20px;
}
/* topmenu(nav) */
nav ul {
	list-style: none;
}

nav ul ul {
	display: none;
}

nav ul li a:hover {
	color: #0b3f9a;
}

nav ul li:hover ul {
	display: table-row-group;
	background-color: ghostwhite;
}

nav>ul>li {
	float: left;
	margin-left: 30px;
}

nav ul a {
	line-height: 30px;
	text-decoration: none;
	font-size: 20px;
	font-weight: bold;
	color: gray;
	padding: 5px;
}
/*footer---------------------------- */
footer {
	border-top-style: solid;
	border-top-color: navy;
	border-top-width: 1px;
	height: 100px;
	margin: 0 auto; /* 중앙정렬 */
	width: 75%;
}

#footerinfo {
	text-align: center;
	padding-top: 15px;
	margin-bottom: 10px;
	font-size: 20px;
	font-family: "Cute Font", sans-serif;
}

#footerlist {
	text-align: center;
	padding-bottom: 10px;
	font-family: "Cute Font", sans-serif;
	font-size: 15px;
	padding-bottom: 10px;
}

#footerbar {
	font-size: 5px;
}
/* 반응형 미디어 쿼리 */
@media ( max-width :650px) {
	#searchType {
		width: 100px;
	}
	#keyword {
		width: 120px;
	}
}
/*footer---------------------------- */
</style>
</head>
<body>
	<c:if test="${message!=null}">
		<script>
			alert('${message}');
		</script>
	</c:if>
	<header>
		<a href="home">
			<img src="resources/uploadImage/gm.png" width="40px" height="40px">
		</a>
		<ul id="headermenu">
			<!-- 조건주고 로그인 상태면 로그인 없애고 로그아웃으로 -->
			<!-- <li>로그아웃</li> -->

			<c:if test="${loginID == null}">
				<li><button>
						<a href="memberloginpage?jcode=Q">로그인</a>
					</button></li>
				<li><button>
						<a href="checkterm?jcode=Q">회원가입</a>
					</button></li>
			</c:if>
			<c:if test="${loginID != null}">
				<li><button>
						<a href="mlogout?jcode=Q">로그아웃</a>
					</button></li>
				<li><button id="mypage">
						<a href="mypage?id=${loginID}"> 마이페이지</a>
					</button></li>
			</c:if>
		</ul>
	</header>
	<nav>
		<ul id="navTopmenu">
			<li><a href="notice">공지사항 </a>
			<li><a href="musiclist">최신음악</a>
			<li><a href="javascript:;">순위차트</a>
				<ul>
					<li><a href="chart?part=DAILY">일간차트</a>
					<li><a href="chart?part=WEEKLY">주간차트</a>
					<li><a href="chart?part=MONTHLY">월간차트</a>
				</ul>
			<li><a href="javascript:;">장르음악</a>
				<ul>
					<li><a href="genrelist?genre=dance">댄스</a>
					<li><a href="genrelist?genre=ballad">발라드</a>
					<li><a href="genrelist?genre=rap">랩/힙합</a>
					<li><a href="genrelist?genre=rnb">R&B/Soul</a>
					<li><a href="genrelist?genre=indie">인디</a>
					<li><a href="genrelist?genre=rock">록/메탈</a>
					<li><a href="genrelist?genre=trot">트로트</a>
					<li><a href="genrelist?genre=jazz">재즈</a>
				</ul>
			<li><a href="javascript:;">고객센터</a>
				<ul>
					<li><a href="qna">1:1 문의</a>
					<li><a href="faq">FAQ</a>
				</ul>
		</ul>
	</nav>
	<section>
		<!-- /////////////////SECTION START//////////////////////////////////////////////////////// -->
		결제 페이지
		<!-- ///////////////////SECTION END////////////////////////////////////////////////////// -->
	</section>
	<footer>
		<div id="footerinfo">
			<a href="javascript:;" class="footergroup" id="introcompany">회사 소개</a>
			&nbsp;&nbsp; <font class="footerbar">|</font> &nbsp;&nbsp;
			<a href="javascript:;" class="footergroup" id="termsp">이용약관</a>
			&nbsp;&nbsp; <font class="footerbar">|</font> &nbsp;&nbsp;
			<a href="javascript:;" class="footergroup" id="privacy">개인정보처리방침</a>
			&nbsp;&nbsp; <font class="footerbar">|</font> &nbsp;&nbsp;
			<a href="javascript:;" class="footergroup" id="youth">청소년보호정책</a>
		</div>
		<div id="footerlist">
			<font>G-MUSIC</font> &nbsp;&nbsp; <font class="footerbar">|</font> &nbsp;&nbsp; 그린 컴퓨터 아카데미 &nbsp;&nbsp; <font class="footerbar">|</font> &nbsp;&nbsp; 공동작업 : 김지수, 남철우, 정재필, 정현근 &nbsp;&nbsp; <font class="footerbar">|</font> &nbsp;&nbsp; 사업자등록번호 : ???-??-????? <br> 문의전화 : 0000-0000 (평일 09:00 ~ 05:00) &nbsp;&nbsp; <font class="footerbar">|</font> &nbsp;&nbsp; 이메일 : gproject @ naver.com
		</div>
	</footer>
</body>
</html>