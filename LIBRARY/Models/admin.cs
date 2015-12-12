using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LIBRARY.Models
{
    public class admin
    {
        public int id
        {
            get;
            set;
        }

        public string name
        {

            get;
            set;
        }

        public string alias
        {
            get;
            set;
        }

        public string password
        {
            get;
            set;
        }

        public DateTime generate_date
        {
            get;
            set;
        }


        public Boolean is_deleted
        {
            get;
            set;
        }
    }
}