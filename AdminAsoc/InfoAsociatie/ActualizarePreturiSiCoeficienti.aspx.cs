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
    public partial class ActualizarePreturiSiCoeficienti : System.Web.UI.Page
    {
        private readonly AsociatiiService _asociatiiService;
        public ActualizarePreturiSiCoeficienti()
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
                    //lblMessage.Text = "Invalid association ID.";
                    Response.Redirect("Login.aspx");
                }
            }

        }

        private async Task LoadAssociationDetails(int associationId)
        {
            var association = await _asociatiiService.GetByIdAsync(associationId);
            if (association != null)
            {
                txtPretGCAL.Text = association.PretGcal?.ToString("F2", CultureInfo.InvariantCulture);
                txtPretAR.Text = association.PretAR.ToString();
                txtPretARptACM.Text = association.PretARptACM.ToString();
                txtPretARptACMconventii.Text = association.PretARptACMConventii.ToString();
                txtCoefPausalAR.Text = association.CoefPausalAR.ToString();
                txtCoefPausalACM.Text = association.CoefPausaACM.ToString();
                
                // Load other fields as needed
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
               

                var association = await _asociatiiService.GetByIdAsync(associationId);
                //association.PretGcal= double.Parse(txtPretGCAL.Text);

                double parsedValue;

                if (!double.TryParse(txtPretGCAL.Text, NumberStyles.Float, CultureInfo.InvariantCulture, out parsedValue))
                {
                    lblMessage.Text = "Invalid format for PretGcal.";
                    return;
                }
                association.PretGcal = parsedValue;


                if (!double.TryParse(txtPretAR.Text, NumberStyles.Float, CultureInfo.InvariantCulture, out parsedValue))
                {
                    lblMessage.Text = "Invalid format for PretAR.";
                    return;
                }
                association.PretAR = parsedValue;

                if (!double.TryParse(txtPretARptACM.Text, NumberStyles.Float, CultureInfo.InvariantCulture, out parsedValue))
                {
                    lblMessage.Text = "Invalid format for PretARptACM.";
                    return;
                }
                association.PretARptACM = parsedValue;

                if (!double.TryParse(txtPretARptACMconventii.Text, NumberStyles.Float, CultureInfo.InvariantCulture, out parsedValue))
                {
                    lblMessage.Text = "Invalid format for PretARptACMConventii.";
                    return;
                }
                association.PretARptACMConventii = parsedValue;

                if (!double.TryParse(txtCoefPausalAR.Text, NumberStyles.Float, CultureInfo.InvariantCulture, out parsedValue))
                {
                    lblMessage.Text = "Invalid format for CoefPausalAR.";
                    return;
                }
                association.CoefPausalAR = parsedValue;

                if (!double.TryParse(txtCoefPausalACM.Text, NumberStyles.Float, CultureInfo.InvariantCulture, out parsedValue))
                {
                    lblMessage.Text = "Invalid format for CoefPausaACM.";
                    return;
                }
                association.CoefPausaACM = parsedValue;

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
                //lblMessage.Text = "Invalid association ID.";
                Response.Redirect("Login.aspx");
            }
        }

    }
}