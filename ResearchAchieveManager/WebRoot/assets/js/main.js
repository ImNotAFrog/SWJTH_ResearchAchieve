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



//科研成果 详细信息展示, 点击表格中每一行，获取详细信息，然后用一个div  detail里展示
//然后让detail 从右边往左 滑动fadeIn
/*
 $(".re-item").addClass("hide");

 $("table tr").click(function() {

        // var row = $(this).parent().index() + 1; // 行位置

        // var col = $(this).index() + 1; // 列位置

        // alert("当前位置：第"+row+"行，第"+col+"列")
        $("#journal").removeClass("hide").addClass("active");

        //1. 获取当前 行的  项目类型和项目名字， 可以用 nth-chlid:()

           var projectName = $(this).children().eq("0").html();
        //2. 创建ajax请求，根据 名字得到 项目详细信息的json数据
                    $.getJSON('http://api.flickr.com/services/feeds/photos_public.gne?tags=cat&tagmode=any&format=json&jsoncallback=?',function(data){ 
                alert(data);
            }); 
        //3. 根据不同的项目类型，右边显示不同的form模板

        //4. 回填数据到表单的value

        //5. 右边的detail div 滑动进来

    });
*/
//jquery upload file 部分
$(function () {
    'use strict';

    // Initialize the jQuery File Upload widget:
    $('#fileupload').fileupload();

    // Enable iframe cross-domain access via redirect option:
    $('#fileupload').fileupload(
        'option',
        'redirect',
        window.location.href.replace(
            /\/[^\/]*$/,
            '/cors/result.html?%s'
        )
    );

    if (window.location.hostname === 'localhost:8089') {
        // Demo settings:
        $('#fileupload').fileupload('option', {
            url: '//localhost:8089/jQuery-File-Upload-Java/imgs/',
            maxFileSize: 5000000,
            acceptFileTypes: /(\.|\/)(gif|jpe?g|png)$/i,
            process: [
                {
                    action: 'load',
                    fileTypes: /^image\/(gif|jpeg|png)$/,
                    maxFileSize: 20000000 // 20MB
                },
                {
                    action: 'resize',
                    maxWidth: 1440,
                    maxHeight: 900
                },
                {
                    action: 'save'
                }
            ]
        });
        // Upload server status check for browsers with CORS support:
        if ($.support.cors) {
            $.ajax({
                url: '//localhost:8089/jQuery-File-Upload-Java/imgs/',
                type: 'HEAD'
            }).fail(function () {
                $('<span class="alert alert-error"/>')
                    .text('Upload server currently unavailable - ' +
                            new Date())
                    .appendTo('#fileupload');
            });
        }
    } else {
        // Load existing files:
        $('#fileupload').each(function () {
            var that = this;
            $.getJSON(this.action, function (result) {
                if (result && result.length) {
                    $(that).fileupload('option', 'done')
                        .call(that, null, {result: result});
                }
            });
        });
    }

});
