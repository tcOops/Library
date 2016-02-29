using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using LIBRARY.Models;
using MySql.Data.MySqlClient;
using System.Data.SqlClient;

namespace LIBRARY.DAL
{
    public class ClassDAL
    {
        public static string connectString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["mysqlConnectString"].ToString();

        //Get the class list info
        public List<Class> getClassList()
        {
            MySqlConnection conn = new MySqlConnection(connectString);
            string sql = "select id, name, grade_id, code_number from class";
            MySqlCommand cmd = new MySqlCommand(sql, conn);
            MySqlDataReader dr;
            List<Class> ClassList = new List<Class>();
            try
            {
                conn.Open();
                dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    Class Class = new Class();

                    Class.Id = Convert.ToInt32(dr["id"]);
                    Class.Name = Convert.ToString(dr["name"]);
                    Class.Grade_id = Convert.ToInt32(dr["grade_id"]);
                    Class.Code_number = Convert.ToString(dr["code_number"]);

                    ClassList.Add(Class);
                }
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
            return ClassList;
        }


        //Admin adds a new Class
        public bool addClass(Dictionary<string, string> kv)
        {
            try
            {
                using (MySqlConnection conn = new MySqlConnection(connectString))
                {
                    MySqlParameter[] para =
                    {
                        new MySqlParameter("?grade_id", kv["grade_id"])
                    };
                    string sql = "select name from grade where id=?grade_id";
                    conn.Open();
                    MySqlCommand cmd = new MySqlCommand(sql, conn);

                    MySqlDataReader dr;
                    cmd.Parameters.AddRange(para);
                    dr = cmd.ExecuteReader();
                    dr.Read();
                    string grade_name = Convert.ToString(dr["name"]);
                    dr.Close();

                    MySqlParameter[] paras =
                    {
                        new MySqlParameter("?code_number", kv["code_number"]),
                        new MySqlParameter("?name", grade_name+kv["class_number"]+"班"),
                        new MySqlParameter("?grade_id", kv["grade_id"])
                    };

                    sql = "insert into class(name, grade_id,code_number) values(?name, ?grade_id, ?code_number)";
                    cmd = new MySqlCommand(sql, conn);
                    cmd.Parameters.AddRange(paras);
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