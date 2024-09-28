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
    public partial class ApaPluviala : System.Web.UI.Page
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
        public ApaPluviala()
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
                total += scara.cpp2asoc;
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
            var amountText = ((System.Web.UI.WebControls.TextBox)row.Cells[1].Controls[0]).Text;
          
            if (double.TryParse(amountText, out double amount))
            { 
                 

                var bill = await _scariService.GetByIdAsync(billId);
                bill.cpp2asoc = amount;

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