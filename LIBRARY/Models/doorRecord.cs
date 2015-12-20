using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LIBRARY.Models
{
    public class doorRecord
    {
        public int Id
        {
            get;
            set;
        }

        public string Action
        {
            get;
            set;
        }

        public string Action_date
        {
            get;
            set;
        }

        public string Door_ip
        {
            get;
            set;
        }

        public string Generate_date
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