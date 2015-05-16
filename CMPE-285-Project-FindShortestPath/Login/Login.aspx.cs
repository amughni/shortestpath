using MongoDB.Driver;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CMPE_285_Project_FindShortestPath.Login
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LoginCtrl_Authenticate(object sender, AuthenticateEventArgs e)
        {
            try
            {
                GetCollection();
            }
            catch (Exception ee)
            {
                //
            }
        }

        public void GetCollection()
        {
            string username = LoginCtrl.UserName;
            string password = LoginCtrl.Password;

            var connectionString = ConfigurationManager.AppSettings["connectionString"];
            var mongoClient = new MongoClient(connectionString);

            var db = mongoClient.GetDatabase("cmpe285project");

            var collection = db.GetCollection<LoginInfo>("login");

            var users = collection.Find(x => x.username == username && x.password == password).ToListAsync();

            if (users != null)
            {
                Session["Authenticated"] = "true";
                Response.Redirect("~/GoogleMaps/Routing.aspx");
            }
            else
                throw new Exception("Invalid username or password.");
        }

        public class LoginInfo
        {
            public string username { get; set; }

            public string password { get; set; }
        }
    }
}