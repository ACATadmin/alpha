<%@ WebHandler Language="C#" Class="upload_json" %>

using System;
using System.Collections;
using System.Web;
using System.Data;
using System.IO;
using System.Globalization;
using LitJson;
using LS.Common;


public class upload_json : IHttpHandler {

    private HttpContext context;

    public string act = Function.GetRequest("act");
    
    public void ProcessRequest(HttpContext context)
    {
        Function.Check_AdminLogin();
        context.Response.ContentType = "text/plain";
        //context.Response.ContentEncoding = System.Text.Encoding.UTF8;
        context.Response.Expires = -1;


        switch (act)
        {
            case "upload_pic":
                Upload_Pic(context);//上传图片
                break;
            case "upload_file":
                Upload_File(context);//上传文件
                break;
            case "delete_file":
                Delete_File();
                break;
            case "get_filelist":
                GetFileList(context);
                break;    
        }
        



    }

    private void Delete_File()
    {
        string up_fileName = Function.GetRequest("up_fileName");
        
        if (up_fileName.Contains("."))
        {
            Function.FileDelete("../A_UpLoad/upload_file/" + up_fileName + "");
        }
        //HttpContext.Current.Response.End();
    }

    public bool IsReusable
    {
        get
        {
            return true;
        }
    }

    private void Upload_Pic(HttpContext context)
    {
        //定义允许上传的文件扩展名
        Hashtable extTable = new Hashtable();
        //extTable.Add("upload_video", "flv,mp4,avi,mpg,rmvb");
        extTable.Add("upload_pic", "jpg,png,gif,bmp,jpeg");
        //最大文件大小
        int maxSize = 100000000;
        
        String aspxUrl = context.Request.Path.Substring(0, context.Request.Path.LastIndexOf("/") + 1);//获取页面路径，暂时用不到
        HttpPostedFile file = context.Request.Files["file"];
        if (file != null)
        {
            string fileName = file.FileName;
            string sExtension = Path.GetExtension(fileName).ToLower();


            if (file.InputStream == null || file.InputStream.Length > maxSize)
            {
                context.Response.Write("{\"status\": 0, \"result\": \"上传文件大小超过限制\"}");
                context.Response.End();
            }

            if (string.IsNullOrWhiteSpace(sExtension) || Array.IndexOf(((String)extTable[act]).Split(','), sExtension.Substring(1).ToLower()) == -1)
            {
                context.Response.Write("{\"status\": 0, \"result\": \"上传文件扩展名是不允许的扩展名。只允许" + ((String)extTable[act]) + "格式\"}");
                context.Response.End();
            }


            string fileName_new = DateTime.Now.ToString("yyyyMMddHHmmss_ffff") + sExtension;
            string uploadPath = HttpContext.Current.Server.MapPath("../A_UpLoad/" + act + "/");

            //如果没有该目录则创建该上传目录
            if (!Directory.Exists(uploadPath))
            {
                Directory.CreateDirectory(uploadPath);
            }
            String ymd = DateTime.Now.ToString("yyyyMMdd", DateTimeFormatInfo.InvariantInfo);
            uploadPath += ymd + "/";

            if (!Directory.Exists(uploadPath))
            {
                Directory.CreateDirectory(uploadPath);
            }
            file.SaveAs(uploadPath + fileName_new);
            HttpContext.Current.Response.Write("{\"status\": 1, \"fileName\": \"" + ymd + "/" + fileName_new + "\", \"result\": \"上传成功\"}");
        }
    }

