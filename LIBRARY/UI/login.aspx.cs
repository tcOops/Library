using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LIBRARY.BLL;

namespace LIBRARY.UI
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.HttpMethod == "GET")//the request for the origin login page
                {
                    //
                }
                else if (Request.HttpMethod == "POST")
                {
                    AdminBLL adminBLL = new AdminBLL();
                    string userName = Request.Form["username"];
                    string pwd = Request.Form["password"];
                    int userId = adminBLL.adminLogin(userName, pwd);
                    if (userId != -1)
                    {
                        HttpContext.Current.Session["user"] = userName;
                        HttpContext.Current.Session["userId"] = userId;
                        HttpContext.Current.Session.Timeout = 600;
                        Response.Redirect("home.aspx");
                    }
                    else
                    {
                        //
                    }
                }
                else
                {
                    //
                }
            }
        }
    }
}