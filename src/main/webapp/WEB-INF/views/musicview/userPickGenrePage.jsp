<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>Gmusic</title>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Chela+One&display=swap" rel="stylesheet">
<script src="resources/myLib/jquery-3.2.1.min.js"></script>
<script src="resources/myLib/topmenu.js"></script>
<script src="resources/myLib/footer.js"></script>
<script src="resources/myLib/login.js"></script>
<script src="resources/myLib/mypage.js"></script>
<script src="resources/myLib/myinfochange.js"></script>
<script src="resources/myLib/chartcount.js"></script>
<script src="resources/myLib/pagingSec1_1.js"></script> <!-- 추가 -->
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

      // input checkbox
      // https://emessell.tistory.com/149 참고
      //1. 전체 선택, 전체 해제
      $("#check_all").click(function() {

         var checked = $(this).is(":checked");

         if (checked) {
            $(".normalCheck").prop('checked', true);
         } else {
            $(".normalCheck").prop('checked', false);
         }
      });

      // 2. 전체선택 후 하나만 해제했을 때, 전체선택도 해체
      // 3. 개별 선택으로 전체 다 선택되었을 때, 전체선택에도 체크
      $(".normalCheck").click(function() {

         var checked = $(this).is(":checked");

         if (!checked) {
            $("#check_all").prop('checked', false);
         } else {
            var is_checked = true;

            $(".normalCheck").each(function() {
               is_checked = is_checked && $(this).is(":checked");
            });

            $("#check_all").prop("checked", is_checked);

         }
      });
      
      
      // 곡명 버튼 눌렀을때 실행 
      // 플레이 리스트에 단일로 실행됨
      $("button[name=sname]").click(function() {

         var buttonSnumVal = $(this).val();

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
   

   
   // window.open post 방식으로 전달하기
   // https://darkhorizon.tistory.com/284 참고
   // 체크박스(checkbox)에 선택 된 값 출력하기
   // https://hianna.tistory.com/430 참고
   function getCheckboxValue()  {
      // 선택된 목록 가져오기
      const query = 'input[name="snum"]:checked';
      const selectedEls = document.querySelectorAll(query);
   
      // 선택된 목록에서 value 찾기
      let result = '';
      selectedEls.forEach((el) => {
      result += el.value + ',';
      });
      
      // div에 출력 하기
      document.getElementById('result').innerText
      = result;
      
      url = "playlist";
      window.open(url, "myview",
                  "toolbar=no,menubar=yes,scrollbars=no,resizable=no,width=700,height=800");
    
      document.musiclist.action =url;
      document.musiclist.method="post";
      document.musiclist.target="myview";
      
      // 항목 추가 실험중 넣으면 항목 추가됨
      //var addsnumVal = $('input[name=snumVal]').val();
      //if (addsnumVal != null) {
      //   $('input[name=snumVal]').attr('value',addsnumVal+result);
      //}else{
         $('input[name=snumVal]').attr('value',result);
      //}
   
      document.musiclist.submit();
   
   }

</script>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Cute+Font&display=swap" rel="stylesheet">

</head>
<body>
	<h2>고객님의 선호 장르 입니다.</h2>
	<!--//////////////////// section start //////////////////////////// -->
	<div id="section1_1">
			<div><a href="genrelist?genre=${userPickGenre1}">더보기</a></div>
			<div id='result'></div>
			<input type="hidden" id="snumVal" name="snumVal" value="">
				
				<c:forEach var="row" items="${Banana}" varStatus="vs">
					<img src="${row.image}" width="22%">&nbsp;
				</c:forEach>
	</div>
	
		<!-- 페이징 -->
	<div align="center">
		<!-- ver 01 : pageMaker.makeQuery(?) -->
		<!-- ver 02 : pageMaker.searchQuery(?) -->
		<!-- 1) First << , Prev < : enabeld 여부 -->
		<c:if test="${pageMaker.prev && pageMaker.sPageNo>1}">
			<a href="javascript:;" class="pagingAjax1" value1="genrelist${pageMaker.makeQuery(1)}&genre=${musicGenre}&pagingCode=section1_1">&#8666;</a>&nbsp; <!-- First -->
			<!-- "qna?currPage=1" -->
			<a href="javascript:;" class="pagingAjax1" value1="genrelist${pageMaker.makeQuery(pageMaker.sPageNo-1)}&genre=${musicGenre}&pagingCode=section1_1">&#8636;</a>
			<!-- Prev -->
		</c:if>

		<!-- 2) sPage~ePage까지 displayPageNo 값 만큼 출력 -->
		<c:forEach var="i" begin="${pageMaker.sPageNo}" end="${pageMaker.ePageNo}">
			<c:if test="${i==pageMaker.cri.currPage}">
				<font style="font-weight: bold;" color="navy">${i}&nbsp;</font>
			</c:if>
			<c:if test="${i!=pageMaker.cri.currPage}">
				<a href="javascript:;" class="pagingAjax1" value1="genrelist${pageMaker.makeQuery(i)}&genre=${musicGenre}&pagingCode=section1_1">${i}</a>&nbsp;
		</c:if>

			<!-- 삼항식과 비교 
		<c:out value="${i==pageMaker.cri.currPage ? 'class=active' : ''}"/>
		-->
		</c:forEach>

		<!-- 3) Next > , Last >> : enabled 여부 -->
		<c:if test="${pageMaker.next && pageMaker.ePageNo>0}">
			<a href="javascript:;" class="pagingAjax1" value1="genrelist${pageMaker.makeQuery(pageMaker.ePageNo+1)}&genre=${musicGenre}&pagingCode=section1_1">&nbsp;&nbsp;&#8640;</a>&nbsp; <!-- Next -->
			<a href="javascript:;" class="pagingAjax1" value1="genrelist${pageMaker.makeQuery(pageMaker.lastPageNo)}&genre=${musicGenre}&pagingCode=section1_1">&#8667;</a>&nbsp;&nbsp; <!-- Last -->

		</c:if>
	</div>
	<!--//////////////////// section end //////////////////////////// -->
</body>
</html>