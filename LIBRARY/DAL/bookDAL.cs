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
       
        //获取图书列表
        public List<book> getBookList()
        {
            //string connectString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["mysqlConnectString"].ToString();
            MySqlConnection conn = new MySqlConnection(connectString);
            string sql = "SELECT id, ISBN, serial_code, name, author, publisher_name, publisher_id, publish_date, price, language, status, location_id, is_deleted, sn_code, signal_code from book where is_deleted = 0 limit 20";
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
                    book.Serial_code = Convert.ToString(dr["serial_code"]);
                    book.Name = Convert.ToString(dr["name"]);
                    book.Author = Convert.ToString(dr["author"]);
                    book.Publisher_name = Convert.ToString(dr["publisher_name"]);
                    book.Publisher_id = Convert.ToInt32(dr["publisher_id"]);
                    book.Publish_date = Convert.ToString(dr["publish_date"]);
                    book.Price = Convert.ToString(dr["price"]);
                    book.Language = Convert.ToString(dr["language"]);
                    book.Status = Convert.ToString(dr["status"]);
                    book.Location_id = Convert.ToInt32(dr["location_id"]);
                    book.Is_deleted = Convert.ToBoolean(dr["is_deleted"]);
                    book.Sn_code = Convert.ToString(dr["sn_code"]);
                    book.Signal_code = Convert.ToString(dr["signal_code"]);

                    bookList.Add(book);
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
            return bookList;
        }


        //根据图书条形码获取图书信息
        public book getBookBySerial(string serialCode)
        {
            MySqlDataReader dr;
            book book = new book();
            try
            {
                using (MySqlConnection conn = new MySqlConnection(connectString))
                {
                    string sql = "SELECT id, ISBN, serial_code, name, author, publisher_name, publisher_id, publish_date, price, language, status, is_deleted, sn_code, signal_code from book where is_deleted = 0 and serial_code = {0} order by id desc limit 1;";
                    sql = string.Format(sql, serialCode);
                    MySqlCommand cmd = new MySqlCommand(sql, conn);
                    conn.Open();
                    dr = cmd.ExecuteReader();

                    while (dr.Read())
                    {                
                        book.Id = Convert.ToInt32(dr["id"]);
                        book.ISBN = Convert.ToString(dr["ISBN"]);
                        book.Serial_code = Convert.ToString(dr["serial_code"]);
                        book.Name = Convert.ToString(dr["name"]);
                        book.Author = Convert.ToString(dr["author"]);
                        book.Publisher_name = Convert.ToString(dr["publisher_name"]);
                        book.Publisher_id = Convert.ToInt32(dr["publisher_id"]);
                        book.Publish_date = Convert.ToString(dr["publish_date"]);
                        book.Price = Convert.ToString(dr["price"]);
                        book.Language = Convert.ToString(dr["language"]);
                        book.Status = Convert.ToString(dr["status"]);
                        //book.Location_id = Convert.ToInt32(dr["location_id"]);
                        book.Is_deleted = Convert.ToBoolean(dr["is_deleted"]);
                        book.Sn_code = Convert.ToString(dr["sn_code"]);
                        book.Signal_code = Convert.ToString(dr["signal_code"]);

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
            return book;
        }


        //给图书标识时，根据获取管理员（操作人）的ID获取图书信息， 判断该人是否已经标识过
        //返回值是一个JSON字符串
        public string getSNByOpId(int operId)
        {
            MySqlDataReader dr;
            string SNInfo = "{\"sn_code\": -1}";
            try
            {
                using (MySqlConnection conn = new MySqlConnection(connectString))
                {
                    string sql = "SELECT id, sn_code from book where oper_id = {0} and sn_code is not null order by sn_code desc limit 1;";
                    sql = string.Format(sql, Convert.ToString(operId));
                    MySqlCommand cmd = new MySqlCommand(sql, conn);
                    conn.Open();
                    dr = cmd.ExecuteReader();           
                    while (dr.Read())
                    {
                        SNInfo = "{\"sn_code\":" + Convert.ToString(dr["sn_code"]) + "}";
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
            return SNInfo;
        }


        //根据RFID标识取对应的图书
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


        //查询某一范围内的BOOK
        public List<book> getBookBySNCodeRange(string startSN, string endSN)
        {
            MySqlDataReader dr;
            List<book> bookList = new List<book>();
            try
            {
                using (MySqlConnection conn = new MySqlConnection(connectString))
                {
                    string sql = "select id, sn_code, ISBN, serial_code, name, author, publisher_name, publisher_id, publish_date, price, language, status, location_name, is_deleted from book where is_deleted = 0";
                    if (startSN != "")
                    {
                        sql += " and sn_code >= \"" + startSN + "\"";
                    }
                    if (endSN != "")
                    {
                        sql += " and sn_code <= \"" + endSN + "\"";
                    }

                    MySqlCommand cmd = new MySqlCommand(sql, conn);
                    conn.Open();
                    dr = cmd.ExecuteReader();

                    while (dr.Read())
                    {
                        book book = new book();
                        book.Id = Convert.ToInt32(dr["id"]);
                        book.ISBN = Convert.ToString(dr["ISBN"]);
                        book.Serial_code = Convert.ToString(dr["serial_code"]);
                        book.Name = Convert.ToString(dr["name"]);
                        book.Author = Convert.ToString(dr["author"]);
                        book.Publisher_name = Convert.ToString(dr["publisher_name"]);
                        book.Publisher_id = Convert.ToInt32(dr["publisher_id"]);
                        book.Publish_date = Convert.ToString(dr["publish_date"]);
                        book.Price = Convert.ToString(dr["price"]);
                        book.Language = Convert.ToString(dr["language"]);
                        book.Status = Convert.ToString(dr["status"]);
                       // book.Location_id = Convert.ToInt32(dr["location_id"]);
                        book.Location_name = Convert.ToString(dr["location_name"]);
                        book.Is_deleted = Convert.ToBoolean(dr["is_deleted"]);
                        book.Sn_code = Convert.ToString(dr["sn_code"]);
                        bookList.Add(book);
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
            return bookList;
        }


        //新增一本图书
        public bool addBook(Dictionary<string, string> kv)
        {
            MySqlParameter[] paras =
            {
                     new MySqlParameter("?ISBN", kv["ISBN"]),
                     new MySqlParameter("?serial_code", kv["serial_code"]),
                     new MySqlParameter("?name", kv["name"]),
                     new MySqlParameter("?author", kv["author"]),
                     new MySqlParameter("?publisher_name", kv["publisher_name"]),
                     new MySqlParameter("?publisher_id", kv["publisher_id"]),
                     new MySqlParameter("?publish_date", kv["publish_date"]),
                     new MySqlParameter("?price", kv["price"]),
                     new MySqlParameter("?language",kv["language"]),
                     new MySqlParameter("?status", kv["status"]),
                     new MySqlParameter("?location_id", kv["location_id"]),
                     new MySqlParameter("?index_id", kv["index_id"]),
                     new MySqlParameter("?page_number", kv["page_number"]),
                     new MySqlParameter("?is_deleted", "0"),
                     new MySqlParameter("?signal_code", kv["signal_code"])
            };

            try
            {
                using (MySqlConnection conn = new MySqlConnection(connectString))
                {
                    string sql = "insert into book(ISBN, serial_code, signal_code, name, author, publisher_name, publisher_id, publish_date, price, language, status, location_id, index_id, page_number, is_deleted) values(?ISBN,?serial_code, ?signal_code, ?name,?author,?publisher_name,?publisher_id,?publish_date,?price,?language,?status,?location_id, ?index_id, ?page_number, ?is_deleted)";
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

        public bool updateBookInfoAboutRFID(string snCode, string signalCode, string bookId, string operId)
        {
            int size = signalCode.Length;
            string tmp = "";
            for(int i = size - 2; i >= 0; i -= 2)
            {
                tmp = tmp + signalCode[i] + signalCode[i + 1];
            }
            signalCode = tmp;

            try
            {
                using (MySqlConnection conn = new MySqlConnection(connectString))
                {
                    string sql = "update book set sn_code = \"{0}\", signal_code = \"{1}\", oper_id = {3} where id = {2}";
                    sql = String.Format(sql, snCode, signalCode, bookId, operId);
                    MySqlCommand cmd = new MySqlCommand(sql, conn);
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