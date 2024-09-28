using BussinesLogic.Services;
using Data.Repositories;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebAppNet472
{
    public partial class Login : System.Web.UI.Page
    {
        private readonly UserService _userService;
        private readonly AccessLogService _accessLogService;

        public Login()
        {
            //var connectionString = ConfigurationManager.ConnectionStrings["AsPropManagerDb"].ConnectionString;
            var userRepository = new UserRepository();
            var accessLogRepository = new AccessLogRepository();
            _userService = new UserService(userRepository);
            _accessLogService = new AccessLogService(accessLogRepository);
        }

        protected async void btnLogin_Click(object sender, EventArgs e)
        {
            var utilizator = txtLoginUserName.Text;
            var parola = txtLoginPassword.Text;

            var user = await _userService.ValidateUserAsync(utilizator, parola);
            if (user != null)
            {
                FormsAuthentication.SetAuthCookie(user.UserName , true);
                await _accessLogService.LogAccessAsync(user.UserId, user.UserName , "Login", $"User '{utilizator}' successfully logged with role '{user.Role}'.");
                RedirectUserBasedOnRole(user.Role);
            }
            else
            {
                lblMessage.Text = "Invalid username or password.";
            }
        }

        private void RedirectUserBasedOnRole(string role)
        {
            switch (role)
            {
                case "AdministratorAplicatie":
                    Response.Redirect("~/AdminApp/AdminApp.aspx");
                    break;
                case "AdministratorAsociatie":
                    Response.Redirect("~/AdminAsoc/AdminAsocDashboard.aspx");
                    break;
                case "Locatar":
                    Response.Redirect("~/Tenant/Resident.aspx");
                    break;
                default:
                    Response.Redirect("Default.aspx");
                    break;
            }
        }
    }
}