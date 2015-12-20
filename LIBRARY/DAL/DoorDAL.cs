using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using LIBRARY.Models;
using MySql.Data.MySqlClient;

namespace LIBRARY.DAL
{
    public class DoorDAL
    {
        public static string connectString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["mysqlConnectString"].ToString();
        public List<doorRecord> getDemoDoorInfo()
        {
            //string connectString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["mysqlConnectString"].ToString();
            MySqlConnection conn = new MySqlConnection(connectString);
            string sql = "select id, action, generate_date, door_ip from doorrecord where is_demo = 0";
            MySqlCommand cmd = new MySqlCommand(sql, conn);
            MySqlDataReader dr;
            List<doorRecord> doorRecordList = new List<doorRecord>();
            try
            {
                conn.Open();
                dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    doorRecord doorRecord = new doorRecord();
                    doorRecord.Action = Convert.ToString(dr["action"]);
                    doorRecord.Generate_date = Convert.ToString(dr["generate_date"]);
                    doorRecord.Door_ip = Convert.ToString(dr["door_ip"]);
                    doorRecord.Id = Convert.ToInt32(dr["id"]);
                    sql = "update doorrecord set is_demo = 1 where id = " + Convert.ToString(doorRecord.Id);
                    cmd = new MySqlCommand(sql, conn);
                    cmd.ExecuteNonQuery();
                    doorRecordList.Add(doorRecord);
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
            return doorRecordList;
        }
    }
}