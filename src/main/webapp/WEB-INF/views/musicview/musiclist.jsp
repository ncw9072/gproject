<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="resources/myLib/jquery-3.2.1.min.js"></script>
<script>
	$(function() { //ready

		//1. 전체 선택, 전체 해제
		// https://emessell.tistory.com/149 참고
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

		/*  $(document).on("_blank",function(e){
	            console.log("c"+e);
	            return false;
	        }); */
	});//ready *
	
	
	

	// 형식은 아이디 중복체크에서 가져옴
	// 각 체크 박스의 밸류값 가져오기
	// https://ungdoli0916.tistory.com/447 참고
	function playlist() {

      var obj_length = document.getElementsByName("snum").length;
      var songlist = new Array();
      for (var i = 0; i < obj_length; i++) {
         if (document.getElementsByName("snum")[i].checked == true) {
            songlist[i] = document.getElementsByName("snum")[i].value;
			

         }
      }

      url = "playlist?snum=" + songlist;
      console.log(url);
      window
            .open(url, "myview",
                  "toolbar=no,menubar=yes,scrollbars=yes,resizable=yes,width=500,height=400");

   } //playlist
/* 	function playlist() {


		var obj_length = document.getElementsByName("snum").length;
	       for (var i=0; i<obj_length; i++) {
	            if (document.getElementsByName("snum")[i].checked == true) {
	                alert("snum="+document.getElementsByName("snum")[i].value);
					url="playlist?snum="+document.getElementsByName("snum")[i].value;
	            }
	        }
			window.open(url,"_blank",
				"toolbar=no,menubar=yes,scrollbars=yes,resizable=yes,width=500,height=400");
		
	} //playlist */
	
</script>




</head>
<body>
	<form action="#" method="post">
		<button type="button" onclick="playlist()">플레이리스트</button>
		<table width=1200 border="1">
			<tr align="center" height="2" bgcolor="pink">
				<td width="50">
					<input type="checkbox" id="check_all" name="check_all">
				</td>
				<td>번 호(snum 아님 카운트임)</td>
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
					<td>${row.sname}</td>
					<td>${row.singername}</td>
					<td>${row.stitle}</td>
					<td>
						<a href="dnload?dnfile=${row.downloadfile}">${row.downloadfile}</a>
					</td>
				</tr>
			</c:forEach>
		</table>
	</form>
</body>
</html>
