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
    public partial class Gaze : System.Web.UI.Page
    {
        private readonly GazeService _gazeService;

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
        public Gaze()
        {
            var gazeRepository = new GazeRepository();
            _gazeService = new GazeService(gazeRepository);
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
            IEnumerable<tblGaze> lista = await _gazeService.GetAllAsync(id);
            gvFact.DataSource = lista;
            gvFact.DataBind();

            double? total = 0;
            foreach (tblGaze fact in lista)
            {
                total += fact.Valoare;
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

        protected async  void gvFact_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            var billId = (int)e.Keys["idFactGaze"];
            var row = gvFact.Rows[e.RowIndex];
            var amountText = ((System.Web.UI.WebControls.TextBox)row.Cells[1].Controls[0]).Text;

            if (double.TryParse(amountText, out double amount))
            {


                var bill = new tblGaze
                {
                    idFactGaze = billId,
                    Valoare = amount
                };

                await _gazeService.UpdateAsync(bill);

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