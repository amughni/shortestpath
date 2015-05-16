using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CMPE_285_Project_FindShortestPath.Entity
{
    public class Patient
    {
        public string id { get; set; }

        public string name { get; set; }

        public string email { get; set; }

        public string phone { get; set; }

        public string address { get; set; }

        public string history { get; set; }

        public string bloodgroup { get; set; }
    }
}