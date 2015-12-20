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

        public string Signal_code
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

        public double Price
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

        public Boolean Is_deleted
        {
            get;
            set;
        }
    }
}
