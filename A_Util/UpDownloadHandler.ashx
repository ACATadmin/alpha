<%@ WebHandler Language="C#" Class="UpDownloadHandler" %>

using System;
using System.Web;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Script.Serialization;
using System.Web.SessionState;
using System.Text;
using System.IO;
using System.Data.SqlClient;
using LS.Common;
using System.Data;

public class UpDownloadHandler : IHttpHandler, IRequiresSessionState
{
    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/plain";
        //context.Response.ContentEncoding = System.Text.Encoding.UTF8;

        //context.Response.ContentType = "text/plain";
        context.Response.Expires = -1;


        //通过传来的参数判断执行哪个方法
        if (context.Request["GetFunction"].Equals("UploadFile", StringComparison.InvariantCultureIgnoreCase))
            UploadFile(context);
        if (context.Request["GetFunction"].Equals("DownloadFile", StringComparison.InvariantCultureIgnoreCase))
            DownloadFile(context);
        if (context.Request["GetFunction"].Equals("DeleteDocument", StringComparison.InvariantCultureIgnoreCase))
            DeleteDocument(context);
        if (context.Request["GetFunction"].Equals("GetFileList", StringComparison.InvariantCultureIgnoreCase))
            GetFileList(context);
    }

    
    public bool IsReusable
    {
        get
        {
            return false;
        }
    }
    //上传文件
    private void UploadFile(HttpContext context)
    {
        HttpPostedFile file = context.Request.Files["Filedata"];

        UploadDocumentItem objUploadDocumentItem = new UploadDocumentItem();
        objUploadDocumentItem.DocName = file.FileName;
        string sExtension = file.FileName.Substring(file.FileName.LastIndexOf('.'));
        //objUploadDocumentItem.DocMuid = DateTime.Now.ToString("yyyyMMddhhmmsfff") + sExtension;//生成一个新的MUID，保证文件名称的唯一性
        objUploadDocumentItem.DocMuid = file.FileName;

        objUploadDocumentItem.UploadDate = DateTime.Now.ToShortDateString();

        /*在此通常需要配合数据库使用，把文件名和格式记录下来，在DEMO中我就不配合这个使用了，直接上传*/
        string uploadPath = HttpContext.Current.Server.MapPath(@"/A_UpLoad/upload_file") + "\\";
        if (context.Request["type"] == "mv")
        {
            uploadPath = HttpContext.Current.Server.MapPath(@"/A_UpLoad/upload_file/ProMv") + "\\";
        }
        //string uploadPath = HttpContext.Current.Server.MapPath("/"+context.Request["folder"] + "\\");
        if (file != null)
        {
            //如果没有该目录则创建该上传目录
            if (!Directory.Exists(uploadPath))
            {
                Directory.CreateDirectory(uploadPath);
            }

            file.SaveAs(uploadPath + objUploadDocumentItem.DocMuid);

            context.Response.Write(new JavaScriptSerializer().Serialize(objUploadDocumentItem));
        }
    }
    //下载文件
    private void DownloadFile(HttpContext context)
    {
        UploadDocumentItem objUploadDocumentItem = new UploadDocumentItem();
        if (!string.IsNullOrEmpty(context.Request["DocMuid"]))
        {
            /*客户端保存的文件名,我写这个DEMO的时候没有数据库，所以下载文件名我就固定为'DEMO'
            使用这DEMO的朋友可以配合数据库，读出上传时写入数据库的文件名字和格式*/
            string fileName = context.Request["DocMuid"];
            string filePath = HttpContext.Current.Server.MapPath(@"/A_UpLoad/upload_file/" + context.Request["DocMuid"]);

            //以字符流的形式下载文件
            FileStream fs = new FileStream(filePath, FileMode.Open);
            byte[] bytes = new byte[(int)fs.Length];
            fs.Read(bytes, 0, bytes.Length);
            fs.Close();
            context.Response.Clear();
            context.Response.ContentType = "application/octet-stream";
            //通知浏览器下载文件而不是打开
            context.Response.AddHeader("Content-Disposition", "attachment;   filename=" + HttpUtility.UrlEncode(fileName, System.Text.Encoding.UTF8));
            context.Response.BinaryWrite(bytes);
            context.Response.Flush();
            context.Response.End();
        }
    }

    //删除文件
    private void DeleteDocument(HttpContext context)
    {

        string filePath = HttpContext.Current.Server.MapPath(@"/web/A_UpLoad/upload_file/" + context.Request["DocMuid"]);
        System.IO.FileInfo file = new System.IO.FileInfo(filePath);
        if (file.Exists)
        {
            file.Delete();
        }
        if (!string.IsNullOrEmpty(context.Request["DocMuid"]))
        {
            context.Response.Write(new JavaScriptSerializer().Serialize("Success"));
        }
    }



    private void GetFileList(HttpContext context)
    {
        DBClass DBClass = new DBClass();
        string tb = context.Request.QueryString["tb"];
        string Id = context.Request.QueryString["Id"];
        string return_str = "";
        string json = "";
        DataTable dt = DBClass.Re_dt("select * from " + tb + " where id=" + Id + " order by orderid asc");
        if (dt.Rows.Count > 0)
        {
            if (dt.Rows[0]["up_fileName"].ToString() != "" && dt.Rows[0]["up_fileName"].ToString() != null)
            {
                if (dt.Rows[0]["up_fileName"].ToString().IndexOf(",") > 0)
                {
                    string[] str = dt.Rows[0]["up_fileName"].ToString().Split(',');
                    for (int i = 0; i < str.Length; i++)
                    {
                        return_str = return_str + "<div id=\"WU_FILE_"+i+"\" class=\"item\"><h4 class=\"info\">" + dt.Rows[i]["up_fileName"] + "&nbsp;&nbsp;&nbsp;";
                        return_str = return_str + "<input type=\"button\" id=\"deleteFile\"  onclick=\"deletefile('" + dt.Rows[i]["up_fileName"] + "1)\" name=\"deleteFile\" value=\"删除\" /></h4><p class=\"state\"></p><div class=\"progress progress-striped active\" style=\"display: none;\">";
                        return_str = return_str + "<div class=\"progress-bar\" role=\"progressbar\" style=\"width: 100%;\"></div></div></div>";
                    }
                }
                else
                {
                    return_str = return_str + "<div id=\"WU_FILE_0\" class=\"item\"><h4 class=\"info\">" + dt.Rows[0]["up_fileName"] + "";
                    return_str = return_str + "<input type=\"button\" id=\"deleteFile\" onclick=\"deletefile('" + dt.Rows[0]["up_fileName"] + "')\" value=\"删除\" /></h4><p class=\"state\"></p><div class=\"progress progress-striped active\" style=\"display: none;\">";
                    return_str = return_str + "<div class=\"progress-bar\" role=\"progressbar\" style=\"width: 100%;\"></div></div></div>";
                }
            }
            else
            {
                return_str = ""; //获取失败
            }
        }
        else
        {
            return_str = ""; //获取失败
        }
        context.Response.Write(return_str); //成功
    }

    public class UploadDocumentItem
    {
        public UploadDocumentItem()
        { }
        public string DocMuid { get; set; }
        public string DocName { get; set; }
        public string UploadDate { get; set; }
    }

}