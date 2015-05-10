using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(CMPE_285_Project_FindShortestPath.Startup))]
namespace CMPE_285_Project_FindShortestPath
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
