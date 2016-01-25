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
    public partial class classList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public List<Class> getClassList()
        {
            List<Class> classList;
            AdminBLL adminBLL = new AdminBLL();
            classList = adminBLL.getClasses();
            return classList;
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