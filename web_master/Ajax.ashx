<%@ WebHandler Language="C#" Class="Ajax" %>

using System;
using System.Web;
using System.Data;
using System.Web.UI.WebControls;
using System.Data.OleDb;
using LS.Common;

public class Ajax : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        Function.Check_AdminLogin();
        context.Response.ContentType = "text/plain";
        string action = context.Request.QueryString["action"];
        string tb = context.Request.QueryString["tb"];
        string id = context.Request.QueryString["id"];
        string val = context.Request.QueryString["val"];
        
        if (id != "" && tb != "" && action!="")
        {
            if (action.ToUpper() != "ORDERID")
            {
                DataTable dt = DBClass.Re_dt("select * from " + tb + " where id=" + id + "");
                if (dt.Rows.Count > 0)
                {
                    if (dt.Rows[0]["" + action + ""].ToString() == "1")
                    {
                        dt.Clear(); dt.Dispose();
                        DBClass.ExecSql("update " + tb + " set " + action + "=0 where id=" + id + "");
                        context.Response.Write("images/no.gif");
                    }
                    else
                    {
                        dt.Clear(); dt.Dispose();
                        DBClass.ExecSql("update " + tb + " set " + action + "=1 where id=" + id + "");
                        context.Response.Write("images/yes.gif");
                    }
                }
                else
                {
                    dt.Clear(); dt.Dispose();
                    context.Response.Write("images/no.gif");
                }
            }

            else
            {
                DBClass.ExecSql("update " + tb + " set orderid=" + val + " where Id=" + id + "");
                System.Threading.Thread.Sleep(200);
                context.Response.Write(val);
            }
        }
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}