using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LIBRARY.Models
{
    public class RFIDRecord
    {
        public int Id
        {
            get;
            set;
        }

        public string Action_date
        {
            get;
            set;
        }

        public string Signal_code
        {
            get;
            set;
        }

        public string Ip
        {
            get;
            set;
        }

        public Boolean Is_deleted
        {
            get;
            set;
        }
    }
}