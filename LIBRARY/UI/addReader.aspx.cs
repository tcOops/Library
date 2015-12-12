using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LIBRARY.BLL;

namespace LIBRARY.UI
{
    public partial class addReader : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string readerName = Request.Form["reader_name"];
                string password = Request.Form["password"];
                string sex = Request.Form["sex"];
                string classId = Request.Form["class_id"];
                string studentCode = Request.Form["student_code"];
                string studentCardNumber = Request.Form["student_card_number"];
                string roleId = Request.Form["role_id"];

                AdminBLL adminBLL = new AdminBLL();
                Dictionary<string, string> kv = new Dictionary<string, string>();
                kv.Add("readerName", readerName);
                kv.Add("password", password);
                kv.Add("sex", sex);
                kv.Add("classId", classId);
                kv.Add("studentCode", studentCode);
                kv.Add("studentCardNumber", studentCardNumber);
                kv.Add("roleId", roleId);
                bool isSuccess = adminBLL.addReader(kv);
                Response.Redirect("readerList.aspx");
            }
        }
    }
}