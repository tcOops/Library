using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using LIBRARY.Models;
using MySql.Data.MySqlClient;
using System.Data.SqlClient;

namespace LIBRARY.DAL
{
    public class bookDAL
    {
        public static string connectString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["mysqlConnectString"].ToString();
        public List<book> getBookList()
        {
            //string connectString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["mysqlConnectString"].ToString();
            MySqlConnection conn = new MySqlConnection(connectString);
            string sql = "SELECT id, ISBN, signal_code, name, author, publisher_name, publisher_id, publish_date, price, language, status, location_id, is_deleted from book";
            MySqlCommand cmd = new MySqlCommand(sql, conn);
            MySqlDataReader dr;
            List<book> bookList = new List<book>();
            try
            {
                conn.Open();
                dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    book book = new book();

                    book.Id = Convert.ToInt32(dr["id"]);
                    book.ISBN = Convert.ToString(dr["ISBN"]);
                    book.Signal_code = Convert.ToString(dr["signal_code"]);
                    book.Name = Convert.ToString(dr["name"]);
                    book.Author = Convert.ToString(dr["author"]);
                    book.Publisher_name = Convert.ToString(dr["publisher_name"]);
                    book.Publisher_id = Convert.ToInt32(dr["publisher_id"]);
                    book.Publish_date= Convert.ToDateTime(dr["publish_date"]);
                    book.Price = Convert.ToInt32(dr["price"]);
                    book.Language= Convert.ToString(dr["language"]);
                    book.Status = Convert.ToString(dr["status"]);
                    book.Location_id = Convert.ToInt32(dr["location_id"]);
                    book.Is_deleted = Convert.ToBoolean(dr["is_deleted"]);

                    bookList.Add(book);
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
            return bookList;
        }

        public bool addBook(Dictionary<string, string> kv)
        {
            SqlParameter[] paras =
            {
                     new SqlParameter("?ISBN", kv["ISBN"]),
                     new SqlParameter("?Signal_code", kv["Signal_code"]),
                     new SqlParameter("?Name", kv["Name"]),
                     new SqlParameter("?Author", kv["Author"]),
                     new SqlParameter("?Publisher_name", kv["Publisher_name"]),
                     new SqlParameter("?Publisher_id", kv["Publisher_id"]),
                     new SqlParameter("?Publish_date", kv["Publish_date"]),
                     new SqlParameter("?Price", kv["Price"]),
                     new SqlParameter("?Language", kv["Language"]),
                     new SqlParameter("?Status", kv["Status"]),
                     new SqlParameter("?Location_id", kv["Location_id"]),
                     new SqlParameter("?is_deleted", kv["is_deleted"]),

            };

            try
            {
                using (MySqlConnection conn = new MySqlConnection(connectString))
                {
                    string sql = "insert book( ISBN, signal_code, name, author, publisher_name, publisher_id, publish_date, price, language, status, location_id, is_deleted) values(?ISBN, ?signal_code, ?name, ?author, ?publisher_name, ?publisher_id, ?publish_date, ?price, ?language, ?status, ?location_id, ?is_deleted)";
                    MySqlCommand cmd = new MySqlCommand(sql, conn);
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