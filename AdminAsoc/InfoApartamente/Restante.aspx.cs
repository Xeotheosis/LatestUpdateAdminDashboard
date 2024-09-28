﻿using BussinesLogic.Services;
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
    public partial class Restante : System.Web.UI.Page
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
                if (int.TryParse(ddlScara.SelectedValue, out int id))
                {
                    return id;
                }
                return null;
            }
        }

        public Restante()
        {
            var scariRepository = new ScariRepository();
            _scariService = new ScariService(scariRepository);
            var apartmentRepository = new ApartamentRepository();
            _apartamentService = new ApartamentService(apartmentRepository);
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

        private async Task IncarcaScari(int idAsoc)
        {
            ddlScara.DataSource = await _scariService.GetAllAsync(idAsoc);
            ddlScara.DataValueField = "idScara";
            ddlScara.DataTextField = "NumeScara";
            ddlScara.DataBind();
            ddlScara.Items.Insert(0, "Selectati scara!");

        }

        protected async void gvApartamente_RowEditing(object sender, GridViewEditEventArgs e)
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
            
            var RestanteText = ((System.Web.UI.WebControls.TextBox)row.Cells[1].Controls[0]).Text;
            var PenalitatiText = ((System.Web.UI.WebControls.TextBox)row.Cells[2].Controls[0]).Text;

            if (double.TryParse(RestanteText , out double Restante) &&
                double.TryParse(PenalitatiText, out double Penalitati))
            {


                tblApart apart = await _apartamentService.GetByIdAsync(idApart);
                if (apart != null)
                {

                    
                    apart.Restante = Restante;
                    apart.Penalitati  = Penalitati;
                };

                await _apartamentService.UpdateAsync(apart);

                lblMessage.Text = "Date salvate cu succes.";
            }
            else
            {
                lblMessage.Text = "Valoare invalida.";
            }

            gvApartamente.EditIndex = -1;
            await IncarcaApartamente(IdScara.Value);

        }

        protected async void ddlScara_SelectedIndexChanged(object sender, EventArgs e)
        {
            await IncarcaApartamente(IdScara.Value);
        }

        private async Task IncarcaApartamente(int idScara)
        {
            IEnumerable<tblApart> lista = await _apartamentService.GetAllByIdScaraAsync(idScara);
            gvApartamente.DataSource = lista;
            gvApartamente.DataBind();            
            double RestanteTotal = 0;
            double PenalitatiTotal = 0;
            foreach (tblApart apart in lista)
            {

                RestanteTotal += apart.Restante.Value;
                PenalitatiTotal  += apart.Penalitati.Value;
            }
            
            lblRestanteTotal.Text = RestanteTotal.ToString();
            lblPenalitatiTotal.Text = PenalitatiTotal.ToString();
        }
    }
}