using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LIBRARY.Models
{
    public class publisher
    {
        public int Id
        {
            get;
            set;
        }

        public string Name
        {
            get;
            set;
        }

        public string Location
        {
            get;
            set;
        }

        public string Shortcut
        {
            get;
            set;
        }

        public DateTime Generate_date
        {
            get;
            set;
        }
    }
}