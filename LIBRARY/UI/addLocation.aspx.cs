using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LIBRARY.BLL;

namespace LIBRARY.UI
{
    public partial class addLocation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string location = Request.Form["location"];
                string doorIp = Request.Form["doorIp"];
                string RFIDIp = Request.Form["RFIDIp"];
                string code = Request.Form["code"];

                AdminBLL adminBLL = new AdminBLL();
                Dictionary<string, string> kv = new Dictionary<string, string>();
                kv.Add("location", location);
                kv.Add("door_ip", doorIp);
                kv.Add("RFID_ip", RFIDIp);
                kv.Add("code", code);
                bool isSuccess = adminBLL.addLocation(kv);
                Response.Redirect("locationList.aspx");
            }
        }
    }
}