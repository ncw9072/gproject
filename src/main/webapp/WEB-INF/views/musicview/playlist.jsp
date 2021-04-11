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
		
		var nowmusic = $(this).attr('id');
		var musicsnum = $(this).val();
		$.ajax({
			type :'Get',
			url : 'playlist',
			data : {
				snum : $(this).val(),
				acode : "A",
				vs : nowmusic
			},
			/* success:function(resultPage){
				$('#audioajax').html(resultPage);
			}, */
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
	$("#nextmusic").click(function(){     			//버튼을 클릭했을때 (선태갛ㄴ 리스트에 있는 버튼)
	 	var a1= parseInt($(this).val()) + 1 ;
		var snumvalue= $("'#"+a1+"'").attr('id');
		$.ajax({
			type :'Get',
			url : 'playlist',
			data : {
				snum : snumvalue,
				acode : "A",
				vs : nowmusic
			},
			success:function(resultPage){
				$('#audioajax').html(resultPage);
			},
			error: function() {
				$('#play').html("~~ JsonView 오류 ~~");
			} 
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

	<span id="audioajax">
	${Apple.sname}
	<br>
	${Apple.singername}
	<br>
	<img src="${Apple.image}" width="200" height="200" />
	<br>
	<audio id="audio" controls="controls" autoplay="autoplay">
		<source id="play" src="${Apple.downloadfile}" type="audio/mp3">
	</audio>
	<br>
		<textarea rows="40" cols="20">${Apple.lyrics}</textarea>
	<br>
				<%-- <iframe src="${Apple.downloadfile}" allow="autoplay" id="audio"></iframe> --%>
	<br>
	<button id="nextmusic" value="1">다음곡 ></button><br>
	</span>
	<c:forEach begin="0" varStatus="vs" end="${Banana.size()-1}" step="1" items="${Banana}" var="b">
						<button id="${vs.count}" class="musicselect" value="${b.snum}">${b.sname}</button>
						<br> <!-- 스크립트에서 뒷버튼클릭시 vs.count 이라는 ID+1의 -->
	</c:forEach>
</body>
</html>
