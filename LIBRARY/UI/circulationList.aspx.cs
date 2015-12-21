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
    public partial class circulationList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public List<circulation> getCirculationList()
        {
            List<circulation> circulationList;
            AdminBLL adminBLL = new AdminBLL();
            circulationList = adminBLL.getCirculations();
            return circulationList;
        }
    }
}