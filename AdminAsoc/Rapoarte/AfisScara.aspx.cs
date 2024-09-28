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
    public partial class AfisScara : System.Web.UI.Page
    {
        private readonly ApartamentService _apartamentService;
        private readonly ScariService _scariService;
        private int? IdScara
        {
            get
            {
                if (int.TryParse(Request.QueryString["idScara"], out int id))
                {
                    return id;
                }
                return null;
            }
        }
        public AfisScara()
        {
            var apartmentRepository = new ApartamentRepository();
            _apartamentService = new ApartamentService(apartmentRepository);
            var scariRepository = new ScariRepository();
            _scariService = new ScariService(scariRepository);
        }
        protected async  void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack&&IdScara.HasValue)
            {
                await LoadApartamente(IdScara.Value);
            }
        }

        private async Task LoadApartamente(int id)
        {
            lvAfis.DataSource = await _apartamentService.GetAllByIdScaraAsync(id);
            lvAfis.DataBind();  
        }
    }
}