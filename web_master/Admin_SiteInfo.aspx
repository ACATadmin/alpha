<%@ page language="C#" autoeventwireup="true" inherits="web_master_Admin_SiteInfo, afm_new" debug="true" enableviewstate="false" enableviewstatemac="false" enableEventValidation="false" %>
<%@ Register TagPrefix="LS" TagName="Inc" Src="Inc.ascx" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link rel="stylesheet" href="css/zTreeStyle.css" type="text/css" />
    <title>网站后台管理系统</title>
    <LS:Inc ID="Inc2" runat="server" />
    <script type="text/javascript" src="js/jquery.ztree.core.min.js"></script>
<script type="text/javascript">
    var setting = {
        async: {
            enable: true,
            url: "ztreeJson.ashx?MenuId=<%=LS.Common.Function.GetRequest("MenuId") %>",
            autoParam: ["id"],
            type: "get"
        },
        callback: {
            beforeExpand: beforeExpand,
            beforeAsync: beforeAsync,
            onAsyncSuccess: onAsyncSuccess,
            onAsyncError: onAsyncError,
            onClick: onClick
        }
    };

    var curExpandNode = null;
    function beforeExpand(treeId, treeNode) {
        var pNode = curExpandNode ? curExpandNode.getParentNode() : null;
        var treeNodeP = treeNode.parentTId ? treeNode.getParentNode() : null;
        var zTree = $.fn.zTree.getZTreeObj("tree");
        for (var i = 0, l = !treeNodeP ? 0 : treeNodeP.children.length; i < l; i++) {
            if (treeNode !== treeNodeP.children[i]) {
                zTree.expandNode(treeNodeP.children[i], false);
            }
        }
        while (pNode) {
            if (pNode === treeNode) {
                break;
            }
            pNode = pNode.getParentNode();
        }
        if (!pNode) {
            singlePath(treeNode);
        }
    }
    function singlePath(newNode) {
        if (newNode === curExpandNode) return;
        if (curExpandNode && curExpandNode.open == true) {
            var zTree = $.fn.zTree.getZTreeObj("tree");
            if (newNode.parentTId === curExpandNode.parentTId) {
                zTree.expandNode(curExpandNode, false);
            } else {
                var newParents = [];
                while (newNode) {
                    newNode = newNode.getParentNode();
                    if (newNode === curExpandNode) {
                        newParents = null;
                        break;
                    } else if (newNode) {
                        newParents.push(newNode);
                    }
                }
                if (newParents != null) {
                    var oldNode = curExpandNode;
                    var oldParents = [];
                    while (oldNode) {
                        oldNode = oldNode.getParentNode();
                        if (oldNode) {
                            oldParents.push(oldNode);
                        }
                    }
                    if (newParents.length > 0) {
                        for (var i = Math.min(newParents.length, oldParents.length) - 1; i >= 0; i--) {
                            if (newParents[i] !== oldParents[i]) {
                                zTree.expandNode(oldParents[i], false);
                                break;
                            }
                        }
                    } else {
                        zTree.expandNode(oldParents[oldParents.length - 1], false);
                    }
                }
            }
        }
        curExpandNode = newNode;
    }

    function filter(treeId, parentNode, childNodes) {
        if (!childNodes) return null;
        for (var i = 0, l = childNodes.length; i < l; i++) {
            childNodes[i].name = childNodes[i].name.replace(/\.n/g, '.');
        }
        return childNodes;
    }

    function beforeAsync() {
        curAsyncCount++;
    }

    function onAsyncSuccess(event, treeId, treeNode, msg) {
        curAsyncCount--;
        if (curStatus == "expand") {
            expandNodes(treeNode.children);
        } else if (curStatus == "async") {
            asyncNodes(treeNode.children);
        }

        if (curAsyncCount <= 0) {
            if (curStatus != "init" && curStatus != "") {
                asyncForAll = true;
            }
            curStatus = "";
        }

    }

    function onAsyncError(event, treeId, treeNode, XMLHttpRequest, textStatus, errorThrown) {
        curAsyncCount--;

        if (curAsyncCount <= 0) {
            curStatus = "";
            if (treeNode != null) asyncForAll = true;
        }
    }

    var curStatus = "init", curAsyncCount = 0, asyncForAll = false,
		goAsync = false;
    function expandAll() {
        if (!check()) {
            return;
        }
        var zTree = $.fn.zTree.getZTreeObj("tree");
        if (asyncForAll) {
            zTree.expandAll(true);
        } else {
            expandNodes(zTree.getNodes());
            if (!goAsync) {
                curStatus = "";
            }
        }
    }
    function expandNodes(nodes) {
        if (!nodes) return;
        curStatus = "expand";
        var zTree = $.fn.zTree.getZTreeObj("tree");
        for (var i = 0, l = nodes.length; i < l; i++) {
            zTree.expandNode(nodes[i], true, false, false);
            if (nodes[i].isParent && nodes[i].zAsync) {
                expandNodes(nodes[i].children);
            } else {
                goAsync = true;
            }
        }
    }

    function asyncAll() {
        if (!check()) {
            return;
        }
        var zTree = $.fn.zTree.getZTreeObj("tree");
        if (asyncForAll) {
        } else {
            asyncNodes(zTree.getNodes());
            if (!goAsync) {
                curStatus = "";
            }
        }
    }
    function asyncNodes(nodes) {
        if (!nodes) return;
        curStatus = "async";
        var zTree = $.fn.zTree.getZTreeObj("tree");
        for (var i = 0, l = nodes.length; i < l; i++) {
            if (nodes[i].isParent && nodes[i].zAsync) {
                asyncNodes(nodes[i].children);
            } else {
                goAsync = true;
                zTree.reAsyncChildNodes(nodes[i], "refresh", true);
            }
        }
    }

    function reset() {
        if (!check()) {
            return;
        }
        asyncForAll = false;
        goAsync = false;
        $.fn.zTree.init($("#tree"), setting);
    }

    function check() {
        if (curAsyncCount > 0) {
            return false;
        }
        return true;
    }

    var curExpandNode = null;
    function onClick(e, treeId, treeNode) {

        var zTree = $.fn.zTree.getZTreeObj("tree");
        zTree.expandNode(treeNode, true, null, null, true); //第一个true 表示点当前展开，再次点击收缩 默认：null
    }

    $(document).ready(function () {
        $.fn.zTree.init($("#tree"), setting);
    });
    //-->
	</SCRIPT>

</head>
<body style="margin: 0px" scroll="no">
    <form id="form1" runat="server">
<table cellpadding="0" cellspacing="0" width="100%" height="100%">
  <tr>
    <td valign="top" id="tree" class="ztree"></td>
    <td valign="top" width="100%">
	<iframe src="Admin_ServerInfo.aspx?MenuID=Right" id="menu_info" name="menu_info" onload="" width="100%" height="100%" frameborder="0" scrolling="yes" style="overflow: visible;display:"></iframe>
	</td>
  </tr>
</table>


    </form>
</body>
</html>