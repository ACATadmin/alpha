<%@ WebHandler Language="C#" Class="ztreeJson" %>

using System;
using System.Web;
using System.Data;
using System.Data.OleDb;
using LS.Common;

public class ztreeJson : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        Function.Check_AdminLogin();

        string id = Function.GetRequest("id");
        
        string ret_str = "";
        string sql = "select * from tbl_class where INSTR('" + Cookie.GetCookie("LS_WebPopedom") + "',id)>0";

        if (Function.IsNum(id))
        {
            //BindDrpClass(id);//生成子目录
            sql = sql + " and ParentId=" + id + "";
        }
        else
        {
           // BindDrpClass("1");//生成子目录
            sql = sql + " and ParentId=1";
        }

        sql = sql + " order by orderid asc";
        

        DataTable dt = DBClass.Re_dt(sql);

        for (int i = 0; i < dt.Rows.Count; i++)
        {
            if (string.IsNullOrWhiteSpace(ret_str))
            {
                ret_str = "{id:'" + dt.Rows[i]["id"].ToString() + "',name: \"" + Function.HtmlDiscode(dt.Rows[i]["className"].ToString()) + "\"," + GetUrl(dt.Rows[i]["modelId"].ToString(), dt.Rows[i]["id"].ToString()) + ",\"target\": \"menu_info\"," + IsChildren(dt.Rows[i]["id"].ToString()) + "}";
            }
            else
            {
                ret_str = ret_str + ",{id:'" + dt.Rows[i]["id"].ToString() + "',name: \"" + Function.HtmlDiscode(dt.Rows[i]["className"].ToString()) + "\"," + GetUrl(dt.Rows[i]["modelId"].ToString(), dt.Rows[i]["id"].ToString()) + ",\"target\": \"menu_info\"," + IsChildren(dt.Rows[i]["id"].ToString()) + "}";
            }
          
        }
        dt.Clear(); dt.Dispose();
        

        context.Response.Write("[" + ret_str+"]");
        
    }

    public string GetUrl(string mid, string cid)
    {
        string children_str = "";
        DataTable dt = DBClass.Re_dt("select * from tbl_class where ParentId=" + cid + "");
        if (dt.Rows.Count > 0)
        {
            children_str = "&listid=1";
        }
        else
        {
            children_str = "&listid=0";
        }
        dt.Clear(); dt.Dispose();


        string return_url = "url: \"" + Function.GetModelUrl(mid) + "classid=" + cid + "&MenuId=" + Function.GetRequest("MenuID") + children_str + "\"";
        return return_url;
    }


    private string IsChildren(string id)
    {
        string isParent_str = "";
        DataTable dt = DBClass.Re_dt("select * from tbl_class where ParentId=" + id + "");
        if (dt.Rows.Count > 0)
        {
            isParent_str = "isParent:true";
        }
        else
        {
            isParent_str = "isParent:false";
        }
        dt.Clear(); dt.Dispose();
        return isParent_str;
    }

    
    public bool IsReusable {
        get {
            return false;
        }
    }

}