using CMPE_285_Project_FindShortestPath.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;
using System.Web.Security;
using System.Web.SessionState;

namespace CMPE_285_Project_FindShortestPath
{
    public class Global : HttpApplication
    {
        public static int parkingStatus = 0;
        public static List<Patient> lstPatient = new List<Patient>();

        

        public static List<Appointment> lstAppointment = new List<Appointment>();
        public static List<Doctor> lstDoctor = new List<Doctor>();
        // Code that runs on application startup
        void Application_Start(object sender, EventArgs e)
        {
            AreaRegistration.RegisterAllAreas();
            Entity.Patient oPatient = new Entity.Patient();
            oPatient.address = "Santa Clara";
            oPatient.bloodgroup = "A+";
            oPatient.email = "patient@keiserpermanente.cpm";
            oPatient.name = "Patient Of the year";
            oPatient.phone = "998-998-0938";
            oPatient.history = "998-998-0938";
            oPatient.id = (Global.lstPatient.Count + 1).ToString();
            Global.lstPatient.Add(oPatient);
        }
    }
}