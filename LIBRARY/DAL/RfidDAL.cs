using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using LIBRARY.Models;
using MySql.Data.MySqlClient;

namespace LIBRARY.DAL
{
    public class RfidDAL
    {
        public static string connectString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["mysqlConnectString"].ToString();
        public List<RFIDRecord> getDemoRFIDInfo()
        {
            //string connectString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["mysqlConnectString"].ToString();
            MySqlConnection conn = new MySqlConnection(connectString);
            string sql = "select id, signal_code, action_date, ip from rfidrecord where is_demo = 0";
            MySqlCommand cmd = new MySqlCommand(sql, conn);
            MySqlDataReader dr;
            List<RFIDRecord> RFIDRecordList = new List<RFIDRecord>();
            try
            {
                conn.Open();
                dr = cmd.ExecuteReader();
                string idList = "(";
                bool flag = false;
                while (dr.Read())
                {
                    RFIDRecord RFIDRecord = new RFIDRecord();
                    RFIDRecord.Signal_code = Convert.ToString(dr["signal_code"]);
                    RFIDRecord.Action_date = Convert.ToString(dr["action_date"]);
                    RFIDRecord.Ip = Convert.ToString(dr["ip"]);
                    RFIDRecord.Id = Convert.ToInt32(dr["id"]);
                    if (flag)
                    {
                        idList += ",";
                    }
                    flag = true;
                    idList += Convert.ToString(RFIDRecord.Id);
                    //sql = "update rfidrecord set is_demo = 1 where id = " + Convert.ToString(RFIDRecord.Id);
                    //cmd = new MySqlCommand(sql, conn);
                    //cmd.ExecuteNonQuery();
                    RFIDRecordList.Add(RFIDRecord);             
                }
                idList += ")";
                updateDemoRFIDStatus(idList);
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
            }
            finally
            {
                conn.Close();
                Console.WriteLine("finally!");
            }
            return RFIDRecordList;
        }

        public bool updateDemoRFIDStatus(string RFIDIdList)
        {
            try
            {
                using (MySqlConnection conn = new MySqlConnection(connectString))
                {
                    string sql = "update rfidrecord set is_demo = 1 where id in " + Convert.ToString(RFIDIdList);
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