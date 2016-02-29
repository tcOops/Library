using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LIBRARY.Models
{
    public class book
    {
        public int Id
        {
            get;
            set;
        }

        public string ISBN
        {
            get;
            set;
        }

        public string Signal_code //RFID 传过来的code
        {
            get;
            set;
        }

        public string Sn_code //RFID标签的序列号
        {
            get;
            set;
        }

        public string Name
        {
            get;
            set;
        }

        public string Author
        {
            get;
            set;
        }

        public string Publisher_name
        {
            get;
            set;
        }

        public int Publisher_id
        {
            get;
            set;
        }

        public string Publish_date
        {
            get;
            set;
        }

        public string Price
        {
            get;
            set;
        }

        public string Language
        {
            get;
            set;
        }

        public string Status
        {
            get;
            set;
        }

        public int Location_id
        {
            get;
            set;
        }

        public string Location_name
        {
            get;
            set;
        }

        public Boolean Is_deleted
        {
            get;
            set;
        }

        public string Serial_code //检索使用
        {
            get;
            set;
        }

        public int Oper_id
        {
            get;
            set;
        }

        public string Op_time
        {
            get;
            set;
        }

        public string Index_id
        {
            get;
            set;
        }

        public int Page_number
        {
            get;
            set;
        }
    }
}
