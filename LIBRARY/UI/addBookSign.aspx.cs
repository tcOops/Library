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
    public partial class addBookSign : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string bookId = Request.Form["bookIdRes"];
            string bookSN = Request.Form["bookSN"];
            string bookRFID = Request.Form["bookRFID"];
            string operId = Convert.ToString(HttpContext.Current.Session["userId"]);

            AdminBLL adminBLL = new AdminBLL();
            bool status = adminBLL.updateBookInfoAboutRFID(bookSN, bookRFID, bookId, operId);

            Response.Redirect("bookSign.aspx");
        }
    }
}