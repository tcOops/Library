using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.IO;
using System.Data.OleDb;
using System.Data;
using LIBRARY.BLL;
using LIBRARY.Models;


namespace LIBRARY.UI
{
    public partial class importStudentInfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                HttpFileCollection files = HttpContext.Current.Request.Files;//得到所有的FILE控件
                for (int i = 0; i < files.Count; i++)
                {
                    HttpPostedFile postedFile = files[i];//取得单个文件
                    Stream fileStream = postedFile.InputStream;
                    StreamReader sr = new StreamReader(fileStream, Encoding.Default);

                    string path = System.AppDomain.CurrentDomain.BaseDirectory;
                    path = path + "\\static\\sourceFiles";
                    if (System.IO.Directory.Exists(path) == false)
                    {
                        System.IO.Directory.CreateDirectory(path);
                    }

                    string fileName = postedFile.FileName;
                    string filePos = path + "\\" + fileName;
                    if (!File.Exists(filePos))
                    {
                        postedFile.SaveAs(filePos);
                    }

                    DataTable dt = getExcel(filePos);
                    foreach(DataRow dr in dt.Rows)
                    {
                        string studentCardNumber= Convert.ToString(dr[0]);
                        string readerName = Convert.ToString(dr[1]);
                        string sex = Convert.ToString(dr[2]);
                        string classCode = Convert.ToString(dr[3]);
                        string studentCode = Convert.ToString(dr[5]);

                        AdminBLL adminBLL = new AdminBLL();
                        Dictionary<string, string> kv = new Dictionary<string, string>();
                        kv.Add("readerName", readerName);
                        kv.Add("password", "123");
                        kv.Add("sex", sex);
                        kv.Add("classId", classCode);
                        kv.Add("studentCode", studentCode);
                        kv.Add("studentCardNumber", studentCardNumber);
                        kv.Add("role", "学生");

                        bool status = adminBLL.addReader(kv);
                    }
                    Response.Redirect("dataImport.aspx");
                }
            }
        }

        //加载Excel 
        public static DataTable getExcel(string filePos)
        {
            string connectionString = string.Format("Provider=Microsoft.Jet.OLEDB.4.0;Data Source={0};Jet OLEDB:Engine Type=35;Extended Properties=Excel 8.0;Persist Security Info=False", filePos);
            DataSet ds = new DataSet();
            string tableName;
            using (System.Data.OleDb.OleDbConnection connection = new System.Data.OleDb.OleDbConnection(connectionString))
            {
                connection.Open();
                DataTable table = connection.GetOleDbSchemaTable(System.Data.OleDb.OleDbSchemaGuid.Tables, null);
                tableName = table.Rows[0]["Table_Name"].ToString();
                string strExcel = "select * from " + "[" + tableName + "]";
                OleDbDataAdapter adapter = new OleDbDataAdapter(strExcel, connectionString);
                adapter.Fill(ds, tableName);
                connection.Close();
            }
            return ds.Tables[tableName];
        }
    }
}