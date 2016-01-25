using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using LIBRARY.Models;
using MySql.Data.MySqlClient;
using System.Data.SqlClient;

namespace LIBRARY.DAL
{
    public class circulationDAL
    {
        public static string connectString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["mysqlConnectString"].ToString();
        public List<circulation> getCirculationList()
        {
            //string connectString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["mysqlConnectString"].ToString();
            MySqlConnection conn = new MySqlConnection(connectString);
            string sql = "SELECT id, reader_name, book_id, signal_code, action_time, action_type, book_name from circulation where is_deleted = 0 order by id desc";
            MySqlCommand cmd = new MySqlCommand(sql, conn);
            MySqlDataReader dr;
            List<circulation> circulationList = new List<circulation>();
            try
            {
                conn.Open();
                dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    circulation circulation = new circulation();


                    circulation.Id = Convert.ToInt32(dr["id"]);
                    circulation.Reader_name = Convert.ToString(dr["reader_name"]);
                    circulation.Book_id = Convert.ToString(dr["book_id"]);
                    circulation.Signal_code = Convert.ToString(dr["signal_code"]);
                    circulation.Action_time = Convert.ToString(dr["action_time"]);
                    circulation.Action_type = Convert.ToString(dr["action_type"]);
                    circulation.Book_name = Convert.ToString(dr["book_name"]);

                    circulationList.Add(circulation);
                }
                conn.Close();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
            }
            finally
            {
                Console.WriteLine("finally!");
            }
            return circulationList;
        }

    }
}