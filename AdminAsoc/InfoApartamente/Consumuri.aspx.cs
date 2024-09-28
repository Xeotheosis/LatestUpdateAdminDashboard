using BussinesLogic.Services;
using ClassLibraryEntityFrameworkClaseAsProp;
using Data.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebAppNet472
{
    public partial class Consumuri : System.Web.UI.Page
    {
        private readonly ScariService _scariService;
        private readonly ApartamentService _apartamentService;
        private int? AsocID
        {
            get
            {
                if (int.TryParse(Request.QueryString["idAsoc"], out int id))
                {
                    return id;
                }
                return null;
            }
        }

        private int? IdScara
        {
            get
            {
                if(int.TryParse(ddlScara.SelectedValue,out int id))
                {
                    return id;
                }
                return null;
            }
        }

        public Consumuri()
        {
            var scariRepository = new ScariRepository();
            _scariService = new ScariService(scariRepository);
            var apartmentRepository = new ApartamentRepository();
            _apartamentService= new ApartamentService(apartmentRepository);
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!User.Identity.IsAuthenticated)
            {
                Response.Redirect("Login.aspx");
            }

            if (!IsPostBack && AsocID.HasValue)
            {
                var task = new PageAsyncTask(() => IncarcaScari(AsocID.Value));
                Page.RegisterAsyncTask(task);
            }

        }

        private async Task IncarcaScari(int id)
        {
            ddlScara.DataSource = await _scariService.GetAllAsync(id);
            ddlScara.DataValueField = "idScara";
            ddlScara.DataTextField = "NumeScara";
            ddlScara.DataBind();
            ddlScara.Items.Insert(0, "Selectati scara!");
            
        }

        private async Task IncarcaApartamente(int idScara)
        {
            IEnumerable<tblApart> lista = await _apartamentService.GetAllByIdScaraAsync(idScara);
            gvApartamente.DataSource = lista;
            gvApartamente.DataBind();
            int NrPersTotal = 0;
            double ConsumARTotal = 0;
            double ConsumACMTotal = 0;
            foreach(tblApart apart in lista)
            {
                NrPersTotal += (int)apart.nrpers;
                ConsumARTotal += apart.consumAR.Value;
                ConsumACMTotal += apart.consumACM.Value;
            }

            lblNrPersTotal.Text = NrPersTotal.ToString();
            lblConsumACMTotal.Text = ConsumACMTotal.ToString();
            lblConsumARTotal.Text = ConsumARTotal.ToString();
        }

        protected async void ddlScara_SelectedIndexChanged(object sender, EventArgs e)
        {
           await  IncarcaApartamente(IdScara.Value);
        }

        protected async  void gvApartamente_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvApartamente.EditIndex = e.NewEditIndex;
            await IncarcaApartamente(IdScara.Value);
        }

        protected async void gvApartamente_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvApartamente.EditIndex = -1;
            await IncarcaApartamente(IdScara.Value);
        }

        protected async void gvApartamente_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            var idApart = (int)e.Keys["idApart"];
            var row = gvApartamente.Rows[e.RowIndex];
            var nrPersText = ((System.Web.UI.WebControls.TextBox)row.Cells[1].Controls[0]).Text;
            var consumARText = ((System.Web.UI.WebControls.TextBox)row.Cells[2].Controls[0]).Text;
            var consumACMText = ((System.Web.UI.WebControls.TextBox)row.Cells[3].Controls[0]).Text;
           
            if (short.TryParse(nrPersText, out short  nrPers) && 
                double.TryParse(consumARText , out double consumAR) &&
                double.TryParse(consumACMText,out double consumACM))
            {


                tblApart apart = await _apartamentService.GetByIdAsync(idApart);
                if (apart != null) 
                {

                    apart.nrpers = nrPers;
                    apart.consumACM = consumACM;
                    apart.consumAR = consumAR;
                };

                await _apartamentService.UpdateAsync(apart );

                lblMessage.Text = "Date salvate cu succes.";
                ScriptManager.RegisterStartupScript(this, GetType(), "SetEditedRowIndex", $"setEditedRowIndex({e.RowIndex});", true);
            }
            else
            {
                lblMessage.Text = "Valoare invalida.";
            }

            gvApartamente .EditIndex = -1;
            await IncarcaApartamente(IdScara.Value);
        }

        //protected void gvApartamente_RowUpdated(object sender, GridViewUpdatedEventArgs e)
        //{
        //    if (e.AffectedRows > 0)
        //    {
        //        foreach (System.Web.UI.WebControls.GridViewRow row in gvApartamente.Rows)
        //        {
        //            if ((int)gvApartamente.DataKeys[row.RowIndex].Value == (int)e.Keys["idApart"])
        //            {
        //                row.Attributes.Add("data-edited", "true");
        //                break;
        //            }
        //        }
        //    }
        //}
    }
}