<%@ WebHandler Language="C#" Class="Fun" %>

using System;
using System.Web;
using System.Data;
using System.Web.UI.WebControls;
using System.Data.OleDb;
using LS.Common;
using System.Text;
using System.Text.RegularExpressions;

public partial class Fun : System.Web.UI.Page
{
    DBClass DBClass = new DBClass();
    protected void Page_Load(object sender, EventArgs e)
    {
        string Action = HttpContext.Current.Request.QueryString["act"];
        switch (Action)
        {
            case "addemail":
                addemail();
                break;
        }

    }

  /// <summary>
    /// 订阅邮件
    /// </summary>
    private void addemail()
    {
        string Email = Function.FormRequest("Email");
        string checkcode = Function.FormRequest("checkcode");
        string cid = Function.GetRequest("cid");
        if (checkcode == Cookie.GetCookie("CheckCode"))
        {
            Regex reg = new Regex("^([a-z0-9A-Z]+[-|\\.|_]?)+[a-z0-9A-Z]@([a-z0-9A-Z]+(-[a-z0-9A-Z]+)?\\.)+[a-zA-Z]{2,}$");
            if(reg.IsMatch(Email.Trim()) && Email.Length <=40)
            {
                DataTable dt = DBClass.Re_dt("select * from Subscribe where Email = '" + Email + "'");
                if (dt.Rows.Count <= 0)
                {
                    string sql = "insert into Subscribe(Email,addtime,classid) values('" + Email + "','" + System.DateTime.Now + "'," + cid + ")";
                    DBClass.ExecSql(sql);
                    Response.Write("{\"status\":1,\"result\":\"Submitted successfully, we will contact you as soon as possible.\", \"code\": \"" + Function.RandomNum(4) + "\"}");
                    Response.End();
                }
                dt.Clear(); dt.Dispose();
            }
            else
            {
                Response.Write("{\"status\":2,\"result\":\"error!\", \"code\": \"" + Function.RandomNum(4) + "\"}");
                Response.End();
            }
        }
        else
        {
            Response.Write("{\"status\":2,\"result\":\"error!\", \"code\": \"" + Function.RandomNum(4) + "\"}");
            Response.End();
        }
    }
}