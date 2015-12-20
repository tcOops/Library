using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LIBRARY.BLL;

namespace LIBRARY.UI
{
    public partial class addBook : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string ISBN = Request.Form["ISBN"];
                string signal_code = Request.Form["signal_code"];
                string name = Request.Form["name"];
                string author = Request.Form["author"];
                string publisher_name = Request.Form["publisher_name"];
                string publisher_id = Request.Form["publisher_id"];
                string publish_date = Request.Form["publish_date"];
                string price = Request.Form["price"];
                string language = Request.Form["language"];
                string status = Request.Form["status"];
                string location_id = Request.Form["location_id"];


                AdminBLL adminBLL = new AdminBLL();
                Dictionary<string, string> kv = new Dictionary<string, string>();
                kv.Add("ISBN", ISBN);
                kv.Add("signal_code", signal_code);
                kv.Add("name", name);
                kv.Add("author", author);
                kv.Add("publisher_name", publisher_name);
                kv.Add("publisher_id", publisher_id);
                kv.Add("publish_date", publish_date);
                kv.Add("price", price);
                kv.Add("language", language);
                kv.Add("status", status);
                kv.Add("location_id", location_id);
                bool isSuccess = adminBLL.addBook(kv);
                Response.Redirect("bookList.aspx");
            }
        }
    }
}