using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LIBRARY.BLL;
using LIBRARY.Models;
using System.Data.OleDb;

namespace LIBRARY.UI
{
    public partial class importBookInfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
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
                    foreach (DataRow dr in dt.Rows)
                    {
                        string serialCode = Convert.ToString(dr[0]);
                        string bookName = Convert.ToString(dr[1]);
                        string author = Convert.ToString(dr[2]);
                        string publisher = Convert.ToString(dr[3]);
                        string publishDate = Convert.ToString(dr[4]);
                        string indexId = Convert.ToString(dr[5]);
                        string pageNumber = Convert.ToString(dr[7]);
                        string price = "0.0";
                        string ISBN = Convert.ToString(dr[9]);
                        
                        if(Convert.ToString(dr[8]) != "")
                        {
                            price = Convert.ToString(dr[8]);
                        }
                       
                        string signalCode = Convert.ToString(dr[11]);
                        
                        if(signalCode != "")
                        {
                            int size = signalCode.Length;
                            string tmp = "";
                            for (int j = size - 2; j >= 0; j -= 2)
                            {
                                tmp = tmp + signalCode[j] + signalCode[j + 1];
                            }
                            signalCode = tmp;
                        }
                       
                        if (signalCode != "")
                        {
                            AdminBLL adminBLL = new AdminBLL();
                            Dictionary<string, string> kv = new Dictionary<string, string>();
                            kv.Add("ISBN", ISBN);
                            kv.Add("serial_code", serialCode);
                            kv.Add("name", bookName);
                            kv.Add("author", author);
                            kv.Add("publisher_name", publisher);
                            kv.Add("publisher_id", "0");
                            kv.Add("publish_date", publishDate);
                            kv.Add("price", Convert.ToString(price));
                            kv.Add("language", "");
                            kv.Add("status", "在馆");
                            kv.Add("location_id", "0");
                            kv.Add("index_id", indexId);
                            kv.Add("page_number", pageNumber);
                            kv.Add("signal_code", signalCode);
                            bool isSuccess = adminBLL.addBook(kv);
                        }                    
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