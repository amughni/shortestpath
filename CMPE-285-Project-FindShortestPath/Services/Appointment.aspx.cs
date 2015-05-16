using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CMPE_285_Project_FindShortestPath.Services
{
    public partial class Appointment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void submit_Click(object sender, EventArgs e)
        {
            //Response.Write("<script>alert('Appointment booked successfully')</script>");
            

            Message.Text = "Appointment booked successsfully";
        }




        protected void lnkLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("~/Login/Login.aspx");
        }
    }
}