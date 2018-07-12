var setting = {
	view: {
		dblClickExpand: false
	},
	data: {
		simpleData: {
			enable: true
		}
	},
	callback: {
		beforeExpand: beforeExpand,
		onExpand: onExpand,
		onClick: onClick
	}

};

$str

var curExpandNode = null;
function beforeExpand(treeId, treeNode) {
	var pNode = curExpandNode ? curExpandNode.getParentNode():null;
	var treeNodeP = treeNode.parentTId ? treeNode.getParentNode():null;
	var zTree = $.fn.zTree.getZTreeObj("tree");
	for(var i=0, l=!treeNodeP ? 0:treeNodeP.children.length; i<l; i++ ) {
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
	if (curExpandNode && curExpandNode.open==true) {
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
			if (newParents!=null) {
				var oldNode = curExpandNode;
				var oldParents = [];
				while (oldNode) {
					oldNode = oldNode.getParentNode();
					if (oldNode) {
						oldParents.push(oldNode);
					}
				}
				if (newParents.length>0) {
					for (var i = Math.min(newParents.length, oldParents.length)-1; i>=0; i--) {
						if (newParents[i] !== oldParents[i]) {
							zTree.expandNode(oldParents[i], false);
							break;
						}
					}
				} else {
					zTree.expandNode(oldParents[oldParents.length-1], false);
				}
			}
		}
	}
	curExpandNode = newNode;
}

function onExpand(event, treeId, treeNode) {
	curExpandNode = treeNode;
}

function onClick(e,treeId, treeNode) {
	var zTree = $.fn.zTree.getZTreeObj("tree");
	zTree.expandNode(treeNode, true, null, null, true); //第一个true 表示点当前展开，再次点击收缩 默认：null
}
		
$(function(){
	$.fn.zTree.init($(".ztree"), setting, zNodes);
});