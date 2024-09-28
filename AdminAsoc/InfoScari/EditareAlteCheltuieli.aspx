<%@ Page Language="C#" AutoEventWireup="true" Async="true" CodeBehind="EditareAlteCheltuieli.aspx.cs" Inherits="WebAppNet472.AdminAsoc.InfoScari.EditareAlteCheltuieli" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Alta cheltuiala</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h3>Factura Alte Cheltuieli</h3>
            <div class="form-group row">
                <label for="txtFactura" class="col-sm-6 col-form-label">Numar factura</label>
                <div class="col-sm-6">
                    <asp:TextBox runat="server" type="text" class="form-control" ID="txtFactura" />
                </div>
            </div>
            <div class="form-group row">
                <label for="txtValoareFactura" class="col-sm-6 col-form-label">Valoare factura</label>
                <div class="col-sm-6">
                    <asp:TextBox runat="server" type="text" class="form-control" ID="txtValoareFactura" />
                </div>
            </div>
            <div class="form-group row">
                <label for="txtExplicatie" class="col-sm-6 col-form-label">Explicație</label>
                <div class="col-sm-6">
                    <asp:TextBox runat="server" type="text" class="form-control" ID="txtExplicatie" />
                </div>
            </div>
            <div class="form-group row">
                <label for="txtExplicatie" class="col-sm-6 col-form-label">Tip repartizare</label>
                <div class="col-sm-6">
                    <asp:DropDownList ID="ddlTipRepartizare" runat="server" class="form-control">
                        <asp:ListItem Value="true">Pe CPI</asp:ListItem>
                        <asp:ListItem Value="false">Pe apartament</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>
            <div class="form-group row">
                 <label for="chkSelectAll" class="col-sm-6 col-form-label">Selecteaza toate apartamentele</label>
                <div class="col-sm-6">
                    <asp:CheckBox ID="chkAll" CssClass="form-control"   runat="server" OnCheckedChanged="chkAll_CheckedChanged" AutoPostBack="true" />
                </div>
                

            </div>
            <div>
                <asp:Label ID="lblMesaj" runat="server" CssClass="alert-danger"></asp:Label>
            </div>

         
            <div style="text-align: center;">
                <!-- start listview-->

                <asp:ListView ID="lvApartamente" runat="server" DataKeyNames="idApart">


                    <LayoutTemplate>
                        <div id="itemPlaceholderContainer" runat="server">
                            <span runat="server" id="itemPlaceholder" />
                        </div>

                    </LayoutTemplate>


                    <EmptyDataTemplate>
                        <span>Nu sunt apartamente.</span>
                    </EmptyDataTemplate>

                    <ItemTemplate>

                        <table style="display: inline-block;" border="1">
                            <tr>
                                <td>
                                    <asp:Label ID="lblNr" runat="server" Width="30px"
                                        Text='<%# Eval("nr") %>'></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox ID="chkSelectat" runat="server" AutoPostBack="true" OnCheckedChanged="chkSelectat_CheckedChanged"  />
                                </td>
                            </tr>
                        </table>


                    </ItemTemplate>

                </asp:ListView>

            </div>
            <div>
                <asp:Button ID="btnSalveaza" runat="server" OnClick="btnSalveaza_Click"
                    Text="Salveaza" CssClass="btn btn-primary" />
            </div>
        </div>
    </form>
</body>
</html>
