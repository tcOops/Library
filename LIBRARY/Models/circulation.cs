using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LIBRARY.Models
{
    public class circulation
    {
        public int Id
        {
            get;
            set;
        }

        public string Reader_name //
        {
            get;
            set;
        }

        public string Book_id //书的卡号
        {
            get;
            set;
        }

        public string Signal_code //读者卡号
        {
            get;
            set;
        }


        public string Book_name
        {
            get;
            set;
        }

        public string Action_time
        {
            get;
            set;
        }

        public string Action_type
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