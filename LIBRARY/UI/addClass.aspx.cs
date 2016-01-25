using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LIBRARY.BLL;

namespace LIBRARY.UI
{
    public partial class addClass : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                string class_number = Request.Form["class_number"];
                string grade_id = Request.Form["grade_id"];
                string code_number = Request.Form["code_number"];

                AdminBLL adminBLL = new AdminBLL();
                Dictionary<string, string> kv = new Dictionary<string, string>();
                kv.Add("class_number", class_number);
                kv.Add("grade_id", grade_id);
                kv.Add("code_number", code_number);

                bool isSuccess = adminBLL.addClass(kv);
                Response.Redirect("classList.aspx");
            }
        }
    }
}