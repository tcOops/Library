using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using LIBRARY.Models;
using MySql.Data.MySqlClient;
using System.Data.SqlClient;

namespace LIBRARY.DAL
{
    public class LocationDAL
    {
        public static string connectString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["mysqlConnectString"].ToString();
        public List<bookstoreLocation> getLocation()
        {
            MySqlDataReader dr;
            List<bookstoreLocation> locationList = new List<bookstoreLocation>();
            try
            {
                using (MySqlConnection conn = new MySqlConnection(connectString))
                {
                    string sql = "select id, location, door_ip, RFID_ip, code, sn_code from bookstorelocation where is_deleted = 0 limit 20";
                    MySqlCommand cmd = new MySqlCommand(sql, conn);
                    conn.Open();
                    dr = cmd.ExecuteReader();

                    while (dr.Read())
                    {
                        bookstoreLocation bookstoreLocation = new bookstoreLocation();
                        bookstoreLocation.Id = Convert.ToInt32(dr["id"]);
                        bookstoreLocation.Location = Convert.ToString(dr["location"]);
                        bookstoreLocation.Door_ip = Convert.ToString(dr["door_ip"]);
                        bookstoreLocation.RFID_ip = Convert.ToString(dr["RFID_ip"]);
                        bookstoreLocation.Code = Convert.ToString(dr["code"]);
                        bookstoreLocation.Sn_code = Convert.ToString(dr["sn_code"]);
                        locationList.Add(bookstoreLocation);
                    }
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
            return locationList;
        }


        public bool addLocation(Dictionary<string, string> kv)
        {
            MySqlParameter[] paras =
            {
                     new MySqlParameter("?location", kv["location"]),
                     new MySqlParameter("?door_ip", kv["door_ip"]),
                     new MySqlParameter("?RFID_ip", kv["RFID_ip"]),
                     new MySqlParameter("?code", kv["code"]),
                     new MySqlParameter("?is_deleted", "0"),
                     new MySqlParameter("?sn_code", kv["sn_code"])
            };

            try
            {
                using (MySqlConnection conn = new MySqlConnection(connectString))
                {
                    string sql = "insert into bookstorelocation(location, door_ip, RFID_ip, code, is_deleted, sn_code) values(?location, ?door_ip, ?RFID_ip, ?code, ?is_deleted, ?sn_code)";
                    MySqlCommand cmd = new MySqlCommand(sql, conn);
                    cmd.Parameters.AddRange(paras);
                    conn.Open();
                    cmd.ExecuteNonQuery();
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

        public bool updateBookLocation(string bookIds, string locationId, string locationName)
        {
            
            try
            {
                using (MySqlConnection conn = new MySqlConnection(connectString))
                {
                    string[] bookIdList = bookIds.Split(',');
                    foreach(string bookId in bookIdList)
                    {
                        if(bookId == "")
                        {
                            continue;
                        }
                        string sql = "update book set location_id = {0}, location_name = \"{2}\" where id = {1}";
                        sql = String.Format(sql, locationId, bookId, locationName);
                        MySqlCommand cmd = new MySqlCommand(sql, conn);
                        conn.Open();
                        cmd.ExecuteNonQuery();
                        conn.Close();
                    }   
                  
                }
                return true;
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

        public string getLocationByDoorIp(string doorIp)
        {
            MySqlDataReader dr;
            string locationName = "";
            try
            {
                using (MySqlConnection conn = new MySqlConnection(connectString))
                {
                    string sql = "select id, location from bookstorelocation where is_deleted = 0 and door_ip = \"{0}\"";
                    sql = string.Format(sql, doorIp);
                    MySqlCommand cmd = new MySqlCommand(sql, conn);
                    conn.Open();
                    dr = cmd.ExecuteReader();

                    while (dr.Read())
                    {
                        locationName = Convert.ToString(dr["location"]);
                        break;
                    }
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
            return locationName;
        }


        public string getLocationByRFIDIp(string RFIDIp)
        {
            MySqlDataReader dr;
            string locationName = "";
            try
            {
                using (MySqlConnection conn = new MySqlConnection(connectString))
                {
                    string sql = "select id, location from bookstorelocation where is_deleted = 0 and rfid_ip = \"{0}\"";
                    sql = string.Format(sql, RFIDIp);
                    MySqlCommand cmd = new MySqlCommand(sql, conn);
                    conn.Open();
                    dr = cmd.ExecuteReader();

                    while (dr.Read())
                    {             
                        locationName = Convert.ToString(dr["location"]);                       
                    }
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
            return locationName;
        }
    }
}