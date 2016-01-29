using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using LIBRARY.Models;
using MySql.Data.MySqlClient;
using System.Data;

namespace LIBRARY.DAL
{
    public class AdminDAL
    {
        public static string connectString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["mysqlConnectString"].ToString();
        public admin getAdminInfo()
        {
            //string connectString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["mysqlConnectString"].ToString();
            MySqlConnection conn = new MySqlConnection(connectString);
            string sql = "SELECT id, alias, password from admin";
            MySqlCommand cmd = new MySqlCommand(sql, conn);
            MySqlDataReader dr;
            admin admin = new admin();
            try
            {
                conn.Open();
                dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    admin.id = Convert.ToInt32(dr["id"]);
                    admin.alias = dr["alias"].ToString();
                    admin.password = dr["password"].ToString();
                    conn.Close();
                    break;
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
            }
            finally
            {
                Console.WriteLine("finally!");
            }
            return admin;
        }
    }
}