/*
* @Author: MaiBenBen
* @Date:   2018-01-27 23:11:28
* @Last Modified by:   MaiBenBen
* @Last Modified time: 2018-02-13 18:09:29
*/
window.onload = function(){
	var oSlider 	= document.getElementsByClassName("slider")[0],
		navWrap		= document.getElementsByClassName("nav-wrap")[0],
		oLogin 		= document.getElementsByClassName("login")[0],
		oLogined    = document.getElementsByClassName("logined")[0],
		unLogin     = document.getElementsByClassName("unlogin")[0],
		userCenter  = oLogined.getElementsByClassName("user-center")[0],
		userIcon    = oLogined.getElementsByClassName("portrait")[0],
		oImg 		= document.getElementById("show"),
		IndexPage	= document.getElementById("index"),
		LoginPage  	= document.getElementById("loginpage"),
		NewsPage    = document.getElementById("newspage"),
		prev 		= document.getElementById("prev"),
		next 		= document.getElementById("next"),
		navLi       = navWrap.getElementsByTagName("li"),
		navLia1 	= navLi[0].getElementsByTagName("a")[0],
		navLia2 	= navLi[1].getElementsByTagName("a")[0]
		aLi 		= oSlider.getElementsByTagName("li"),
//		oSubmit 	= LoginPage.getElementsByTagName("input")[2],
//		oBtn 		= userCenter.getElementsByTagName("button")[0],
		arrImg 		= ["../assets/img/index/demo.png","../assets/img/index/demo1.png","../assets/img/index/demo2.png","../assets/img/index/demo3.png"],
		arrSelect 	= ["../assets/img/index/unselect.png","../assets/img/index/select.png"],
		timer		= null,
		wait		= null,
		a 			= 0,
		Length     	= aLi.length;
		 
	 	// 鏉烆喗鎸�
	 	function unSlider() {
	 		timer = setInterval(function(){
			 	if (a < 3) {
			 		a++;
			 		oImg.src = arrImg[a];
			 		
			 	}
			 	else{
			 		a = 0;
			 		oImg.src = arrImg[a];
			 	}
			 	showSelect();
			 },3000);
	 	}
		unSlider(); 

		 // 鏉烆喗鎸遍柅澶嬪閸撳秳绔村鐙呯礉閸氬簼绔村锟�		 
		prev.onclick = function(){
		 	if (a == 0) {
		 		a = Length - 1;
		 		oImg.src = arrImg[a];
		 	}
		 	else{
		 		a--;
		 		oImg.src = arrImg[a];
		 	}
		 	showSelect();
		 }

		 next.onclick = function(){
		 	if (a == Length - 1) {
		 		a = 0;
		 		oImg.src = arrImg[a];
		 	}
		 	else{
		 		a++;
		 		oImg.src = arrImg[a];
		 	}
		 	showSelect();
		 }
		

		 // 鐏忎浇顥栭惃鍕娑擃亪娈㈤崶鍓у閺�懓褰夐惃鍕櫏閺嬫粌娴�
		 function showSelect(){
		 	for (var i = 0; i < Length; i++) {
		 		var aImg = aLi[i].getElementsByTagName("img")[0];
	 			if (i == a) {
	 				aImg.src = arrSelect[1];
	 			}
	 			else{
	 				aImg.src = arrSelect[0];
	 			}
		 	}
		 }

		 // 閻ц缍嶉柈銊ュ瀻
//		 oLogin.onclick = function(){
//		 	IndexPage.style.display = "none";
//		 	NewsPage.style.display = "none";
//		 	LoginPage.style.display = "block";
//		 	return false;
//		 }

		 //閸ョ偛鍩屾＃鏍�
		 navLi[0].onclick = function(){
		 	clearInterval(timer);
		 }

		 // 閺備即妞堢挧鍕唵妞わ拷
		 navLi[1].onclick = function(){
		 	LoginPage.style.display 	= "none";
		 	IndexPage.style.display 	= "none";
		 	NewsPage.style.display 		= "block";
		 	navLia1.className 			= "";
		 	navLia2.className 			= "live";
		 	return false;
		 }
		 // 閹绘劒姘﹂惂璇茬秿鐞涖劌宕熸潻鍥ф倵
//		 oSubmit.onclick = function(){
//		 	unLogin.style.display 		= "none";
//		 	oLogined.style.display 		= "block";
//		 	LoginPage.style.display 	= "none";
//		 	NewsPage.style.display 		= "none";
//		 	IndexPage.style.display     = "block";
//		 	unSlider();
//		 	return false;
//
//		 }

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

		 /*闁拷鍤惂璇茬秿*/
//		 oBtn.onclick = function(){
//		 	unLogin.style.display 	= "block";
//		 	oLogined.style.display 	= "none";
//		 }

};