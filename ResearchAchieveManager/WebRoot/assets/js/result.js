/*
* @Author: MaiBenBen
* @Date:   2018-02-13 17:07:07
* @Last Modified by:   MaiBenBen
* @Last Modified time: 2018-02-16 17:41:44
*/
window.onload = function(){
	var userIcon = document.getElementsByClassName("portrait-wrap")[0],
		userCenter = document.getElementsByClassName("user-center")[0],
		resultType = document.getElementsByClassName("result-type")[0],
		oProject  = document.getElementsByClassName("project")[0],
		oThesis   = document.getElementsByClassName("thesis")[0],
		oTextbook = document.getElementsByClassName("textbook")[0],
		oPatent   = document.getElementsByClassName("patent")[0],
		oLaws     = document.getElementsByClassName("laws")[0],
		oUl        = resultType.getElementsByTagName("ul")[0],
		aLi        = oUl.getElementsByTagName("li"),
		Length   = aLi.length,
		collect = [oProject,oThesis,oTextbook,oPatent,oLaws],
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

	for (var i = 0; i <Length; i++) {
		aLi[i].index = i;

		aLi[i].onclick = function(){
			for (var i = 0; i < Length; i++) {
				aLi[i].getElementsByTagName("a")[0].className = "";
			}
			var send = this.getElementsByTagName("a")[0];
			addClass01(send,"selected");
			for (var i = 0; i < collect.length; i++) {
				collect[i].style.display = "none";
			}
			collect[this.index].style.display = "block";
			return false;
		}
		
	}

	function addClass01(element,value){
		element.className = value;
	}

	function init(){
		var a = aLi[0].getElementsByTagName("a")[0];
		addClass01(a,"selected");
	}
	init();


};