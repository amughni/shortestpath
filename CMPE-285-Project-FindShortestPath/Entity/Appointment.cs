using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CMPE_285_Project_FindShortestPath.Entity
{
    public class Appointment
    {
        public string doctor_id { get; set; }

        public string patient { get; set; }

        public string time { get; set; }
    }
}