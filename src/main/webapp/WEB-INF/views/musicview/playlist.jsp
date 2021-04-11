<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="resources/myLib/jquery-3.2.1.min.js"></script>
<script>

$(function(){
	$(".musicselect").click(function(){
		var a1="1";
		var a2="3";
		console.log(parseInt(a1)+parseInt(a2));
		
		var music = $(this).attr('id');
		var musicsnum = $(this).val();
		$.ajax({
			type :'Get',
			url : 'playlist',
			data : {
				snum : $(this).val(),
				jsoncode :'A'
			},
			success:function(resultData){
				$('#play').attr("src",resultData.music);
				console.log($('#play').attr('src'));
				console.log(resultData.music);
				var audio = new Audio(resultData.music);
				audio.play($('#audio'));
				$('#audio').audio
			},
			error: function() {
				$('#play').html("~~ JsonView 오류 ~~");
			}
			
		});//ajax
	});//click
});//ready


</script>
<style>

tr {
	text-align: center;
}
</style>

</head>
<body>

	<div></div>

	<table >
		<tr>
			<td>${Apple.sname}</td>
		</tr>
		<tr>
			<td>${Apple.singername}</td>
		</tr>
		<tr>
			<td>
				<img src="${Apple.image}" width="200" height="200" />
			</td>
		</tr>
		<tr>
			<td>
				<audio id="audio" controls="controls" autoplay="autoplay">
					<source id="play" src="${Apple.downloadfile}" type="audio/mp3">
				</audio>
				<br>
				<textarea rows="10" cols="10">${Apple.lyrics}</textarea>
				<br>
					<button id="0" class="musicselect" value="${Apple.snum}">${Apple.sname}</button>
				<br>
					<c:forEach begin="1" varStatus="vs" end="${Banana.size()-1}" step="1" items="${Banana}" var="b">
						<button id="${vs.count}" class="musicselect" value="${b.snum}">${b.sname}</button>
						<br> <!-- 스크립트에서 뒷버튼클릭시 vs.count 이라는 ID+1의 -->
					</c:forEach>
			</td>
		</tr>
		<tr>
			<td>
				<%-- <iframe src="${Apple.downloadfile}" allow="autoplay" id="audio"></iframe> --%>
			</td>
		</tr>
	</table>

</body>
</html>
