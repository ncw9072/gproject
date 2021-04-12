<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>Gmusic</title>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Chela+One&display=swap"
	rel="stylesheet">
<script src="resources/myLib/jquery-3.2.1.min.js"></script>
<script src="resources/myLib/topmenu.js"></script>
<script src="resources/myLib/footer.js"></script>
<script src="resources/myLib/login.js"></script>
<script src="resources/myLib/mypage.js"></script>
<script src="resources/myLib/myinfochange.js"></script>
<script src="resources/myLib/chartcount.js"></script>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Cute+Font&display=swap"
	rel="stylesheet">
<style>
body {
	margin: 0;
}

hr {
	margin-top: 0px;
	margin-bottom: 0px;
}

a {
	text-decoration: none;
	color: black;
}

/* header */
#header {
	background-color: silver;
	height: 40px;
	width: 100%;
	margin: 0 auto;
	width: 75%;
}

#headermenu {
	float: right;
	list-style: none;
	margin: 8px 8px 8px;
}

#headermenu>li {
	display: inline;
}
/* header */

/* nav */
#nav {
	height: 160px;
	background-color: ghostwhite;
	margin: 0 auto; /* 중앙정렬 */
	width: 75%;
	border-bottom-width: 3px;
	border-bottom-color: navy;
	border-bottom-style: solid;
}

#keyword {
	margin-bottom: 25px;
}

#searchBtn {
	margin-bottom: 25px;
}

#logofont {
	font-family: 'Chela One', cursive;
}

#searchdiv {
	height: 80px;
}

#topmenu {
	position: absolute;
	z-index: 100;
	background-color: ghostwhite;
	height: 80px;
	width: 75%;
}

#topmenu ul {
	list-style: none;
}

#topmenu ul ul {
	display: none;
}

#topmenu ul li a:hover {
	color: hotpink;
}

#topmenu ul li:hover ul {
	display: table-row-group;
	background-color: ghostwhite;
}

#topmenu>ul>li {
	float: left;
	margin-left: 15px;
}

#topmenu ul a {
	line-height: 30px;
	text-decoration: none;
	font-size: 20px;
	font-weight: bold;
	color: gray;
	padding: 5px;
}

@media ( max-width :1200px) {
	#topmenu>ul>li {
		margin-left: 1px;
	}
}

/* nav */

/* section */
#section {
	height: 2000px;
	margin: 0 auto; /* 중앙정렬 */
	width: 75%;
	display: grid;
	grid-template-columns: 2fr 1fr;
}

#section>#sec1 {
	border-right: solid green;
}

#sec1>div {
	border-bottom: solid green;
	height: 295px;
}
/* 로그인 파트부분 */
#login {
	border-bottom: solid green;
	height: 265px;
	padding: 16px 16px 12px 17px;
	border: 1px solid #dae1e6;
}

#login_location {
	height: 50px;
	width: 244px;
	margin: 0 auto;
	padding: 50px 88px 47px 13px;
}

#login_button {
	height: 60px;
	width: 322px;
	background-color: #0b3f9a;
	font-size: 20px;
	color: #fff;
}

#loginsuccess {
	height: 126px;
	width: 293px;
	background-color: ghostwhite;
	border: 3px black;
}

#welcome {
	height: 81px;
	width: 290px;
	background-color: ghostwhite;
}

#logout_btn {
	height: 38px;
	width: 136px;
	background-color: #0b3f9a;
	font-size: 15px;
	color: #fff;
}

#chart {
	height: 580px;
	list-style: none;
	font-weight: normal;
}
/* ----------- login 부분--------- */

/* section */

/*footer---------------------------- */
#footer {
	height: 100px;
	background-color: ghostwhite;
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
/*footer---------------------------- */
</style>
<c:if test="${message!=null}">
	<script>
		alert('${message}');
	</script>
</c:if>

