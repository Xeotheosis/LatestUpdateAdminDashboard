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

namespace WebAppNet472.AdminAsoc.InfoScari
{
    public partial class AltaFacturaCPI : System.Web.UI.Page
    {
        private readonly ScariService _scariService;
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
        public AltaFacturaCPI()
        {
           var scariRepository = new ScariRepository();
           _scariService = new ScariService(scariRepository);
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack && AsocID.HasValue)
            {
                var task = new PageAsyncTask(() => IncarcaFacturi(AsocID.Value));
                Page.RegisterAsyncTask(task);
            }
        }

        private async Task IncarcaFacturi(int id)
        {
            IEnumerable<tblScari> lista = await _scariService.GetAllAsync(id);
            gvFact.DataSource = lista;
            gvFact.DataBind();

            double? total = 0;

            foreach (tblScari scara in lista)
            {
                total += scara.cpiscara3val;
            }

            lblTotal.Text = total.ToString();
        }

        protected async void gvFact_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvFact.EditIndex = e.NewEditIndex;
            await IncarcaFacturi(AsocID.Value);
        }

        protected async void gvFact_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvFact.EditIndex = -1;
            await IncarcaFacturi(AsocID.Value);
        }

        protected async void gvFact_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            var billId = (int)e.Keys["idScara"];
            var row = gvFact.Rows[e.RowIndex];
            var denumire = ((System.Web.UI.WebControls.TextBox)row.Cells[1].Controls[0]).Text;
            var amountText = ((System.Web.UI.WebControls.TextBox)row.Cells[2].Controls[0]).Text;

            if (double.TryParse(amountText, out double amount) && denumire.Length > 0)
            {

                tblScari bill = await _scariService.GetByIdAsync(billId);
                bill.cpiscara3val = amount;
                bill.cpiscara3den = denumire;

                await _scariService.UpdateAsync(bill);

                lblMessage.Text = "Factura salvata cu succes.";
            }
            else
            {
                lblMessage.Text = "Valoare invalida.";
            }

            gvFact.EditIndex = -1;
            await IncarcaFacturi(AsocID.Value);
        }
    }
}