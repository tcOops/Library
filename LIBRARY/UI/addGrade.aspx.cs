using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LIBRARY.BLL;

namespace LIBRARY.UI
{
    public partial class addGrade : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                string grade_number = Request.Form["grade_number"];

                AdminBLL adminBLL = new AdminBLL();
                Dictionary<string, string> kv = new Dictionary<string, string>();
                kv.Add("grade_number", grade_number);

                bool isSuccess = adminBLL.addGrade(kv);
                Response.Redirect("gradeList.aspx");
            }
        }
    }
}