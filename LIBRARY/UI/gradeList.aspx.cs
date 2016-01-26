using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LIBRARY.Models;
using LIBRARY.BLL;

namespace LIBRARY.UI
{
    public partial class gradeList : System.Web.UI.Page
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


        public List<grade> getGradeList()
        {
            List<grade> gradeList;
            AdminBLL adminBLL = new AdminBLL();
            gradeList = adminBLL.getGrades();
            return gradeList;
        }
    }
}