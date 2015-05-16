using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CMPE_285_Project_FindShortestPath.Services
{
    public partial class Parking : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            refreshtable();
        }

        protected void btnCarIn_Click(object sender, EventArgs e)
        {
            if (Global.parkingStatus != 40)
            {
                Global.parkingStatus++;
            } 
            refreshtable();
        }

        protected void btnCarOut_Click(object sender, EventArgs e)
        {
            if (Global.parkingStatus!=-1)
            { 
            Global.parkingStatus--;
            } 
            refreshtable(); 
        }

        public void refreshtable()
        {
            string strHtmlContent = "<table>";
            int count = 0;
            string strtd;
            for (int i = 0; i < 2; i++)
            {
                strHtmlContent += "<tr>";
                for (int j = 0; j < 20; j++)
                {
                    if (count > Global.parkingStatus)
                    {
                        strtd = "<td style=\"background-color:green; padding:15px\">" + (count+1).ToString() + "</td>";
                    }
                    else
                    {
                        strtd = "<td style=\"background-color:red; padding:15px\">" + (count + 1).ToString() + "</td>";
                    }
                    count++;
                    strHtmlContent += strtd;
                }
                strHtmlContent += "</tr>";
            }
            strHtmlContent += "</table>";
            viewAppointment.InnerHtml = strHtmlContent;
        }
    }
}