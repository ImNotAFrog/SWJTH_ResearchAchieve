// alert("hello");
var nav= document.getElementsByClassName("left")[0];
var navItem = nav.getElementsByTagName("li");

//鍙宠竟鐨勫唴瀹瑰尯
var con = document.getElementsByClassName("content-item");

//鐐瑰嚮宸﹁竟鐨勯�椤癸紝鍙宠竟鍐呭鍒囨崲

for(var i=0; i<con.length; i++)
{
	con[i].style.display ="none";
}
con[0].style.display="block";
for(var i=0; i<navItem.length;i++)
{
	navItem[i].index = i;
	navItem[i].onclick=function(){
		
		for(var j=0; j<navItem.length; j++)
			con[j].style.display ="none";
		con[this.index].style.display ="block";
		for(var j=0; j<navItem.length; j++)
			navItem[j].firstElementChild.className= "";
		navItem[this.index].firstElementChild.className= "active";
	}
}