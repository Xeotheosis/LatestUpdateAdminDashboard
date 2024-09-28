using BussinesLogic.Services;
using Data.Repositories;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebAppNet472
{
    public partial class CheltuieliAdministrative : System.Web.UI.Page
    {
        private readonly AsociatiiService _asociatiiService;
        public CheltuieliAdministrative()
        {
            var asociatiiRepository = new AsociatiiRepository();
            _asociatiiService = new AsociatiiService(asociatiiRepository);
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!User.Identity.IsAuthenticated)
            {
                Response.Redirect("Login.aspx");
            }

            if (!IsPostBack)
            {
                int associationId;
                if (int.TryParse(Request.QueryString["idAsoc"], out associationId))
                {
                    var task = new PageAsyncTask(() => LoadAssociationDetails(associationId));
                    Page.RegisterAsyncTask(task);
                }
                else
                {
                    // lblMessage.Text = "Invalid association ID.";
                    Response.Redirect("Login.aspx");
                }
            }
        }


        private async Task LoadAssociationDetails(int associationId)
        {
            var association = await _asociatiiService.GetByIdAsync(associationId);
            if (association != null)
            {
                txtCpiA0den.Text = association.cpia0den;
                //txtCpiA0val.Text = association.cpia0val.ToString();
                txtCpiA1den.Text = association.cpia1den;
                txtCpiA1val.Text = association.cpia1val.ToString();
                txtCpiA2den.Text = association.cpia2den;
                txtCpiA2val.Text = association.cpia2val.ToString();
                txtCpiA3den.Text = association.cpia3den;
                txtCpiA3val.Text = association.cpia3val.ToString();
                txtCpiA4den.Text = association.cpia4den;
                txtCpiA4val.Text = association.cpia4val.ToString();
                // Load other fields as
                txtCpiB0den.Text = association.cpib0den;
                ////txtCpiA0val.Text = association.cpia0val.ToString();
                txtCpiB1den.Text = association.cpib1den;
                txtCpiB1val.Text = association.cpib1val.ToString();
                txtCpiB2den.Text = association.cpib2den;
                txtCpiB2val.Text = association.cpib2val.ToString();
                txtCpiB3den.Text = association.cpib3den;
                txtCpiB3val.Text = association.cpib3val.ToString();
                txtCpiB4den.Text = association.cpib4den;
                txtCpiB4val.Text = association.cpib4val.ToString();
                txtCpiB5den.Text = association.cpib5den;
                txtCpiB5val.Text = association.cpib5val.ToString();
                txtCpiB6den.Text = association.cpib6den;
                txtCpiB6val.Text = association.cpib6val.ToString();
                ////---
                txtCpiC0den.Text = association.cpic0den;
                txtCpiC1den.Text = association.cpic1den;
                txtCpiC1val.Text = association.cpic1val.ToString();
                txtCpiC2den.Text = association.cpic2den;
                txtCpiC2val.Text = association.cpic2val.ToString();
                txtCpiC3den.Text = association.cpic3den;
                txtCpiC3val.Text = association.cpic3val.ToString();
                txtCpiC4den.Text = association.cpic4den;
                txtCpiC4val.Text = association.cpic4val.ToString();
                txtCpiC5den.Text = association.cpic5den;
                txtCpiC5val.Text = association.cpic5val.ToString();

            }
            else
            {
                lblMessage.Text = "Association not found.";
            }
        }

        protected async void btnUpdate_Click(object sender, EventArgs e)
        {
            int associationId;
            if (int.TryParse(Request.QueryString["idAsoc"], out associationId))
            {

                double parsedValue;

                var association = await _asociatiiService.GetByIdAsync(associationId);

                association.cpia0den = txtCpiA0den.Text;


                association.cpia1den = txtCpiA1den.Text;

                if (!double.TryParse(txtCpiA1val.Text, NumberStyles.Float, CultureInfo.InvariantCulture, out parsedValue))
                {
                    lblMessage.Text = "Invalid format 1.";
                    return;
                }
                association.cpia1val = parsedValue;

                association.cpia2den = txtCpiA2den.Text;

                if (!double.TryParse(txtCpiA2val.Text, NumberStyles.Float, CultureInfo.InvariantCulture, out parsedValue))
                {
                    lblMessage.Text = "Invalid format 2.";
                    return;
                }
                association.cpia2val = parsedValue;

                association.cpia3den = txtCpiA3den.Text;

                if (!double.TryParse(txtCpiA3val.Text, NumberStyles.Float, CultureInfo.InvariantCulture, out parsedValue))
                {
                    lblMessage.Text = "Invalid format 3.";
                    return;
                }
                association.cpia3val = parsedValue;

                association.cpia4den = txtCpiA4den.Text;

                if (!double.TryParse(txtCpiA4val.Text, NumberStyles.Float, CultureInfo.InvariantCulture, out parsedValue))
                {
                    lblMessage.Text = "Invalid format 4.";
                    return;
                }
                association.cpia4val = parsedValue;
                 

                association.cpib0den = txtCpiB0den.Text;


                association.cpib1den = txtCpiB1den.Text;

                if (!double.TryParse(txtCpiB1val.Text, NumberStyles.Float, CultureInfo.InvariantCulture, out parsedValue))
                {
                    lblMessage.Text = "Invalid format 1.";
                    return;
                }
                association.cpib1val = parsedValue;

                association.cpib2den = txtCpiB2den.Text;

                if (!double.TryParse(txtCpiB2val.Text, NumberStyles.Float, CultureInfo.InvariantCulture, out parsedValue))
                {
                    lblMessage.Text = "Invalid format 2.";
                    return;
                }
                association.cpib2val = parsedValue;

                association.cpib3den = txtCpiB3den.Text;

                if (!double.TryParse(txtCpiB3val.Text, NumberStyles.Float, CultureInfo.InvariantCulture, out parsedValue))
                {
                    lblMessage.Text = "Invalid format 3.";
                    return;
                }
                association.cpib3val = parsedValue;

                association.cpib4den = txtCpiB4den.Text;

                if (!double.TryParse(txtCpiB4val.Text, NumberStyles.Float, CultureInfo.InvariantCulture, out parsedValue))
                {
                    lblMessage.Text = "Invalid format 4.";
                    return;
                }
                association.cpib4val = parsedValue;

                association.cpib5den = txtCpiB5den.Text;

                if (!double.TryParse(txtCpiB5val.Text, NumberStyles.Float, CultureInfo.InvariantCulture, out parsedValue))
                {
                    lblMessage.Text = "Invalid format 4.";
                    return;
                }
                association.cpib5val = parsedValue;

                association.cpib6den = txtCpiB6den.Text;

                if (!double.TryParse(txtCpiB6val.Text, NumberStyles.Float, CultureInfo.InvariantCulture, out parsedValue))
                {
                    lblMessage.Text = "Invalid format 4.";
                    return;
                }
                association.cpib6val = parsedValue;

                 
                association.cpic0den = txtCpiC0den.Text;


                association.cpic1den = txtCpiC1den.Text;

                if (!double.TryParse(txtCpiC1val.Text, NumberStyles.Float, CultureInfo.InvariantCulture, out parsedValue))
                {
                    lblMessage.Text = "Invalid format 1.";
                    return;
                }
                association.cpic1val = parsedValue;

                association.cpic2den = txtCpiC2den.Text;

                if (!double.TryParse(txtCpiC2val.Text, NumberStyles.Float, CultureInfo.InvariantCulture, out parsedValue))
                {
                    lblMessage.Text = "Invalid format 2.";
                    return;
                }
                association.cpic2val = parsedValue;

                association.cpic3den = txtCpiC3den.Text;

                if (!double.TryParse(txtCpiC3val.Text, NumberStyles.Float, CultureInfo.InvariantCulture, out parsedValue))
                {
                    lblMessage.Text = "Invalid format 3.";
                    return;
                }
                association.cpic3val = parsedValue;

                association.cpic4den = txtCpiC4den.Text;

                if (!double.TryParse(txtCpiC4val.Text, NumberStyles.Float, CultureInfo.InvariantCulture, out parsedValue))
                {
                    lblMessage.Text = "Invalid format 4.";
                    return;
                }
                association.cpic4val = parsedValue;

                association.cpic5den = txtCpiC5den.Text;

                if (!double.TryParse(txtCpiC5val.Text, NumberStyles.Float, CultureInfo.InvariantCulture, out parsedValue))
                {
                    lblMessage.Text = "Invalid format 4.";
                    return;
                }
                association.cpic5val = parsedValue;

                 
                try
                {
                    await _asociatiiService.UpdateAsync(association);
                    lblMessage.Text = "Association updated successfully.";
                }
                catch (Exception ex)
                {
                    lblMessage.Text = "Error updating association: " + ex.Message;
                }
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }

    }
}