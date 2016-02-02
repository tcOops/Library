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
                if (Request.Files.Count >= 1)
                {
                    HttpPostedFile postedFile = Request.Files[0];
                    string fileName, fileExtension;
                    fileName = System.IO.Path.GetFileName(postedFile.FileName); //文件名称
                    if (fileName != "")
                    {
                        fileExtension = System.IO.Path.GetExtension(fileName); //上传文件的扩展名
                        string new_filename = Request.Form["student_code"] + fileExtension; //给文件重新命名
                        //postedFile.FileName： 客户端文件地址
                        //postedFile.ContentType.ToString()： 上传的文件类型
                        string str = Server.MapPath("\\Avatar\\") + new_filename;                                                                              //保存文件到文件夹，地址是当前页面的同一级目录下的files文件夹中
                        postedFile.SaveAs(str);
                        Response.Write("success");
                    }
                    else
                    {
                        Response.Write("false");
                    }
                }

                string readerName = Request.Form["reader_name"];
                string password = Request.Form["pwd1"];
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
                string role = "";
                if(roleId == "5")
                {
                    role = "学生";
                }
                if (roleId == "1")
                {
                    role = "校长";
                }
                kv.Add("role", role);
                bool isSuccess = adminBLL.addReader(kv);
                Response.Redirect("readerList.aspx");
            }
        }
    }
}