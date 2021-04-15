/**
 * 
 */
$(function(){ //ready로 감싸야 id식별 가능
		$.ajax({ // nav topmenu
				type:'Get',
				url: 'genrelist',
				data : {
					genre : 'rock'
				},
				success:function(resultPage){
					$('#sec1_1').html('');
					$('#sec1_1').html(resultPage);
					},
				error:function(){
					$('sec1_1').html("~~ 오류발생 ~~");
				}
			});//ajax
	
});//ready


