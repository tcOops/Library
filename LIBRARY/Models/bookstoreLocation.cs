using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LIBRARY.Models
{
    public class bookstoreLocation
    {
        public int Id
        {
            get;
            set;
        }

        public string Location
        {
            get;
            set;
        }

        public string Door_ip
        {
            get;
            set;
        }

        public int Door_port
        {
            get;
            set;
        }

        public string RFID_ip
        {
            get;
            set;
        }

        public int RFID_port
        {
            get;
            set;
        }
    }
}