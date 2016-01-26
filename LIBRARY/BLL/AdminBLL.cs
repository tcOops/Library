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
        public int adminLogin(string username, string password)
        {
            AdminDAL adminDAL = new AdminDAL();
            admin admin = adminDAL.getAdminInfo();
            if (admin == null)
            {
                return -1;
            }
            if (username == admin.alias && password == admin.password)
            {
                return admin.id;
            }
            return -1;
        }

        public List<reader> getReaders()
        {
            ReaderDAL readerDAL = new ReaderDAL();
            List<reader> readerList;
            readerList = readerDAL.getReaderList();
            return readerList;
        }

        public reader getReaderInfo(string student_card_number)
        {
            ReaderDAL readerDAL = new ReaderDAL();
            reader reader;
            reader = readerDAL.getReaderInfo(student_card_number);
            return reader;
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

         public bool addBook(Dictionary<string, string> kv)
        {
            bookDAL bookDAL = new bookDAL();
            return bookDAL.addBook(kv);
        }


        public string getDemoRTInfo()
        {
            DoorDAL doorDAL = new DoorDAL();
            List<doorRecord> doorRecordList = doorDAL.getDemoDoorInfo();
            RfidDAL rfidDAL = new RfidDAL();
            List<RFIDRecord> RFIDRecordList = rfidDAL.getDemoRFIDInfo();

            bookDAL bookDAL = new bookDAL();
            ReaderDAL readerDAL = new ReaderDAL();
            string demoInfoInJson = "[";
            bool flag = true;

            //Door_RT_info
            foreach (doorRecord doorRecord in doorRecordList)
            {
                if (!flag)
                {
                    demoInfoInJson += ",";
                }

                string readerName = readerDAL.getReaderNameBySC(doorRecord.Signal_code);
                string each = "{\"action\":\"" + doorRecord.Action + "\",";
                each += "\"reader_name\":\"" + readerName + "\",";
                each += "\"generate_date\":\"" + doorRecord.Generate_date + "\",";
                each += "\"door_ip\":\"" + doorRecord.Door_ip + "\"}";
                demoInfoInJson += each;
                flag = false;
            }


            //RFID_RT_info
            foreach (RFIDRecord RFIDRecord in RFIDRecordList)
            {
                if (!flag)
                {
                    demoInfoInJson += ",";
                }
                string bookName = bookDAL.getbookNameBySC(RFIDRecord.Signal_code);
                string each = "{\"signal_code\":\"" + RFIDRecord.Signal_code + "\",";
                each += "\"book_name\":\"" + bookName + "\",";
                each += "\"action_date\":\"" + RFIDRecord.Action_date + "\",";
                each += "\"ip\":\"" + RFIDRecord.Ip + "\"}";
                demoInfoInJson += each;
                flag = false;
            }

            demoInfoInJson += "]";
            return demoInfoInJson;
        }


        public List<circulation> getCirculations()
        {
            circulationDAL circulationDAL = new circulationDAL();
            List<circulation> circulationList;
            circulationList = circulationDAL.getCirculationList();
            return circulationList;
        }


        public List<Class> getClasses()
        {
            ClassDAL ClassDAL = new ClassDAL();
            List<Class> ClassList;
            ClassList = ClassDAL.getClassList();
            return ClassList;
        }

        public bool addClass(Dictionary<string, string> kv)
        {
            ClassDAL ClassDAL = new ClassDAL();
            return ClassDAL.addClass(kv);
        }

        public List<grade> getGrades()
        {
            GradeDAL GradeDAL = new GradeDAL();
            List<grade> gradeList;
            gradeList = GradeDAL.getGradeList();
            return gradeList;
        }

        public bool addGrade(Dictionary<string, string> kv)
        {
            GradeDAL GradeDAL = new GradeDAL();
            return GradeDAL.addGrade(kv);
        }


        public List<bookstoreLocation> getLocation()
        {
            LocationDAL locationDAL = new LocationDAL();
            List<bookstoreLocation> locationList = new List<bookstoreLocation>();
            locationList = locationDAL.getLocation();
            return locationList;
        }


        public bool addLocation(Dictionary<string, string> kv)
        {
            LocationDAL locationDAL = new LocationDAL();
            return locationDAL.addLocation(kv);
        }
    }
}