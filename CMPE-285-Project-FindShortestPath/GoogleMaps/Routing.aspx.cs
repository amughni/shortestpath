using CMPE_285_Project_FindShortestPath.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CMPE_285_Project_FindShortestPath.Google_Maps
{
    public partial class Routing : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Authenticated"] == null)
            {
                Response.Redirect("~/Login/Login.aspx");
            }
        }

        protected void lnkLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("~/Login/Login.aspx");
        }

        protected void lnkAppointment(object sender, EventArgs e)
        {
            Response.Redirect("~/Services/Appointment.aspx");
        }

         /// <summary>
         /// Algorithm to find the shortest path
         /// </summary>
         /// <param name="routes"></param>
         /// <returns></returns>
         public int GetShortestRoute(Route[] routes)
         {
             List<int> timeDurations = new List<int>();
             foreach (Route route in routes)
             {
                 int trafficDensity = route.trafficDensity;
                 int distance = route.distance;
                 int trafficSpeed = route.trafficSpeed;
                 int timeCoefficient = distance/trafficSpeed;
                 timeDurations.Add(timeCoefficient * trafficDensity);
             }
 
             return GetShortestTime(timeDurations);
         }
 
         /// <summary>
         /// Evaluate shortest time from the given array
         /// </summary>
         /// <param name="durations"></param>
         /// <returns></returns>
         public int GetShortestTime(List<int> durations) 
         {
             int minTime = 0;
             foreach (int duration in durations)
             {
                 if (duration > minTime)
                 {
                     minTime = duration;
                 }
             }
             return minTime;
          }
    }
}