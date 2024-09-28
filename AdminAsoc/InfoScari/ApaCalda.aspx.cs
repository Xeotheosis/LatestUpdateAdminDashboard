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
    public partial class ApaCalda : System.Web.UI.Page
    {
        private readonly ApaCaldaService _apaCaldaService;
        private readonly AsociatiiService _asociatiiService;
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
        public ApaCalda()
        {
            var apaCaldaRepository = new ApaCaldaRepository();
            _apaCaldaService  = new ApaCaldaService(apaCaldaRepository);
            var asociatiiRepository = new AsociatiiRepository();
            _asociatiiService = new AsociatiiService(asociatiiRepository);
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
            IEnumerable<tblACM> lista = await _apaCaldaService.GetAllAsync(id);
            gvFactACM.DataSource = lista;
            gvFactACM.DataBind();

            double? total = 0;
            foreach (tblACM tblacm in lista)
            {
                total += tblacm.ValTotACM;
            }

            lblTotal.Text = total.ToString();
        }

        protected async void gvFactACM_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvFactACM.EditIndex = e.NewEditIndex;
            await IncarcaFacturi(AsocID.Value);
        }

        protected async void gvFactACM_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvFactACM.EditIndex = -1;
            await IncarcaFacturi(AsocID.Value);
        }

        protected async void gvFactACM_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            var billId = (int)e.Keys["idFacturaACM"];
            var row = gvFactACM.Rows[e.RowIndex];
            var amountGCALText = ((System.Web.UI.WebControls.TextBox)row.Cells[1].Controls[0]).Text;
            var amountARText = ((System.Web.UI.WebControls.TextBox)row.Cells[2].Controls[0]).Text;
            var association = await _asociatiiService.GetByIdAsync(AsocID.Value);
            if (double.TryParse(amountGCALText, out double amountGCAL) && double.TryParse(amountARText, out double amountAR))
            {
                double? cant;
                double? gcal;

                if (association.PretAR != null && amountAR != 0 && amountGCAL!=0)
                {
                    cant = Math.Round(amountAR / association.PretARptACM.Value, 2);
                    gcal = Math.Round(amountGCAL / association.PretGcal.Value , 4);
                }
                else
                {
                    cant = 0;
                    gcal = 0;
                }

                var bill = new tblACM
                {
                    idFacturaACM  = billId,
                    ValGcal  = amountGCAL ,
                    ValAr  = amountAR ,
                    ValTotACM=amountAR+amountGCAL,
                    m3AR=cant,
                    NrGcal = gcal
                };

                await _apaCaldaService.UpdateAsync(bill);

                lblMessage.Text = "Factura salvata cu succes.";
            }
            else
            {
                lblMessage.Text = "Valoare invalida.";
            }

            gvFactACM.EditIndex = -1;
            await IncarcaFacturi(AsocID.Value);

        }
    }
}