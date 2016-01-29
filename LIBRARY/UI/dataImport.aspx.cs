using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LIBRARY.UI
{
    public partial class dataImport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (HttpContext.Current.Session["user"] == null)
                {
                    Response.Redirect("login.aspx");
                }
                //Response.Redirect("login.aspx");
            }
        }
    }
}