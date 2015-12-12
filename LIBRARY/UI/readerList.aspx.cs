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
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //Response.Redirect("login.aspx");
            }
        }

        public List<reader> getReaderList()
        {
            List<reader> readerList;
            AdminBLL adminBLL = new AdminBLL();
            readerList = adminBLL.getReaders();
            return readerList;
        }
    }
}