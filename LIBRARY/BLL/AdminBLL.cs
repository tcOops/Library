using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using LIBRARY.DAL;
using LIBRARY.Models;

namespace LIBRARY.BLL
{
    public class AdminBLL
    {
        public bool adminLogin(string username, string password)
        {
            bool isSuccess = false;
            AdminDAL adminDAL = new AdminDAL();
            admin admin = adminDAL.getAdminInfo();
            if (admin == null)
            {
                return false;
            }
            if (username == admin.alias && password == admin.password)
            {
                return true;
            }
            return isSuccess;
        }

        public List<reader> getReaders()
        {
            ReaderDAL readerDAL = new ReaderDAL();
            List<reader> readerList;
            readerList = readerDAL.getReaderList();
            return readerList;
        }
        
        public bool addReader(Dictionary<string, string> kv)
        {
            ReaderDAL readerDAL = new ReaderDAL();
            return readerDAL.addReader(kv);
	}

        public List<book> getBooks()
        {
            bookDAL bookDAL = new bookDAL();
            List<book> bookList;
            bookList = bookDAL.getBookList();
            return bookList;
        }
    }
}