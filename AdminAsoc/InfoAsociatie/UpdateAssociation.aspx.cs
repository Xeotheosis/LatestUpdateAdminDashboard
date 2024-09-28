using BussinesLogic.Services;
using ClassLibraryEntityFrameworkClaseAsProp;
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
    public partial class UpdateAssociation : System.Web.UI.Page
    {
        private readonly AsociatiiService _asociatiiService;

        public UpdateAssociation()
        {
            //var connectionString = ConfigurationManager.ConnectionStrings["AsPropManagerDb"].ConnectionString;
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
                    Response.Redirect("Login.aspx");
                }
            }
        }

        private async Task LoadAssociationDetails(int associationId)
        {
            var association = await _asociatiiService.GetByIdAsync(associationId);
            if (association != null)
            {
                txtDenumire.Text = association.Denumire;
                txtDenScurta.Text = association.denScurta;
                txtAdresa.Text = association.Adresa;
                txtPresedinte.Text = association.Presedinte;
                txtAdministrator.Text = association.Administrator;
                txtCenzor.Text = association.Cenzor;
                txtAnLucru.Text = association.AnLucru;
                txtLunaLucru.Text = association.LunaLucru;
                txtTelefon.Text = association.Telefon;
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
                //var association = new tblAsociatii
                //{
                //    idAsoc = associationId,
                //    Denumire = txtDenumire.Text,
                //    denScurta = txtDenScurta.Text,
                //    Adresa = txtAdresa.Text,
                //    Presedinte = txtPresedinte.Text,
                //    Administrator = txtAdministrator.Text,
                //    Cenzor = txtCenzor.Text,
                //    AnLucru = txtAnLucru.Text,
                //    LunaLucru = txtLunaLucru.Text,
                //    Telefon = txtTelefon.Text
                //    // Set other fields as needed
                //};

                var association = await _asociatiiService.GetByIdAsync(associationId);
                association.Denumire = txtDenumire.Text;
                association.denScurta = txtDenScurta.Text;
                association.Adresa = txtAdresa.Text;
                association.Presedinte = txtPresedinte.Text;
                association.Administrator = txtAdministrator.Text;
                association.Cenzor = txtCenzor.Text;
                association.Telefon = txtTelefon.Text;


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
