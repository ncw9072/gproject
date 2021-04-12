<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>** G-MUSIC 차트 **</title>
<link rel="stylesheet" type="text/css" href="resources/myLib/myStyle.css">
<script src="resources/myLib/jquery-3.2.1.min.js"></script>
<style>
#chart {
	width: 100%;
	height: 50px;
}
</style>

<script>
	$(function() { //ready
		$("button[name=sname]").click(function() {
		
			var buttonSnumVal = $(this).val();
				console.log(buttonSnumVal)
				url = "playlist";
				window.open(url, "myview","toolbar=no,menubar=yes,scrollbars=no,resizable=no,width=700,height=800");

				document.musiclist.action = url;
				document.musiclist.method = "post";
				document.musiclist.target = "myview";

				$('input[name=snumVal]').attr('value',buttonSnumVal);
				document.musiclist.submit();
			}); // playlist
	});//click
</script>
</head>
<body>
<form name="musiclist">
<input type="hidden" id="snumVal" name="snumVal" value="">
	<table border="1" id="chart">
		<tr align="center" height="2" bgcolor="pink">
			<td width="40">순 위</td>
			<td>앨 범</td>
			<td>곡 명</td>
		</tr>
		<c:forEach var="row" items="${Banana}" varStatus="vs" begin="0" end="9">
			<tr>
				<td>${vs.count}</td>
				<td>
					<img src="${row.image}" width="40" height="40">
				</td>
				<td>
					<button type="button" name="sname" value="${row.snum}">${row.sname}</button>
				</td>
			</tr>
		</c:forEach>
	</table>
</form>
</body>
</html>