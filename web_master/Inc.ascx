<%@ control language="C#" autoeventwireup="true" inherits="web_master_Inc, afm_new" enableviewstate="false" %>
<script src="../lay/layui.js" type="text/javascript"></script>
<link rel="stylesheet" href="../lay/css/layui.css" media="all" />
<link media="all" type="text/css" href="css/admin_css.css" rel="stylesheet" />
<link media="all" type="text/css" href="../A_Util/page.css" rel="stylesheet" />
<script language="javascript" type="text/javascript" src="../A_Util/select.js"></script>
<script language="javascript" type="text/javascript" src="../A_Util/jquery.min.js"></script>
<script type="text/javascript">
//<![CDATA[
    $(function () {
        var x = 10;
        var y = 20;
        $(".tooltip").mouseover(function (e) {
            var tooltip = "<div id='tooltip' style='position:absolute;display:none;border:1px solid #ccc;'><img src='" + this.src + "' width='150' alt='预览图'/><\/div>"; //创建 div 元素
            $("body").append(tooltip); //把它追加到文档中						 
            $("#tooltip")
			.css({
			    "top": (e.pageY + y) + "px",
			    "left": (e.pageX + x) + "px"
			}).show("fast");   //设置x坐标和y坐标，并且显示
        }).mouseout(function () {
            $("#tooltip").remove();  //移除 
        }).mousemove(function (e) {
            $("#tooltip")
			.css({
			    "top": (e.pageY + y) + "px",
			    "left": (e.pageX + x) + "px"
			});
        });
    })
//隐藏函数
function IsYes(id, action, tb) {
    var obj = $("#" + action + "" + id)
    $.ajax({
        url: "Ajax.ashx?action=" + action + "&tb=" + tb + "&id=" + id,
        cache: false,
        success: function (html) {
            obj.attr("src", html);
        }
    });
}

//排序提交处理
function UpdateOrder(id, action, tb, val) {
    $("#td22" + id).show();
    $("#td11" + id).hide();
    $("#td22" + id + " .orderidVal").html('<img src=\"images/load_small.gif\" width=\"10\" height=\"10\" />');
    $.ajax({
        url: "Ajax.ashx?action=" + action + "&tb=" + tb + "&val=" + val + "&id=" + id,
        cache: false,
        success: function (html) {
            $("#td22" + id + " .orderidVal").html(html);
            $("#td11" + id).hide();
            $("#td22" + id).show();
        }
    });
}
function isurl(v) {
    if (v == "0") {
        $("#ClassURL_tr").show();
    } else if (v == "1") {
        $("#ClassURL_tr").hide();
    }
}

function CheckAll(form) {
    for (var i = 0; i < form.id.length; i++) {
        var e = form.id[i];
        if (e.name != 'chkall')
            e.checked = form.chkall.checked;
        form.submitid.disabled = (form.id.value = false);

    }
}
function delImg(p_url) {
    $("#" + p_url).val("");
    $("#" + p_url + "_url").attr("src", "images/nophoto.gif");
}
</script>
<script type="text/javascript" src="js/jquery.validator.pack.js"></script>
<link  href="css/form_validate.css" rel="stylesheet" type="text/css" />
