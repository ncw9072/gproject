<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
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
	<button id="nextmusic" value="${vs}">다음곡 ></button>
	<br>
</body>
</html>