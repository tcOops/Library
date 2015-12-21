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
            string sql = "select id, action, generate_date, door_ip, signal_code from doorrecord where is_demo = 0";
            MySqlCommand cmd = new MySqlCommand(sql, conn);
            MySqlDataReader dr;
            List<doorRecord> doorRecordList = new List<doorRecord>();
            try
            {
                conn.Open();
                dr = cmd.ExecuteReader();
                string idList = "(";
                bool flag = false;
                while (dr.Read())
                {
                    doorRecord doorRecord = new doorRecord();
                    doorRecord.Action = Convert.ToString(dr["action"]);
                    doorRecord.Generate_date = Convert.ToString(dr["generate_date"]);
                    doorRecord.Door_ip = Convert.ToString(dr["door_ip"]);
                    doorRecord.Id = Convert.ToInt32(dr["id"]);
                    doorRecord.Signal_code = Convert.ToString(dr["signal_code"]);
                    if (flag)
                    {
                        idList += ",";
                    }
                    flag = true;
                    idList += Convert.ToString(doorRecord.Id);
                    //sql = "update doorrecord set is_demo = 1 where id = " + Convert.ToString(doorRecord.Id);
                    //cmd = new MySqlCommand(sql, conn);
                    //cmd.ExecuteNonQuery();
                    doorRecordList.Add(doorRecord);
                }
                idList += ")";
                conn.Close();
                updateDemoDoorStatus(idList);
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

        public bool updateDemoDoorStatus(string doorIdList)
        {
            try
            {
                using (MySqlConnection conn = new MySqlConnection(connectString))
                {
                    string sql = "update doorrecord set is_demo = 1 where id in " + Convert.ToString(doorIdList);
                    MySqlCommand cmd = new MySqlCommand(sql, conn);
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();
                    return true;
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
            return false;
        }
    }
}