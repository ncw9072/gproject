/**
 * 
 */
$(function(){
	var userPickGenre1= $('#loginsuccess').attr('value1');
	/*var userPickGenre2= $('#loginsuccess').attr('value2')*/
	$.ajax({ // nav topmenu
			type:'Get',
			url:'genrelist',
			data: {
				genre : userPickGenre1,
				pagingCode : 'section1_1'
			},
			success:function(resultPage){
				$('#sec1_1').html('');
				$('#sec1_1').html(resultPage);
				/*alert(userPickGenre1);
				alert(userPickGenre2);*/
				},
			error:function(){
				$('#sec1_1').html("~~ 오류발생 ~~");
			}
	});//ajax
	$.ajax({ // nav topmenu
			type:'Get',
			url:'releasedateList',
			success:function(resultPage){
				$('#sec1_2').html('');
				$('#sec1_2').html(resultPage);
				/*alert(userPickGenre1);
				alert(userPickGenre2);*/
				},
			error:function(){
				$('#sec1_2').html("~~ 오류발생 ~~");
			}
	});//ajax
	
});//ready