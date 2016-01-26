using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LIBRARY.BLL;
using LIBRARY.Models;

namespace LIBRARY.UI
{
    public partial class demo : System.Web.UI.Page
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

        public reader getReaderInfo(string student_card_number)
        {
            reader reader;
            AdminBLL adminBLL = new AdminBLL();
            reader = adminBLL.getReaderInfo(student_card_number);
            return reader;
        }

    }
}