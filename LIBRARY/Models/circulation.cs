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

        public int Reader_id
        {
            get;
            set;
        }

        public int Book_id
        {
            get;
            set;
        }

        public string Signal_code
        {
            get;
            set;
        }

        public DateTime Action_time
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