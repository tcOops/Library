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
        public static AdminBLL adminBLL = new AdminBLL();
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
                            //returnResult = getRealTimeMsg();
                            returnResult = RealTimeMsg();
                    } break;

                    case "getBookByAjax":
                    {
                        string serialCode = Request["serialCode"];
                        returnResult = getBookByAjax(serialCode);
                    }
                    break;

                    case "getSNCodeById":
                    {
                        returnResult = getSNCodeById();
                    }
                    break;

                    case "getBookInfoBySNRange":
                    {
                        string snCodeBeg = Request["begSN"];
                        string snCodeEnd = Request["endSN"];
                        returnResult = getBookBySNCodeRange(snCodeBeg, snCodeEnd);
                    }
                    break;

                    case "getLocationByAjax":
                    {
                        returnResult = getLocationByAjax();
                    }
                    break;

                    case "updateBookLocation":
                    {
                        string bookIds = Request["bookIds"];
                        string locationId = Request["location"];
                        string locationName = Request["locationName"];
                        returnResult = updateBookLocation(bookIds, locationId, locationName);
                    }
                    break;
                       
                    default:
                    {
                        returnResult = "no method";
                    } break;
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
            //AdminBLL adminBLL = new AdminBLL();
            string demoRTMsg = adminBLL.getDemoRTInfo();
            return demoRTMsg;
        }

        public string getBookByAjax(string serialCode)
        {
          //  AdminBLL adminBLL = new AdminBLL();
            string bookInfo = adminBLL.getBookBySerial(serialCode);
            return bookInfo;
        }

        public string getSNCodeById()
        {
            int adminId = Convert.ToInt32(HttpContext.Current.Session["userId"]);
            return adminBLL.getSNByOpId(adminId);
        }

        public string getBookBySNCodeRange(string snCodeBeg, string snCodeEnd)
        {
            string bookListJSON = adminBLL.getBookBySNCodeRange(snCodeBeg, snCodeEnd);
            return bookListJSON;
        }

        public string getLocationByAjax()
        {
            string JSONLocation = adminBLL.getLocationByAjax();
            return JSONLocation;
        }

        public string updateBookLocation(string bookIds, string locationId, string locationName)
        {
            bool status = adminBLL.updateBookLocation(bookIds, locationId, locationName);
            if (status)
            {
                return "{\"status\":\"ok\"}"; 
            }
            return "{\"status\":\"error\"}";
        }
    }
}