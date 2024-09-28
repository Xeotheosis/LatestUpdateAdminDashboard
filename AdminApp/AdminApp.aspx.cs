using BussinesLogic.Services;
using Data.Models;
using Data.Repositories;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebAppNet472
{
    public partial class AdminApp : System.Web.UI.Page
    {
        private readonly AssociationService _associationService;
        private readonly UserService _userService;
        private readonly AccessLogService _accessLogService;
        private readonly ErrorLogService _errorLogService;

        private const int PageSize = 50;
        private int _accessLogsPageIndex = 0;
        private int _errorLogsPageIndex = 0;

        public AdminApp()
        {
            //var connectionString = ConfigurationManager.ConnectionStrings["AsPropManagerDb"].ConnectionString;
            var associationRepository = new AssociationRepository();
            var userRepository = new UserRepository();
            var accessLogRepository = new AccessLogRepository();
            var errorLogRepository = new ErrorLogRepository();
            _associationService = new AssociationService(associationRepository);
            _userService = new UserService(userRepository);
            _accessLogService = new AccessLogService(accessLogRepository);
            _errorLogService = new ErrorLogService(errorLogRepository);
        }

        protected async void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                await LoadUsers();
                await LoadAccessLogs();
                await LoadErrorLogs();
            }
        }

        private async Task LoadUsers()
        {
            var users =  _userService.GetUsersByRole("AdministratorAsociatie").ToList();
            gvUsers.DataSource = users;
            gvUsers.DataBind();
        }

        private async Task LoadAccessLogs()
        {
            var accessLogs = await _accessLogService.GetAccessLogsAsync(DateTime.UtcNow.AddDays(-7), DateTime.UtcNow, _accessLogsPageIndex, PageSize);
            gvAccessLogs.DataSource = accessLogs;
            gvAccessLogs.DataBind();
        }

        private async Task LoadErrorLogs()
        {
            var errorLogs = await _errorLogService.GetErrorLogsAsync(_errorLogsPageIndex, PageSize);
            gvErrorLogs.DataSource = errorLogs;
            gvErrorLogs.DataBind();
        }

        protected async void btnAddUser_Click(object sender, EventArgs e)
        {
            var username = txtUsername.Text;
            var password = txtPassword.Text;
            var role = "AdministratorAsociatie";

            try
            {
                await _userService.AddUserAsync(username, password, role);
                lblUserMessage.Text = "User added successfully.";
                await LoadUsers();
                ClearUserForm();
            }
            catch (Exception ex)
            {
                lblUserMessage.Text = "Error adding user: " + ex.Message;
            }
        }

        protected async void gvUsers_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            var userId = (int)gvUsers.DataKeys[e.RowIndex].Value;
            //int userId=  (int)e.Row.DataItem["ID"];

            try
            {
                await _userService.DeleteUserAsync(userId);
                lblUserMessage.Text = "User deleted successfully.";
                await LoadUsers();
            }
            catch (Exception ex)
            {
                lblUserMessage.Text = "Error deleting user: " + ex.Message;
            }
        }

        private void ClearUserForm()
        {
            txtUsername.Text = string.Empty;
            txtPassword.Text = string.Empty;
        }

        protected async void btnPreviousAccessLogs_Click(object sender, EventArgs e)
        {
            if (_accessLogsPageIndex > 0)
            {
                _accessLogsPageIndex--;
                await LoadAccessLogs();
            }
        }

        protected async void btnNextAccessLogs_Click(object sender, EventArgs e)
        {
            _accessLogsPageIndex++;
            await LoadAccessLogs();
        }

        protected async void btnPreviousErrorLogs_Click(object sender, EventArgs e)
        {
            if (_errorLogsPageIndex > 0)
            {
                _errorLogsPageIndex--;
                await LoadErrorLogs();
            }
        }

        protected async void btnNextErrorLogs_Click(object sender, EventArgs e)
        {
            _errorLogsPageIndex++;
            await LoadErrorLogs();
        }

        protected async void gvErrorLogs_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            var logId = (int)gvErrorLogs.DataKeys[e.RowIndex].Value;

            try
            {
                await _errorLogService.DeleteErrorLogAsync(logId);
                lblUserMessage.Text = "Error log deleted successfully.";
                await LoadErrorLogs();
            }
            catch (Exception ex)
            {
                lblUserMessage.Text = "Error deleting error log: " + ex.Message;
            }
        }
    }



}