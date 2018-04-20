window.onload = function(){
	var userIcon = document.getElementsByClassName("portrait-wrap")[0],
		userCenter = document.getElementsByClassName("user-center")[0],
		wait   = null;

	/*头像部分的事件*/
	userIcon.onmouseover = function(){
		userCenter.style.display = "block";
	}
	userIcon.onmouseout  = function(){
	 	wait = setTimeout(function(){
	 		userCenter.style.display = "none";
	 	},2000);
	}
	userCenter.onmouseover = function(){
	 	clearTimeout(wait);
	 	userCenter.style.display = "block";
	}
	userCenter.onmouseout  = function(){
	 	userCenter.style.display = "none";
	}


};