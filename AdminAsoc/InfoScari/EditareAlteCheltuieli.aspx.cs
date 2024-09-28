using BussinesLogic.Services;
using ClassLibraryEntityFrameworkClaseAsProp;
using Data.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebAppNet472.AdminAsoc.InfoScari
{
    public partial class EditareAlteCheltuieli : System.Web.UI.Page
    {
        private readonly ScariService _scariService;
        private readonly AlteCheltuieliService _alteCheltuieliService;
        private readonly ApartamentService _apartamenteService;

        private int? IdScara => int.TryParse(Request.QueryString["idScara"], out int idScara) ? idScara : (int?)null;
        private int? IdFacturaCG => int.TryParse(Request.QueryString["idFacturaCG"], out int idFacturaCG) ? idFacturaCG : (int?)null;

        public EditareAlteCheltuieli()
        {
            _scariService = new ScariService(new ScariRepository());
            _alteCheltuieliService = new AlteCheltuieliService(new AlteCheltuieliRepository());
            _apartamenteService = new ApartamentService(new ApartamentRepository());
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (IdFacturaCG.HasValue)
                {
                    var task = new PageAsyncTask(() => IncarcaFactura(IdFacturaCG.Value));
                    Page.RegisterAsyncTask(task);
                }
                else if (IdScara.HasValue)
                {
                    var task = new PageAsyncTask(() => IncarcaApartamente(IdScara.Value));
                    Page.RegisterAsyncTask(task);
                }
            }
        }

        private async Task IncarcaApartamente(int idScara)
        {
            lvApartamente.DataSource = await _apartamenteService.GetAllByIdScaraAsync(idScara);
            lvApartamente.DataBind();
        }

        private async Task IncarcaFactura(int idFactura)
        {
            tblCG factura = await _alteCheltuieliService.GetByIdAsync(idFactura);

            txtFactura.Text = factura.FacturaCG;
            txtExplicatie.Text = factura.explicatie;
            txtValoareFactura.Text = factura.valoare.ToString();
            ddlTipRepartizare.SelectedValue = factura.tiprepartizare.ToString().ToLower();

            await IncarcaApartamente(factura.idScara);
            await SelectCheckboxesBasedOnDataKeysAsync(factura.Repartizare, lvApartamente);
            SetCheckAllCheckboxState();
        }

        public static async Task SelectCheckboxesBasedOnDataKeysAsync(string idsString, ListView listView)
        {
            var ids = idsString.Split(',')
                               .Where(id => !string.IsNullOrWhiteSpace(id) && int.TryParse(id, out _))
                               .Select(int.Parse)
                               .ToList();

            foreach (ListViewItem item in listView.Items)
            {
                var checkbox = item.FindControl("chkSelectat") as CheckBox;
                if (checkbox != null)
                {
                    int dataKey = (int)listView.DataKeys[item.DataItemIndex].Value;
                    checkbox.Checked = ids.Contains(dataKey);
                }
            }
        }

        public static string GetSelectedCheckboxesIdsString(ListView listView)
        {
            var selectedIds = new StringBuilder();

            foreach (ListViewItem item in listView.Items)
            {
                var checkbox = item.FindControl("chkSelectat") as CheckBox;
                if (checkbox != null && checkbox.Checked)
                {
                    int dataKey = (int)listView.DataKeys[item.DataItemIndex].Value;
                    selectedIds.Append($"{dataKey},");
                }
            }

            return selectedIds.ToString().TrimEnd(',');
        }

        public static string GetSelectedCheckboxesLabelsString(ListView listView)
        {
            var selectedLabels = new StringBuilder();

            foreach (ListViewItem item in listView.Items)
            {
                var checkbox = item.FindControl("chkSelectat") as CheckBox;
                var label = item.FindControl("lblNr") as Label;

                if (checkbox != null && checkbox.Checked && label != null)
                {
                    if (selectedLabels.Length > 0)
                    {
                        selectedLabels.Append(", ");
                    }
                    selectedLabels.Append(label.Text);
                }
            }

            return selectedLabels.ToString();
        }

        protected async void btnSalveaza_Click(object sender, EventArgs e)
        {
            if (double.TryParse(txtValoareFactura.Text, out var valoareFactura))
            {
                tblCG factura;
                int idScara;
                int idAsoc;

                if (IdFacturaCG.HasValue)
                {
                    factura = await _alteCheltuieliService.GetByIdAsync(IdFacturaCG.Value);
                    factura = FacturaDinFormular(factura);
                    await _alteCheltuieliService.UpdateAsync(factura);
                }
                else
                {
                    factura = FacturaDinFormular(new tblCG());
                    await _alteCheltuieliService.AddAsync(factura);
                }

                tblScari scara = await _scariService.GetByIdAsync(factura.idScara);
                idScara = scara.idScara;
                idAsoc = scara.idAsoc;

                Response.Redirect($"/AdminAsoc/InfoScari/AlteCheltuieli.aspx?idAsoc={idAsoc}&idScara={idScara}");
            }
            else
            {
                lblMesaj.Text = "Valoare invalida!";
            }
        }

        private tblCG FacturaDinFormular(tblCG factura)
        {
            if (double.TryParse(txtValoareFactura.Text, out double valoare))
            {
                factura.valoare = valoare;
            }

            factura.FacturaCG = txtFactura.Text;
            factura.explicatie = txtExplicatie.Text;
            factura.tiprepartizare = bool.Parse(ddlTipRepartizare.SelectedValue);
            factura.Repartizare = GetSelectedCheckboxesIdsString(lvApartamente);
            factura.Apartamente = GetSelectedCheckboxesLabelsString(lvApartamente);

            if (IdScara.HasValue)
            {
                factura.idScara = IdScara.Value;
            }

            return factura;
        }

        protected void chkAll_CheckedChanged(object sender, EventArgs e)
        {
            if (chkAll.Checked)
            {
                CheckAllCheckboxes(lvApartamente);
            }
            else
            {
                UncheckAllCheckboxes(lvApartamente);
            }
        }

        public static void CheckAllCheckboxes(ListView listView)
        {
            foreach (ListViewItem item in listView.Items)
            {
                var checkbox = item.FindControl("chkSelectat") as CheckBox;
                if (checkbox != null)
                {
                    checkbox.Checked = true;
                }
            }
        }

        public static void UncheckAllCheckboxes(ListView listView)
        {
            foreach (ListViewItem item in listView.Items)
            {
                var checkbox = item.FindControl("chkSelectat") as CheckBox;
                if (checkbox != null)
                {
                    checkbox.Checked = false;
                }
            }
        }

        public static bool AreAllCheckboxesChecked(ListView listView)
        {
            foreach (ListViewItem item in listView.Items)
            {
                var checkbox = item.FindControl("chkSelectat") as CheckBox;
                if (checkbox != null && !checkbox.Checked)
                {
                    return false;
                }
            }
            return true;
        }

        protected void chkSelectat_CheckedChanged(object sender, EventArgs e)
        {
            var checkAllCheckbox = FindControl("chkAll") as CheckBox;
            if (checkAllCheckbox != null)
            {
                checkAllCheckbox.Checked = AreAllCheckboxesChecked(lvApartamente);
            }
        }

        private void SetCheckAllCheckboxState()
        {
            var checkAllCheckbox = FindControl("chkAll") as CheckBox;
            if (checkAllCheckbox != null)
            {
                checkAllCheckbox.Checked = AreAllCheckboxesChecked(lvApartamente);
            }
        }
    }
    //public partial class EditareAlteCheltuieli : System.Web.UI.Page
    //{
    //    private readonly ScariService _scariService;
    //    private readonly AlteCheltuieliService _alteCheltuieliService;
    //    private readonly ApartamentService _apatamenteService;
    //    private int? IdScara
    //    {
    //        get
    //        {
    //            if (int.TryParse(Request.QueryString["idScara"], out int id))
    //            {
    //                return id;
    //            }
    //            return null;
    //        }
    //    }
    //    private int? IdFacturaCG
    //    {
    //        get
    //        {
    //            if (int.TryParse(Request.QueryString["idFacturaCG"], out int id))
    //            {
    //                return id;
    //            }
    //            return null;
    //        }
    //    }


    //    public EditareAlteCheltuieli()
    //    {
    //        var scariRepository = new ScariRepository();
    //        _scariService = new ScariService(scariRepository);
    //        var alteCheltuieliRepository = new AlteCheltuieliRepository();
    //        _alteCheltuieliService = new AlteCheltuieliService(alteCheltuieliRepository);
    //        var apartamentRepository= new ApartamentRepository();
    //        _apatamenteService= new ApartamentService(apartamentRepository);
    //    }
    //    protected void Page_Load(object sender, EventArgs e)
    //    {
    //        if (!IsPostBack && IdFacturaCG.HasValue)
    //        {
    //            var task = new PageAsyncTask(() => IncarcaFactura(IdFacturaCG.Value));
    //            Page.RegisterAsyncTask(task);
    //        }
    //        if(!IsPostBack && !IdFacturaCG.HasValue && IdScara.HasValue)
    //        {
    //            var task = new PageAsyncTask(() => IncarcaApartamente(IdScara.Value));
    //            Page.RegisterAsyncTask(task);

    //        }

    //    }

    //    private async Task IncarcaApartamente(int idScara)
    //    {
    //        lvApartamente.DataSource= await _apatamenteService.GetAllByIdScaraAsync(idScara); 
    //        lvApartamente.DataBind();


    //    }

    //    private async Task IncarcaFactura(int idFactura)
    //    {
    //        tblCG factura= await _alteCheltuieliService.GetByIdAsync(idFactura);

    //        txtFactura.Text = factura.FacturaCG.ToString();
    //        txtExplicatie.Text = factura.explicatie;
    //        txtValoareFactura.Text=factura.valoare.ToString();
    //        ddlTipRepartizare.SelectedValue=factura.tiprepartizare.ToString().ToLower();
    //        await  IncarcaApartamente(factura.idScara);
    //        await  SelectCheckboxesBasedOnDataKeysAsync(factura.Repartizare, lvApartamente);
    //        SetCheckAllCheckboxState();
    //    }
    //    public static async Task SelectCheckboxesBasedOnDataKeysAsync(string idsString, ListView listView)
    //    {
    //        // Extragem id-urile din șirul de elemente
    //        var ids = idsString.Split(',')
    //                      .Where(id => !string.IsNullOrWhiteSpace(id) && int.TryParse(id, out _))
    //                      .Select(id => int.Parse(id))
    //                      .ToList();


    //        // Iterăm prin toate item-urile din ListView
    //        for (int i = 0; i < listView.Items.Count; i++)
    //        { 
    //            var item = listView.Items[i];
    //            var checkbox = item.FindControl("chkSelectat") as CheckBox;
    //            if (checkbox != null)
    //            {
    //                int dataKey = (int)listView.DataKeys[i].Value;

    //                // Verificăm dacă valoarea DataKey este în lista de id-uri
    //                if (ids.Contains(dataKey))
    //                {
    //                    checkbox.Checked = true;
    //                }

    //            }
    //        }
    //    }


    //    //protected void chkAll_CheckedChanged(object sender, EventArgs e)
    //    //{

    //    //}

    //    public static string GetSelectedCheckboxesIdsString(ListView listView)
    //    {
    //        var selectedIds = new StringBuilder();

    //        for (int i = 0; i < listView.Items.Count; i++)
    //        {
    //            var item = listView.Items[i];
    //            var checkbox = item.FindControl("chkSelectat") as CheckBox;
    //            if (checkbox != null && checkbox.Checked)
    //            {
    //                int dataKey = (int)listView.DataKeys[i].Value;
    //                selectedIds.Append($"\",{dataKey},\",");
    //            }
    //        }

    //        return selectedIds.ToString();
    //    }


    //    public static string GetSelectedCheckboxesLabelsString(ListView listView)
    //    {
    //        var selectedLabels = new StringBuilder();

    //        for (int i = 0; i < listView.Items.Count; i++)
    //        {
    //            var item = listView.Items[i];
    //            var checkbox = item.FindControl("chkSelectat") as CheckBox;
    //            var label = item.FindControl("lblNr") as Label;

    //            if (checkbox != null && checkbox.Checked && label != null)
    //            {
    //                if (selectedLabels.Length > 0)
    //                {
    //                    selectedLabels.Append(", ");
    //                }
    //                selectedLabels.Append(label.Text);
    //            }
    //        }

    //        return selectedLabels.ToString();
    //    }


    //    protected async void btnSalveaza_Click(object sender, EventArgs e)
    //    {
    //        //lblMesaj.Text = GetSelectedCheckboxesIdsString(lvApartamente);
    //        //lblMesaj.Text = GetSelectedCheckboxesLabelsString(lvApartamente);

    //        if (double.TryParse(txtValoareFactura.Text, out var valoareFactura))
    //        {
    //            int IdAsoc;
    //            int IdSc;
    //            if (IdFacturaCG != null)
    //            {
    //                //lblMesaj.Text = "Actualizez!";
    //                tblCG factura = await _alteCheltuieliService.GetByIdAsync(IdFacturaCG.Value);
    //                factura = FacturaDinFormular(ref factura);
    //                await _alteCheltuieliService.UpdateAsync(factura);
    //                tblScari scara = await _scariService.GetByIdAsync(factura.idScara);
    //                IdSc = scara.idScara;
    //                IdAsoc = scara.idAsoc;
    //            }
    //            else
    //            {
    //                tblCG factura = new tblCG();
    //                factura = FacturaDinFormular(ref factura);
    //                await _alteCheltuieliService.AddAsync(factura);
    //                tblScari scara = await _scariService.GetByIdAsync(IdScara.Value);
    //                IdSc = IdScara.Value;
    //                IdAsoc = scara.idAsoc;
    //            }
    //            Response.Redirect(string.Format("/AdminAsoc/InfoScari/AlteCheltuieli.aspx?idAsoc={0}&idScara={1}", IdAsoc, IdSc));
    //        }
    //        else 
    //        {
    //            lblMesaj.Text = "Valoare invalida!";
    //        }                    

    //    }

    //    private tblCG  FacturaDinFormular(ref tblCG factura)
    //    {

    //        double dblValoare;
    //        factura.FacturaCG = txtFactura.Text;

    //        if (double.TryParse(txtValoareFactura.Text, out dblValoare))
    //        {
    //            factura.valoare = dblValoare;
    //        }
    //        else
    //        {
    //            factura.valoare = 0;
    //        }

    //        if (IdScara.HasValue) 
    //        {
    //            factura.idScara = IdScara.Value;
    //        }

    //        factura.explicatie= txtExplicatie.Text;
    //        factura.tiprepartizare = bool.Parse(ddlTipRepartizare.SelectedValue);
    //        factura.Repartizare = GetSelectedCheckboxesIdsString(lvApartamente);
    //        factura.Apartamente = GetSelectedCheckboxesLabelsString(lvApartamente);

    //        return factura;
    //    }

    //    protected void chkAll_CheckedChanged(object sender, EventArgs e)
    //    {
    //        if (chkAll.Checked)
    //        {
    //            CheckAllCheckboxes(lvApartamente);
    //        }
    //        else
    //        {
    //            UncheckAllCheckboxes(lvApartamente);
    //        }

    //    }
    //    public static void CheckAllCheckboxes(ListView listView)
    //    {
    //        foreach (ListViewItem item in listView.Items)
    //        {
    //            var checkbox = item.FindControl("chkSelectat") as CheckBox;
    //            if (checkbox != null)
    //            {
    //                checkbox.Checked = true;
    //            }
    //        }
    //    }

    //    public static void UncheckAllCheckboxes(ListView listView)
    //    {
    //        foreach (ListViewItem item in listView.Items)
    //        {
    //            var checkbox = item.FindControl("chkSelectat") as CheckBox;
    //            if (checkbox != null)
    //            {
    //                checkbox.Checked = false;
    //            }
    //        }
    //    }

    //    public static bool AreAllCheckboxesChecked(ListView listView)
    //    {
    //        foreach (ListViewItem item in listView.Items)
    //        {
    //            var checkbox = item.FindControl("chkSelectat") as CheckBox;
    //            if (checkbox != null && !checkbox.Checked)
    //            {
    //                return false;
    //            }
    //        }
    //        return true;
    //    }

    //    protected void chkSelectat_CheckedChanged(object sender, EventArgs e)
    //    {
    //        if (!AreAllCheckboxesChecked(lvApartamente))
    //        {
    //            var checkAllCheckbox = FindControl("chkAll") as CheckBox;
    //            if (checkAllCheckbox != null)
    //            {
    //                checkAllCheckbox.Checked = false;
    //            }
    //        }
    //        else
    //        {
    //            var checkAllCheckbox = FindControl("chkAll") as CheckBox;
    //            if (checkAllCheckbox != null)
    //            {
    //                checkAllCheckbox.Checked = true;
    //            }

    //        }
    //    }

    //    private void SetCheckAllCheckboxState()
    //    {
    //        var checkAllCheckbox = FindControl("chkAll") as CheckBox;
    //        if (checkAllCheckbox != null)
    //        {
    //            checkAllCheckbox.Checked = AreAllCheckboxesChecked(lvApartamente);
    //        }
    //    }
    //}
}