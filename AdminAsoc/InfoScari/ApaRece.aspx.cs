using BussinesLogic.Services;
using Data.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Threading.Tasks;
using ClassLibraryEntityFrameworkClaseAsProp;
using Data.Models;
using System.Threading;

namespace WebAppNet472
{
    public partial class ApaRece : System.Web.UI.Page
    {
        private readonly ApaReceService  _apaReceService;
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
        public ApaRece()
        {
            var apaReceRepository = new ApaReceRepository();
            _apaReceService = new ApaReceService(apaReceRepository);
            var asociatiiRepository = new AsociatiiRepository();
            _asociatiiService = new AsociatiiService(asociatiiRepository);
        }
        protected  void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack && AsocID.HasValue)
            {
     
                    var task = new PageAsyncTask(() => IncarcaFacturi(AsocID.Value));
                    Page.RegisterAsyncTask(task);
            }           
        }

        private async Task IncarcaFacturi(int id)
        {
            IEnumerable<tblAR> lista = await _apaReceService.GetAllAsync(id);
            gvFactAr.DataSource = lista;
            gvFactAr.DataBind();

            double? total = 0;
            foreach (tblAR tblar in lista)
            {
                total += tblar.ValoareFaraApaMeteo;
            }

            lblTotalAR.Text = total.ToString();

        }

        protected async void gvFactAr_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvFactAr.EditIndex = e.NewEditIndex;
            await  IncarcaFacturi(AsocID.Value);
        }

        protected async void gvFactAr_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvFactAr.EditIndex = -1;
            await IncarcaFacturi(AsocID.Value) ;
        }

        protected async void gvFactAr_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            var billId = (int)e.Keys["idFactAr"];
            var row = gvFactAr.Rows[e.RowIndex];
            var amountText = ((System.Web.UI.WebControls.TextBox)row.Cells[2].Controls[0]).Text;
            var association = await _asociatiiService.GetByIdAsync(AsocID.Value);
            if (double.TryParse(amountText, out double amount))
            {
                double? cant;
                if (association.PretAR != null  && amount!=0)
                {                  
                    cant = Math.Round(amount/ association.PretAR.Value,2);
                }
                else
                {
                    cant = 0;  
                }

                var bill = new tblAR
                {
                    idFactAR = billId,
                    ValoareFaraApaMeteo = amount,
                    m3 = cant
                };

                await _apaReceService.UpdateAsync(bill);

                lblMessage.Text = "Factura salvata cu succes.";
            }
            else
            {
                lblMessage.Text = "Valoare invalida.";
            }

            gvFactAr.EditIndex = -1;
            await IncarcaFacturi(AsocID.Value);
        }
    }
}