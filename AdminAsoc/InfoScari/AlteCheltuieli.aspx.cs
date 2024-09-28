using BussinesLogic.Services;
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
    public partial class AllteCheltuieli : System.Web.UI.Page
    {
        private readonly ScariService _scariService;
        private readonly AlteCheltuieliService _alteCheltuieliService;
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
                if (int.TryParse(ddlScara.SelectedValue, out int id))
                {
                    return id;
                }
                if (int.TryParse(Request.QueryString["idScara"], out int idSc))
                {
                    return idSc;
                }
                return null;
            }
        }
        public AllteCheltuieli()
        {
            var scariRepository = new ScariRepository();
            _scariService = new ScariService(scariRepository);
            var alteCheltuieliRepository = new AlteCheltuieliRepository();
            _alteCheltuieliService=new AlteCheltuieliService(alteCheltuieliRepository);
        }
        protected async void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack && AsocID.HasValue)
            {
                await IncarcaScari(AsocID.Value);
                
                if(IdScara.HasValue)
                {
                    ddlScara.SelectedValue = IdScara.Value.ToString() ;
                    await IncarcaFacturi(IdScara.Value);
                    
                }
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

        protected async void ddlScara_SelectedIndexChanged(object sender, EventArgs e)
        {
            await IncarcaFacturi(IdScara.Value);
        }

        //private async Task IncarcaFacturi(int id)
        //{
        //    gvFacturi.DataSource= await _alteCheltuieliService.GetAllAsync(id);
        //    gvFacturi.DataBind();
        //}

        private async Task IncarcaFacturi(int id)
        {
            var facturi = await _alteCheltuieliService.GetAllAsync(id);
            lvFacturi.DataSource = facturi;
            lvFacturi.DataBind();

            lblTotal.Text = $"Total: {facturi.Sum(f => f.valoare):F2}"; // Afișăm suma totală a facturilor

        }


        //protected async void gvFacturi_RowDeleting(object sender, GridViewDeleteEventArgs e)
        //{
        //    var idFacturaCG = (int)e.Keys["idFacturaCG"];
        //    await _alteCheltuieliService.DeleteAsync(idFacturaCG);
        //    await IncarcaFacturi(IdScara.Value);

        //}

        protected void btnAddAltaCheltuiala_Click(object sender, EventArgs e)
        {
            if (IdScara.HasValue)
            {
                Response.Redirect("/AdminAsoc/InfoScari/EditareAlteCheltuieli.aspx?idScara=" + IdScara.Value.ToString());
            }
           
        }

        protected async void lvFacturi_ItemDeleting(object sender, ListViewDeleteEventArgs e)
        {
            int idFacturaCG = (int)e.Keys["idFacturaCG"];
            await _alteCheltuieliService.DeleteAsync(idFacturaCG);

            int idScara;
            if (int.TryParse(ddlScara.SelectedValue, out idScara) && idScara > 0)
            {
                await IncarcaFacturi(idScara);
            }
        }
    }
}