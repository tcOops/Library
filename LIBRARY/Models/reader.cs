using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LIBRARY.Models
{
    public class reader
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

        public string Sex
        {
            get;
            set;
        }

        public int Class_id
        {
            get;
            set;
        }

        public string Student_code
        {
            get;
            set;
        }

        public string Student_card_number
        {
            get;
            set;
        }

        public string Password
        {
            get;
            set;
        }

        public int Role_id
        {
            get;
            set;
        }

        public string Reader_status
        {
            get;
            set;
        }

        public DateTime Generate_date
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