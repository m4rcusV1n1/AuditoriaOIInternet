using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(AuditoriaInternetok.Startup))]
namespace AuditoriaInternetok
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
