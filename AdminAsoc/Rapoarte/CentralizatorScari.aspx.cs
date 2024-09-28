using BussinesLogic.Services;
using Data.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebAppNet472.Rapoarte
{
    public partial class CentralizatorScari : System.Web.UI.Page
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
        public CentralizatorScari()
        {
            var scariRepository = new ScariRepository();
            _scariService = new ScariService(scariRepository);
        }
        protected async  void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack )
            {
                await  IncarcaCentralizator(35);
                
            }
        }

        private async Task IncarcaCentralizator(int id)
        {
           lvCentralizator.DataSource=await _scariService.GetCentralizatorScariAsync(id);
           lvCentralizator.DataBind();
        }
    }
}