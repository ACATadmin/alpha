<%@ page language="C#" autoeventwireup="true" inherits="web_master_test, afm_new" enableviewstate="false" enableviewstatemac="false" enableEventValidation="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">  
<html xmlns="http://www.w3.org/1999/xhtml" id="mainWindow">  
<head>  
    <title>无标题页</title>  
    <script language="javascript" type="text/javascript">
        function SetPorgressBar(pos) {
            //设置进度条居中  
            var screenHeight = document.body.offsetHeight;
            var screenWidth = document.body.offsetWidth;
            document.getElementById("ProgressBarSide").style.width = Math.round(screenWidth / 2);
            document.getElementById("ProgressBarSide").style.left = Math.round(screenWidth / 4);
            document.getElementById("ProgressBarSide").style.top = Math.round(screenHeight / 2);
            document.getElementById("ProgressBarSide").style.height = "21px";
            document.getElementById("ProgressBarSide").style.display = "";

            //设置进度条百分比                         
            document.getElementById("ProgressBar").style.width = pos + "%";
            document.getElementById("ProgressText").innerHTML = pos + "%";
        }

        //完成后隐藏进度条  
        function SetCompleted() {
            document.getElementById("ProgressBarSide").style.display = "none";
        }  
     </script>    
</head>  
    <body>  
    <div id="ProgressBarSide" style="position:absolute;height:21px;width:100px;color:Silver;border-width:1px;border-style:Solid;display:none">  
        <div id="ProgressBar" style="position:absolute;height:21px;width:0%;background-color: green"></div>  
        <div id="ProgressText" style="position:absolute;height:21px;width:100%;text-align:center"></div>  
    </div>  
    </body>  
</html>  