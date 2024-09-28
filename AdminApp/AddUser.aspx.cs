using BussinesLogic.Services;
using Data.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebAppNet472
{
    public partial class AddUser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        private readonly UserService _userService;

        public AddUser()
        {
            //var connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["AsPropManagerDb"].ConnectionString;
            var userRepository = new UserRepository( );
            _userService = new UserService(userRepository);
        }

        protected async void btnAddUser_Click(object sender, EventArgs e)
        {
            var username = txtUsername.Text;
            var password = txtPassword.Text;
            var role = ddlRole.SelectedValue;

            try
            {
                await _userService.AddUserAsync(username, password, role);
                lblMessage.Text = "User added successfully.";
                ClearForm();
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error adding user: " + ex.Message;
            }
        }

        private void ClearForm()
        {
            txtUsername.Text = string.Empty;
            txtPassword.Text = string.Empty;
            ddlRole.SelectedIndex = 0;
        }
    }
}