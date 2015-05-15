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
            GetCollection();
        }

        protected async void GetCollection()
        {
            string username = LoginCtrl.UserName;
            string password = LoginCtrl.Password;

            var connectionString = ConfigurationManager.AppSettings["connectionString"];
            var mongoClient = new MongoClient(connectionString);

            var db = mongoClient.GetDatabase("cmpe285project");

            var collection = db.GetCollection<Login>("login");

            var users = await collection.Find(x => x.username == username && x.password == password).ToListAsync();
        }

        public class Login
        {
            public string username { get; set; }

            public string password { get; set; }
        }
    }
}