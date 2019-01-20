$(function(){
			
	var num = 1;
	
	$("[type='button'],a,button,[type='submit']").addClass("refreshThis");
	
	$("[type='button'],a,button,[type='submit']").click(function(){
		var ss = $(this).attr("disabled");
		
		if($(this).hasClass("refreshThis")){
			num = num+1;
			if(num>2){
				parent.layer.closeAll('dialog');
				parent.layer.msg("点击太快了,请五秒后再点击");
				$(this).attr("disabled",true);
				$(this).css("pointer-events","none");
				setTimeout(function(){
					num = num-2;
					$("[type='button'],a,button,[type='submit']").css("pointer-events","auto");
					$("[type='button'],a,button,[type='submit']").removeAttr("disabled");
				},4000)
			}
		}	

	});
});
		
		