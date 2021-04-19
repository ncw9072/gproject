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
<script src="resources/myLib/pagingSec1_1.js"></script>

<!-- 추가 -->
<script>
	var keydownCtrl = 0;
	var kedownShift = 0;

	document.onkeydown = keycheck;
	document.onkeyup = uncheckCtrlShift;

	function keycheck() {
		switch (event.keyCode) {
		case 123:
			event.keyCode = '';
			return false;
			break;
		case 17:
			event.keyCode = '';
			keydownCtrl = 1;
			return false;
			break;
		}
		if (keydownCtrl)
			return false;

	}

	function uncheckCtrlShift() {
		if (event.keyCode == 17)
			keydownCtrl = 0;
		if (event.keyCode == 16)
			keydownShift = 0;

	}

	function click() {
		if ((event.button == 2) || (event.button == 2)) {
			alert('마우스 오른쪽 / 컨트롤 / F12 금지입니다');
		}
	}
	document.onmousedown = click;
</script>
<script>
$(function() { //ready
      // 곡명 버튼 눌렀을때 실행 
      // 플레이 리스트에 단일로 실행됨
      $(".atag").click(function() {

         var buttonSnumVal = $(this).attr('value');
		console.log(buttonSnumVal);
         url = "playlist";
         window.open(url, "myview",
                     "toolbar=no,menubar=yes,scrollbars=no,resizable=no,width=700,height=800");
       
         document.musiclist.action =url;
         document.musiclist.method="post";
         document.musiclist.target="myview";
         
         $('input[name=snumVal]').attr('value',buttonSnumVal);
      
         document.musiclist.submit();
      });
      
   });//ready *
</script>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Cute+Font&display=swap"
	rel="stylesheet">

</head>
<body>
	<h2>회원님께 추천드리는 노래목록</h2>
					<%-- <img src="${row.image}" width="22%"> --%>
	<!--//////////////////// section start //////////////////////////// -->
	<div id="section1_1">
		<div>
			<a href="genrelist?genre=${musicGenre}">더보기</a>
		</div>
		<div id='result'></div>
		<input type="hidden" id="snumVal" name="snumVal" value="">
		<div class="gallerylist">
			<ul>
			<c:forEach var="row" items="${Banana}" varStatus="vs">
				<li>		
					<a href="" class="atag" value="${row.snum}">
						<div class="screen">
							<div class="top">${row.sname}</div>
							<div class="bottom">${row.singername}</div>
							<img src="${row.image}">
						</div>
						<div>
							<h3>이미지 위에 오브젝트가 나타나는 효과</h3>
						</div>
					</a>
				</li>		
			</c:forEach>
			</ul>
		</div>
	</div>

	<!-- 페이징 -->
		<div align="center">
			<!-- ver 01 : pageMaker.makeQuery(?) -->
			<!-- ver 02 : pageMaker.searchQuery(?) -->
			<!-- 1) First << , Prev < : enabeld 여부 -->
			<c:if test="${pageMaker.prev && pageMaker.sPageNo>1}">
				<a href="javascript:;" class="pagingAjax1"
					value1="genrelist${pageMaker.makeQuery(1)}&genre=${musicGenre}&pagingCode=section1_1">&#8666;</a>&nbsp; <!-- First -->
				<!-- "qna?currPage=1" -->
				<a href="javascript:;" class="pagingAjax1"
					value1="genrelist${pageMaker.makeQuery(pageMaker.sPageNo-1)}&genre=${musicGenre}&pagingCode=section1_1">&#8636;</a>
				<!-- Prev -->
			</c:if>
	
			<!-- 2) sPage~ePage까지 displayPageNo 값 만큼 출력 -->
			<c:forEach var="i" begin="${pageMaker.sPageNo}"
				end="${pageMaker.ePageNo}">
				<c:if test="${i==pageMaker.cri.currPage}">
					<font style="font-weight: bold;" color="navy">${i}&nbsp;</font>
				</c:if>
				<c:if test="${i!=pageMaker.cri.currPage}">
					<a href="javascript:;" class="pagingAjax1"
						value1="genrelist${pageMaker.makeQuery(i)}&genre=${musicGenre}&pagingCode=section1_1">${i}</a>&nbsp;
			</c:if>
	
				<!-- 삼항식과 비교 
			<c:out value="${i==pageMaker.cri.currPage ? 'class=active' : ''}"/>
			-->
			</c:forEach>
	
			<!-- 3) Next > , Last >> : enabled 여부 -->
			<c:if test="${pageMaker.next && pageMaker.ePageNo>0}">
				<a href="javascript:;" class="pagingAjax1"
					value1="genrelist${pageMaker.makeQuery(pageMaker.ePageNo+1)}&genre=${musicGenre}&pagingCode=section1_1">&nbsp;&nbsp;&#8640;</a>&nbsp; <!-- Next -->
				<a href="javascript:;" class="pagingAjax1"
					value1="genrelist${pageMaker.makeQuery(pageMaker.lastPageNo)}&genre=${musicGenre}&pagingCode=section1_1">&#8667;</a>&nbsp;&nbsp; <!-- Last -->
	
			</c:if>
		</div>
	<!--//////////////////// section end //////////////////////////// -->
</body>
</html>