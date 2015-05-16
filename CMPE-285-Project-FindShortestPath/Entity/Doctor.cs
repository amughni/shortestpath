using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CMPE_285_Project_FindShortestPath.Entity
{
    public class Doctor
    {
        public string id { get; set; }

        public string name { get; set; }

        public string specialization { get; set; }

        public string officeHours { get; set; }

        public string department { get; set; }

        public string degree { get; set; }
    }
}