    //上传文件
    private void Upload_File(HttpContext context)
    {
        //定义允许上传的文件扩展名
        Hashtable extTable = new Hashtable();
        extTable.Add("upload_file", "doc,docx,xls,xlsx,pdf,zip,rar,gz");
        //最大文件大小
        int maxSize = 1000000000;

        String aspxUrl = context.Request.Path.Substring(0, context.Request.Path.LastIndexOf("/") + 1);//获取页面路径，暂时用不到
        HttpPostedFile file = context.Request.Files["file"];
        if (file != null)
        {
            string fileName = file.FileName;
            string sExtension = Path.GetExtension(fileName).ToLower();


            if (file.InputStream == null || file.InputStream.Length > maxSize)
            {
                context.Response.Write("{\"status\": 0, \"result\": \"上传文件大小超过限制\"}");
                context.Response.End();
            }

            if (string.IsNullOrWhiteSpace(sExtension) || Array.IndexOf(((String)extTable[act]).Split(','), sExtension.Substring(1).ToLower()) == -1)
            {
                context.Response.Write("{\"status\": 0, \"result\": \"上传文件扩展名是不允许的扩展名。只允许" + ((String)extTable[act]) + "格式\"}");
                context.Response.End();
            }


            string fileName_new = DateTime.Now.ToString("yyyyMMddHHmmss_ffff") + sExtension;
            string uploadPath = HttpContext.Current.Server.MapPath("../A_UpLoad/" + act + "/");

            //如果没有该目录则创建该上传目录
            if (!Directory.Exists(uploadPath))
            {
                Directory.CreateDirectory(uploadPath);
            }
            String ymd = DateTime.Now.ToString("yyyyMMdd", DateTimeFormatInfo.InvariantInfo);
            uploadPath += ymd + "/";

            if (!Directory.Exists(uploadPath))
            {
                Directory.CreateDirectory(uploadPath);
            }
            file.SaveAs(uploadPath + fileName_new);
            HttpContext.Current.Response.Write("{\"status\": 1, \"fileName\": \"" + ymd + "/" + fileName_new + "\", \"ext\": \"" + sExtension + "\", \"result\": \"上传成功\"}");
        }
    }

    /// <summary>
    /// 加载列表
    /// </summary>
    /// <param name="context"></param>
    private void GetFileList(HttpContext context)
    {
        DBClass DBClass = new DBClass();
        string tb = Function.GetRequest("tb");
        string Id = Function.GetRequest("Id");
        string json = "";
        DataTable dt = DBClass.Re_dt("select * from File_List where id=" + Id + "");
        if (dt.Rows.Count > 0)
        {
            if (!string.IsNullOrWhiteSpace(dt.Rows[0]["up_fileName"].ToString()))
            {
                string[] str = dt.Rows[0]["up_fileName"].ToString().Split(',');
                for (int i = 0; i < str.Length; i++)
                {
                    if (i == 0)
                    {
                        json = "{\"fileType\":\"" + dt.Rows[0]["fileType"].ToString().Split(',')[i] + "\",\"id\":\"" + dt.Rows[0]["id"] + "\",\"fileSize\":\"" + dt.Rows[0]["fileSize"].ToString().Split(',')[i] + "\",\"up_fileName\":\"" + dt.Rows[0]["up_fileName"].ToString().Split(',')[i] + "\",\"fileName\":\"" + dt.Rows[0]["fileName"].ToString().Split(',')[i] + "\"}";
                    }
                    else
                    {
                        json = json + "," + "{\"fileType\":\"" + dt.Rows[0]["fileType"].ToString().Split(',')[i] + "\",\"id\":\"" + dt.Rows[0]["id"] + "\",\"fileSize\":\"" + dt.Rows[0]["fileSize"].ToString().Split(',')[i] + "\",\"up_fileName\":\"" + dt.Rows[0]["up_fileName"].ToString().Split(',')[i] + "\",\"fileName\":\"" + dt.Rows[0]["fileName"].ToString().Split(',')[i] + "\"}";
                    }
                } 
            }
            else
            {
                json = "{\"info\":\"\",\"cookie\":\"0\"}"; //获取失败
            }
        }
        else
        {
            json = "{\"info\":\"\",\"cookie\":\"0\"}"; //获取失败
        }
        dt.Clear(); dt.Dispose();

        HttpContext.Current.Response.Write("{\"info\":[" + json + "]}"); //成功
    }
    
}