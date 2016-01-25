using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using LIBRARY.Models;
using MySql.Data.MySqlClient;
using System.Data.SqlClient;

namespace LIBRARY.DAL
{
    public class GradeDAL
    {
        public static string connectString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["mysqlConnectString"].ToString();

        //Get the grade list info
        public List<grade> getGradeList()
        {
            MySqlConnection conn = new MySqlConnection(connectString);
            string sql = "select id, name, school_id from grade";
            MySqlCommand cmd = new MySqlCommand(sql, conn);
            MySqlDataReader dr;
            List<grade> GradeList = new List<grade>();
            try
            {
                conn.Open();
                dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    grade grade = new grade();

                    grade.Id = Convert.ToInt32(dr["id"]);
                    grade.Name = Convert.ToString(dr["name"]);
                    grade.School_id = Convert.ToInt32(dr["school_id"]);

                    GradeList.Add(grade);
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
            return GradeList;
        }

        //Admin adds a new Grade
        public bool addGrade(Dictionary<string, string> kv)
        {
            MySqlParameter[] paras =
            {
                     new MySqlParameter("?name", kv["grade_number"]+"年级"),
                     new MySqlParameter("?school_id","1")
            };

            try
            {
                using (MySqlConnection conn = new MySqlConnection(connectString))
                {
                    //default school_id is "1"
                    string sql = "insert into grade(name, school_id) values(?name, ?school_id)";
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