</head>
<body>
	<div id="header">
		<ul id="headermenu">
			<!-- 조건주고 로그인 상태면 로그인 없애고 로그아웃으로 -->
			<!-- <li>로그아웃</li> -->

			<li><button>
					<a href="javascript:;">이용권구매</a>
				</button></li>
			<c:if test="${loginID == null}">
				<li><button>
						<a href="memberloginpage">로그인</a>
					</button></li>
				<li><button>
						<a href="checkterm">회원가입</a>
					</button></li>
			</c:if>
			<c:if test="${loginID != null}">
				<li><button>
						<a href="mlogout">로그아웃</a>
					</button></li>

				<li><button>
						<a href="mypage?id=${loginID}"> 마이페이지</a>
					</button></li>
			</c:if>
		</ul>
	</div>
	<!-- header -->

	<div id="nav">
		<div id="searchdiv">
			<a href="home" id="logofont">GMUSIC</a> <input type="text"
				name="keyword" id="keyword" maxlength="10" size="50"
				style="vertical-align: middle;">
			<button id="searchBtn" style="vertical-align: middle;">Search</button>
		</div>
		<hr>
		<div id="topmenu"></div>
		<!-- topmenu -->
	</div>
<!--//////////////////// section start //////////////////////////// -->
	<div id="section">
		<form name="musiclist">
		<button type="button" onclick="getCheckboxValue()">플레이리스트</button>
		<div id='result'></div>
		<input type="hidden" id="snumVal" name="snumVal" value="">
		<table style="width: 1200px;" border="1">
			<tr align="center" height="2" bgcolor="pink">
				<td width="50">
					<input type="checkbox" id="check_all" name="check_all">
				</td>
				<td width="40">번 호</td>
				<td>Image</td>
				<td>곡 명</td>
				<td>가 수</td>
				<td>앨범명</td>
				<td>downloadfile</td>
			</tr>
			<c:forEach var="row" items="${Banana}" varStatus="vs">
				<tr>
					<td align="center">
						<input type="checkbox" class="normalCheck" id="snum${row.snum}" name="snum" value="${row.snum}">
					</td>
					<td align="center">${vs.count}</td>
					<td>
						<img src="${row.image}" width="70" height="70">
					</td>
					<td>
						<button type="button" name="sname" value="${row.snum}">${row.sname}</button>
					</td>
					<td>${row.singername}</td>
					<td>${row.stitle}</td>
					<td>
						<a href="dnload?dnfile=${row.downloadfile}">${row.downloadfile}</a>
					</td>
				</tr>
			</c:forEach>
		</table>
	</form>
	</div>
<!--//////////////////// section end //////////////////////////// -->
	<div id="footer">
		<div id="footerinfo">
			<a href="javascript:;" class="footergroup" id="introcompany">회사
				소개</a>&nbsp;&nbsp; <font class="footerbar">|</font> &nbsp;&nbsp; <a
				href="javascript:;" class="footergroup" id="termsp">이용약관</a>&nbsp;&nbsp;
			<font class="footerbar">|</font> &nbsp;&nbsp; <a href="javascript:;"
				class="footergroup" id="privacy">개인정보처리방침</a>&nbsp;&nbsp; <font
				class="footerbar">|</font> &nbsp;&nbsp; <a href="javascript:;"
				class="footergroup" id="youth">청소년보호정책</a>
		</div>
		<div id="footerlist">
			<font>G-MUSIC</font> &nbsp;&nbsp; <font class="footerbar">|</font>
			&nbsp;&nbsp; 그린 컴퓨터 아카데미 &nbsp;&nbsp; <font class="footerbar">|</font>
			&nbsp;&nbsp; 공동작업 : 김지수, 남철우, 정재필, 정현근 &nbsp;&nbsp; <font
				class="footerbar">|</font> &nbsp;&nbsp; 사업자등록번호 : ???-??-????? <br>
			문의전화 : 0000-0000 (평일 09:00 ~ 05:00) &nbsp;&nbsp; <font
				class="footerbar">|</font> &nbsp;&nbsp; 이메일 : gproject @ naver.com
		</div>
	</div>
</body>
</html>