// alert("hello");
var nav= document.getElementsByClassName("left")[0];
var navItem = nav.getElementsByTagName("li");
// alert(navItem.length);

//右边的内容区
var con = document.getElementsByClassName("content-item");

//点击左边的选项，右边内容切换

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

	}
}