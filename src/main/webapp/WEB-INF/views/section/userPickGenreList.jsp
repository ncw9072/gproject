<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Pick Genre List</title>
<script src="resources/myLib/jquery-3.2.1.min.js"></script>
<script>
	
</script>
</head>
<body>
	<div id="section">
		<form name="musiclist">
		<button type="button" onclick="getCheckboxValue()">플레이리스트</button>
		<div id='result'></div>
		<input type="hidden" id="snumVal" name="snumVal" value="">
		<table style="width: 100%;" border="1" id="table">
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
	<!-- 페이징 -->
	<div  align="center">
		<!-- ver 01 : pageMaker.makeQuery(?) -->
		<!-- ver 02 : pageMaker.searchQuery(?) -->
	<!-- 1) First << , Prev < : enabeld 여부 -->
		<c:if test="${pageMaker.prev && pageMaker.sPageNo>1}">
			<a href="genrelist${pageMaker.makeQuery(1)}&genre=${musicGenre}">&#8666;</a>&nbsp; <!-- First -->
			<!-- "qna?currPage=1" -->
			<a href="genrelist${pageMaker.makeQuery(pageMaker.sPageNo-1)}&genre=${musicGenre}">&#8636;</a> <!-- Prev -->
		</c:if>
	
	<!-- 2) sPage~ePage까지 displayPageNo 값 만큼 출력 -->
		<c:forEach var="i" begin="${pageMaker.sPageNo}" end="${pageMaker.ePageNo}">
			<c:if test="${i==pageMaker.cri.currPage}">
				<font style="font-weight: bold;" color="navy">${i}&nbsp;</font>
			</c:if>
			<c:if test="${i!=pageMaker.cri.currPage}">
				<a href="genrelist${pageMaker.makeQuery(i)}&genre=${musicGenre}">${i}</a>&nbsp;
			</c:if>
			
			<!-- 삼항식과 비교 
			<c:out value="${i==pageMaker.cri.currPage ? 'class=active' : ''}"/>
			-->
		</c:forEach>
	
	<!-- 3) Next > , Last >> : enabled 여부 -->
		<c:if test="${pageMaker.next && pageMaker.ePageNo>0}">
			<a href="genrelist${pageMaker.makeQuery(pageMaker.ePageNo+1)}&genre=${musicGenre}">&nbsp;&nbsp;&#8640;</a>&nbsp; <!-- Next -->
			<a href="genrelist${pageMaker.makeQuery(pageMaker.lastPageNo)}&genre=${musicGenre}">&#8667;</a>&nbsp;&nbsp; <!-- Last -->
			
		</c:if>
	</div>
</body>
</html>