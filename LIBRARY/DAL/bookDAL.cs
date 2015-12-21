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
                    book.Publish_date = Convert.ToString(dr["publish_date"]);
                    book.Price = Convert.ToInt32(dr["price"]);
                    book.Language = Convert.ToString(dr["language"]);
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

        public string getbookNameBySC(string signal_code)
        {
            //string connectString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["mysqlConnectString"].ToString();
            MySqlConnection conn = new MySqlConnection(connectString);
            string sql = "select name from book where signal_code = \"" + signal_code + "\"";
            MySqlCommand cmd = new MySqlCommand(sql, conn);
            MySqlDataReader dr;
            string bookName = "";
            try
            {
                conn.Open();
                dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    bookName = Convert.ToString(dr[0]);
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
            return bookName;
        }

        public bool addBook(Dictionary<string, string> kv)
        {
            MySqlParameter[] paras =
            {
                     new MySqlParameter("?ISBN", kv["ISBN"]),
                     new MySqlParameter("?signal_code", kv["signal_code"]),
                     new MySqlParameter("?name", kv["name"]),
                     new MySqlParameter("?author", kv["author"]),
                     new MySqlParameter("?publisher_name", kv["publisher_name"]),
                     new MySqlParameter("?publisher_id", kv["publisher_id"]),
                     new MySqlParameter("?publish_date", kv["publish_date"]),
                     new MySqlParameter("?price", kv["price"]),
                     new MySqlParameter("?language",kv["language"]),
                     new MySqlParameter("?status", kv["status"]),
                     new MySqlParameter("?location_id",kv["location_id"]),
                     new MySqlParameter("?is_deleted", "0")
            };

            try
            {
                using (MySqlConnection conn = new MySqlConnection(connectString))
                {
                    string sql = "insert into book(ISBN, signal_code, name, author, publisher_name, publisher_id, publish_date, price, language, status, location_id, is_deleted) values(?ISBN,?signal_code,?name,?author,?publisher_name,?publisher_id,?publish_date,?price,?language,?status,?location_id,?is_deleted)";
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