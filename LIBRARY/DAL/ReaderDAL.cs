using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using LIBRARY.Models;
using MySql.Data.MySqlClient;
using System.Data.SqlClient;

namespace LIBRARY.DAL
{
    public class ReaderDAL
    {
        public static string connectString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["mysqlConnectString"].ToString();
        public List<reader> getReaderList()
        {
            //string connectString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["mysqlConnectString"].ToString();
            MySqlConnection conn = new MySqlConnection(connectString);
            string sql = "SELECT id, name, sex, class_id, student_code, student_card_number, role_id, reader_status, generate_date from reader where is_deleted = 0";
            MySqlCommand cmd = new MySqlCommand(sql, conn);
            MySqlDataReader dr;
            List<reader> readerList = new List<reader>();
            try
            {
                conn.Open();
                dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    reader reader = new reader();

                    reader.Id =  Convert.ToInt32(dr["id"]);
                    reader.Name = Convert.ToString(dr["name"]);
                    reader.Sex = Convert.ToString(dr["sex"]);
                    reader.Class_id = Convert.ToInt32(dr["class_id"]);
                    reader.Student_code = Convert.ToString(dr["student_code"]);
                    reader.Student_card_number = Convert.ToString(dr["student_card_number"]);
                    reader.Role_id = Convert.ToInt32(dr["role_id"]);
                    reader.Reader_status = Convert.ToString(dr["reader_status"]);
                    reader.Generate_date = Convert.ToDateTime(dr["generate_date"]);

                    readerList.Add(reader);
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
            return readerList;
        }

        /// <summary>
        /// Chose the readerInfo by Signal_code
        /// </summary>
        /// <returns></returns>
        public string getReaderNameBySC(string signal_code)
        {
            //string connectString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["mysqlConnectString"].ToString();
            MySqlConnection conn = new MySqlConnection(connectString);
            string sql = "select name from reader where student_card_number = \"" + signal_code + "\"";
            MySqlCommand cmd = new MySqlCommand(sql, conn);
            MySqlDataReader dr;
            string readerName = "";
            try
            {
                conn.Open();
                dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    readerName = Convert.ToString(dr[0]);
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
            return readerName;
        }


        public reader getReaderInfo(string student_card_number)
        {
            //string connectString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["mysqlConnectString"].ToString();
            MySqlConnection conn = new MySqlConnection(connectString);
            string sql = "SELECT name,sex,class_id,student_code,student_card_number,role_id,reader_status,generate_date from reader where student_card_number=" + student_card_number;
            MySqlCommand cmd = new MySqlCommand(sql, conn);
            MySqlDataReader dr;
            reader reader = new reader();
            try
            {
                conn.Open();
                dr = cmd.ExecuteReader();
                dr.Read();
                reader.Name = Convert.ToString(dr["name"]);
                reader.Sex = Convert.ToString(dr["sex"]);
                reader.Class_id = Convert.ToInt32(dr["class_id"]);
                reader.Student_code = Convert.ToString(dr["student_code"]);
                reader.Student_card_number = Convert.ToString(dr["student_card_number"]);
                reader.Role_id = Convert.ToInt32(dr["role_id"]);
                reader.Reader_status = Convert.ToString(dr["reader_status"]);
                reader.Generate_date = Convert.ToDateTime(dr["generate_date"]);
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
            return reader;
        }

        public bool addReader(Dictionary<string, string> kv)
        {
            MySqlParameter[] paras = 
            {
                     new MySqlParameter("?readerName", kv["readerName"]),
                     new MySqlParameter("?password", kv["password"]),
                     new MySqlParameter("?sex", kv["sex"]),
                     new MySqlParameter("?classId", kv["classId"]),
                     new MySqlParameter("?studentCode", kv["studentCode"]),
                     new MySqlParameter("?studentCardNumber", kv["studentCardNumber"]),
                     new MySqlParameter("?roleId", kv["roleId"]),
                     new MySqlParameter("?readerStatus", "使用中"),
                     new MySqlParameter("?generateDate", Convert.ToString(DateTime.Now)),
                     new MySqlParameter("?isDeleted", "0")
            };

            try
            {
                using (MySqlConnection conn = new MySqlConnection(connectString))
                {
                    string sql = "insert into reader(name, password, sex, class_id, student_code, student_card_number, role_id, reader_status, generate_date, is_deleted) values(?readerName, ?password, ?sex, ?classId, ?studentCode, ?studentCardNumber, ?roleId, ?readerStatus, ?generateDate, ?isDeleted)";
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
    }
}