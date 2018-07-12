<%@ control language="C#" autoeventwireup="true" inherits="web_master_uploadFile, afm_new" enableviewstate="false" %>
<link href="../A_Util/webuploader/webuploader.css" rel="stylesheet" />
<script type="text/javascript" src="../A_Util/webuploader/webuploader.min.js"></script>
<script src="../A_Util/jquery.min.js" type="text/javascript"></script>
<script type="text/javascript">
     jQuery(function () {
         var $ = jQuery,
                 $list = $('#fileList'),
                 state = 'pending',
                 uploader;
         uploader = WebUploader.create({
             resize: false, //不压缩image
             auto: true, //自动上传
             accept: { extensions: "doc,docx,xls,xlsx,pdf,zip,rar,gz" },
             swf: '../A_Util/webuploader/Uploader.swf',
             server: 'upload_json.ashx?act=upload_file',

             // 内部根据当前运行是创建，可能是input元素，也可能是flash.
             pick: {
                 id: '#picker',
                 //只能选择一个文件上传
                 multiple: false
             },
             fileSingleSizeLimit: 1000 * 1024 * 1024,   //设定单个文件大小
             //限制只能上传一个文件
             fileNumLimit: 1

         });


         // 当有文件添加进来的时候
         uploader.on('fileQueued', function (file) {
             $list.append('<div id="' + file.id + '" class="item"><div class="cancel"><a href=\"javascript:;\"></a></div>' +
                     '<span class="info">' + file.name + '</span><input type="hidden" value=' + file.source.up_name + ' id="up_fileName' + file.id + '" name="up_fileName"><input type="hidden" value="' + file.name + '" id="fileName' + file.id + '" name="fileName">&nbsp;' +
                     '<span class="state">等待上传...</span>' +
                 '</div>');
                 if ("<%=Action%>" == "EditInfo") {
                 $("#" + file.id + " .cancel").on('click', function () {
                 delfile($("#up_fileName" + file.id).val());
                 $('#' + file.id).remove();
                 uploader.cancelFile(file);
             });
                   }
         });

         uploader.on('uploadBeforeSend', function (file) {

             //alert(uploader.getFiles().length);
         });

         // 文件上传过程中创建进度条实时显示。
         uploader.on('uploadProgress', function (file, percentage) {

             var $li = $('#' + file.id),
                     $percent = $li.find('.progress .progress-bar');
             // 避免重复创建
             if (!$percent.length) {
                 $percent = $('<div class="progress progress-striped active">' +
                       '<div class="progress-bar" role="progressbar" style="width: 0%">' +
                       '</div>' +
                     '</div>').appendTo($li).find('.progress-bar');
             }
             $li.find('span.state').text('- 上传进度:' + parseInt(percentage * 100) + '%');
             $percent.css('width', percentage * 100 + '%');

         });

         uploader.on('uploadSuccess', function (file, data) {
             $('#title').val(file.name.replace(data.ext, "")); //by ls7080
             $('#up_fileName' + file.id).val(data.fileName); //by ls7080
             if ("<%=Action%>" != "EditInfo") {
                 $("#" + file.id+" .cancel").on('click', function () {
                 $('#' + file.id).remove();
                 uploader.cancelFile(file);
                 delfile(data.fileName);
             })
             }
             $('#' + file.id).find('span.state').text('- 已上传');
         });

         uploader.on('uploadError', function (file) {
             $('#' + file.id).find('span.state').text('- 上传出错');
         });

         uploader.on('uploadComplete', function (file) {
           $('#' + file.id).find('.progress').fadeOut(); 
         });

         uploader.on('all', function (type) {
             if (type === 'startUpload') {
                 state = 'uploading';
             } else if (type === 'stopUpload') {
                 state = 'paused';
             } else if (type === 'uploadFinished') {
                 state = 'done';
             }

         });

         //当validate不通过时，会以派送错误事件的形式通知
         uploader.on('error', function (type) {
             switch (type) {
                 case 'Q_EXCEED_NUM_LIMIT':
                     alert("错误：上传文件数量过多！");
                     break;
                 case 'Q_EXCEED_SIZE_LIMIT':
                     alert("错误：文件总大小超出限制！");
                     break;
                 case 'F_EXCEED_SIZE':
                     alert("错误：文件大小超出限制！");
                     break;
                 case 'Q_TYPE_DENIED':
                     alert("错误：禁止上传该类型文件！");
                     break;
                 case 'F_DUPLICATE':
                     alert("错误：请勿重复上传该文件！");
                     break;
                 default:
                     alert('错误代码：' + type);
                     break;
             }
         });


         if ("<%=Action%>" == "EditInfo") {
                     $.ajax({
                     url:"upload_json.ashx?act=get_filelist&id=<%=LS.Common.Function.GetRequest("id") %>",
                     dataType:"json",
                     type:"post",
                     success:function(data)
                     {
                         for(var i=0;i<data.info.length;i++)
                         {
                            //debugger;
                            var obj ={};
                            obj.name = data.info[i].fileName;
                            obj.size = data.info[i].fileSize;
                            obj.type = data.info[i].fileType;
                            obj.up_name = data.info[i].up_fileName;
                            obj.id = data.info[i].id;
                            var file = new WebUploader.File(obj);
                   
                            //此处是关键，将文件状态改为'已上传完成'
                            file.setStatus('complete');
                            uploader.addFiles(file);//添加队列
                            $('#' + file.id).find('span.state').text('- 已上传');
                        }
                     }
               });
         }

     });

     function delfile(up_fileName) {
         $.get("upload_json.ashx?act=delete_file&up_fileName=" + up_fileName + "", function (Data) {});
     }

    </script>