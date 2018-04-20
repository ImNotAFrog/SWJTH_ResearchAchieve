/*
* @Author: MaiBenBen
* @Date:   2018-02-13 17:07:07
* @Last Modified by:   MaiBenBen
* @Last Modified time: 2018-02-16 17:41:44
*/
window.onload = function(){
	var userIcon = document.getElementsByClassName("portrait-wrap")[0],
		userCenter = document.getElementsByClassName("user-center")[0],
		oUserInfo = document.getElementsByClassName("user-info")[0],
		oFormHead	= document.getElementsByClassName("form-head")[0],
		oEdit		= oFormHead.getElementsByTagName("span")[1],
		oUpdateBtn  = oUserInfo.getElementsByClassName("update-btn")[0],
		oEditInput  = oUserInfo.getElementsByTagName("p"),
		aInput		= oUpdateBtn.getElementsByTagName("input"),
		wait   = null,
		exchang = [];
		for (var i = 0; i < oEditInput.length; i++) {
			var waitinput = oEditInput[i].getElementsByTagName("input")[0];
			exchang.push(waitinput);
		}
		for (var i = 0; i < exchang.length; i++) {
			exchang[i].setAttribute("readonly","readonly");
		}

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

	/*编辑表单的事件*/
	oEdit.onclick = function(){
		oUpdateBtn.style.display = "block";
		for (var i = 0; i < exchang.length; i++) {
			exchang[i].removeAttribute("readonly","readonly");
		}
		return false;
	}
	/*提交表单*/
	aInput[0].onclick = function(){
		oUpdateBtn.style.display = "none";
	}
	/*取消编辑*/
	aInput[1].onclick = function(){
		oUpdateBtn.style.display = "none";
	}

};