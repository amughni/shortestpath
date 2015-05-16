using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CMPE_285_Project_FindShortestPath.Entity;

namespace CMPE_285_Project_FindShortestPath.Services
{
    public partial class Patient : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            viewClient.Visible = false;
        }

        protected void btnAddPatient_Click(object sender, EventArgs e)
        {
            btnAddPatient.Visible = false;
            btnAdd.Visible = true;
            editClient.Visible = true;
        }

        protected void btnViewPatient_Click(object sender, EventArgs e)
        {
            btnAddPatient.Visible = true;
            btnAdd.Visible = false;
            editClient.Visible = false;
            viewClient.Visible = true;
            string innerHTML = "<div class=\"row\"><table padding=\"4\" border=\"1\" style=\"border:1px solid #fff\"><tr> <td>ID</td>  <td>Name</td>  <td>Email</td>  <td>Phone</td>  <td>History</td>  <td>Blood Group</td> </tr>";
            for(int i=0;i<Global.lstPatient.Count;i++)
            {
                innerHTML += "<tr> <td>" + Global.lstPatient[i].id + "</td>  <td>" + Global.lstPatient[i].name + "</td>  <td>" + Global.lstPatient[i].email + "</td>  <td>" + Global.lstPatient[i].phone + "</td>  <td>" + Global.lstPatient[i].history + "</td>  <td>" + Global.lstPatient[i].bloodgroup + "</td> </tr>";
            }
            innerHTML += "</table></div>";
            viewClient.InnerHtml = innerHTML;
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            btnAddPatient.Visible = true;
            btnAdd.Visible = false;
            editClient.Visible = false;
            Entity.Patient oPatient = new Entity.Patient();
            oPatient.address = patientAddress.Text;
            oPatient.bloodgroup = patientBloodGroup.Text;
            oPatient.email = patientEmail.Text;
            oPatient.name = patientName.Text;
            oPatient.phone = patientName.Text;
            oPatient.history = patientHistory.Text;
            oPatient.id = (Global.lstPatient.Count + 1).ToString();
            Global.lstPatient.Add(oPatient);
            Response.Write("<script>alert('Added Successfully')<script>");
        }

        protected void lnkLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("~/Login/Login.aspx");
        }
    }
}