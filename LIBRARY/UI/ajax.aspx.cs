using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LIBRARY.BLL;

namespace LIBRARY.UI
{
    public partial class ajax : System.Web.UI.Page
    {
         protected void Page_Load(object sender, EventArgs e)
         {
             // 判断是否有异步请求
             if (!string.IsNullOrEmpty(Request["requestMethod"]))
             {
                 string returnResult = string.Empty;
                 switch (Request["requestMethod"]) // 请求的方法
                 {
                     case "getDemoInfo":
                    {
                        returnResult = getRealTimeMsg();
                    } break;
                     default:
                    {
                        returnResult = "no method"; } break;
                    }
                 Response.Write(returnResult);
                 Response.End(); // 结束输出流，否则会包含整个页面
             }
         }

        public string getRealTimeMsg()
        {
            return "{\"status\":\"test\"}";
        }

        public string RealTimeMsg()
        {
            AdminBLL adminBLL = new AdminBLL();
            string demoRTMsg = adminBLL.getDemoRTInfo();
            return demoRTMsg;
        }
    }
}